### Description

This problem was asked by Google.

Suppose we represent our file system by a string in the following manner:

The string `"dir\n\tsubdir1\n\tsubdir2\n\t\tfile.ext"` represents:  

```
dir
    subdir1
    subdir2
        file.ext
```

The directory `dir` contains an empty sub-directory `subdir1` and a sub-directory `subdir2` containing a file `file.ext`.

The string `"dir\n\tsubdir1\n\t\tfile1.ext\n\t\tsubsubdir1\n\tsubdir2\n\t\tsubsubdir2\n\t\t\tfile2.ext"` represents:

```
dir
    subdir1
        file1.ext
        subsubdir1
    subdir2
        subsubdir2
            file2.ext
```

The directory `dir` contains two sub-directories `subdir1` and `subdir2`. `subdir1` contains a file `file1.ext` and an empty second-level sub-directory `subsubdir1`. `subdir2` contains a second-level sub-directory `subsubdir2` containing a file `file2.ext`.

We are interested in finding the longest (number of characters) absolute path to a file within our file system. For example, in the second example above, the longest absolute path is `"dir/subdir2/subsubdir2/file2.ext"`, and its length is 32 (not including the double quotes).

Given a string representing the file system in the above format, return the length of the longest absolute path to a file in the abstracted file system. If there is no file in the system, return 0.

Note:

The name of a file contains at least a period and an extension.

The name of a directory or sub-directory will not contain a period.

### Solution

```swift
struct FileSystem {
    var root: Item? = nil
    
    init() {
        self.root = nil
    }
    
    mutating func buildFileSystemFromString(_ string: String) {
        var rootVal = ""
        var string = string
            .replacingOccurrences(of: "\n", with: "\\n")
            .replacingOccurrences(of: "\t", with: "\\t")
        
        print(string)
        
        if string.isEmpty {
            root = Item(parent: nil, name: "", level: 1)
            return
        }
        
        while string.first! != "\\" {
            rootVal += String(string.first!)
            string = String(string.dropFirst())
            
            if string.isEmpty {
                root = Item(parent: nil, name: rootVal, level: 1)
                return
            }
        }
        
        root = Item(parent: nil, name: rootVal, level: 1)
        root!.buildChildren(withString: string)
    }
    
    func longestPath() -> String {
        
        if let root = root {
            return root.longestPath(true)
        }
        
        return ""
    }
}

class Item {
    var parent: Item? = nil
    var name: String
    var level: Int
    var children: [Item] = []
    
    init(parent: Item?, name: String, level: Int) {
        self.parent = parent
        self.name = name
        self.level = level
    }
    
    func buildChildren(withString string: String) {
        var string = string
        var previous = self
        
        if string.isEmpty {
            return
        }
        
        while !string.isEmpty {
            if String(string.prefix(2 + 2 * previous.level)) != "\\n\(String(repeating: "\\t", count: previous.level))" {
                
                if let parent = previous.parent {
                    previous = parent
                    continue
                } else {
                    fatalError("could not identify parent")
                }
            } else {
                string = String(string.dropFirst(2 + 2 * previous.level))
                
                var rest = string.split(separator: "\\", maxSplits: 1, omittingEmptySubsequences: true)
                
                let item = Item(parent: previous, name: String(rest[0]), level: previous.level + 1)
                previous.children.append(item)
                previous = item
                
                string = String(string.dropFirst(rest[0].count))
            }
        }
    }
    
    func longestPath(_ isRoot: Bool) -> String {
        if !children.isEmpty {
            var possibilities: [String] = []
            for child in children {
                possibilities.append("\((isRoot ? "" : "/"))\(name)\(child.longestPath(false))")
            }
            
            possibilities.sort{ $0.count > $1.count }
            return possibilities.first!
        }
        
        return "\((isRoot ? "" : "/"))\(name)"
    }
}
```

#### Tests

```swift
class Problem_17Tests: XCTestCase {

    func testExample() {
        let input = "dir\n\tsubdir1\n\tsubdir2\n\t\tfile.ext"
        var fileSystem = FileSystem()
        fileSystem.buildFileSystemFromString(input)
        
        XCTAssert(fileSystem.longestPath() == "dir/subdir2/file.ext")
    }
    
    func testExample2() {
        let input = "dir\n\tsubdir1\n\t\tfile1.ext\n\t\tsubsubdir1\n\tsubdir2\n\t\tsubsubdir2\n\t\t\tfile2.ext"
        var fileSystem = FileSystem()
        fileSystem.buildFileSystemFromString(input)
        
        XCTAssert(fileSystem.longestPath() == "dir/subdir2/subsubdir2/file2.ext")
    }

}
```