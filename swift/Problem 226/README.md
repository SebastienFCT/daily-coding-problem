## Description

This problem was asked by Airbnb.

You come across a dictionary of sorted words in a language you've never seen before. Write a program that returns the correct order of letters in this language.

For example, given `['xww', 'wxyz', 'wxyw', 'ywx', 'ywz']`, you should return `['x', 'z', 'w', 'y']`.


## Solution

```swift
class Node {
    var value: Character
    var next: Node?
    
    init(value: Character) {
        self.value = value
        self.next = nil
    }
    
    func printableTree() -> String {
        var result = "\(value)"
        
        var current: Node? = self
        
        while current?.next != nil {
            current = current?.next
            result = "\(result)->\(current!.value)"
        }
        
        return result
    }
}

struct Language {
    var nodes: [Node]
    var root: Node?
    var compared: [(Character, Character)]
    
    mutating func process(words: [String]) {
        
        for i in 0..<words.count-1 {
            for j in i+1..<words.count {
                compare(word1: words[i], word2: words[j])
            }
        }
    }
    
    mutating func compare(word1: String, word2: String) {
        let minimum = min(word1.count, word2.count) - 1
        
        for i in 0...minimum {
            
            if !nodes.contains(where: { (item) -> Bool in
                item.value == word1[i]
            }) {
                nodes.append(Node(value: word1[i]))
            }
            
            if !nodes.contains(where: { (item) -> Bool in
                item.value == word2[i]
            }) {
                nodes.append(Node(value: word2[i]))
            }
            
            if word1[i] == word2[i] {
                continue
            }
            
            var node1: Node? = nil
            var node2: Node? = nil
            
            for j in 0..<nodes.count {
                if nodes[j].value == word1[i] {
                    node1 = nodes[j]
                }
                
                if nodes[j].value == word2[i] {
                    node2 = nodes[j]
                }
                
                if node1 != nil && node2 != nil {
                    break
                }
            }
            
            if root == nil {
                root = node1
            }
            
            if node1?.next == nil {
                compared.append((node1!.value, node2!.value))
                
                for node in nodes {
                    if node.next?.value == node2?.value {
                        node1?.next = node2?.next
                        node.next = node1
                        break
                    }
                }
                
                node1?.next = node2
            } else {
                
                if compared.contains(where: { (item) -> Bool in
                    item.0 == node1?.value && item.1 == node2?.value
                }) {
                    break
                }
                
                if node1?.next?.value == node2?.value {
                    break
                }
                
                var next = node1?.next
                
                while next?.next != nil {
                    if next?.next?.value == root?.value {
                        next?.next = node2
                        break
                    }
                    
                    next = next?.next
                }
                
                next?.next = node2
                compared.append((node1!.value, node2!.value))
            }
            
            break
            
        }
    }
}

// MARK: - Utilities

extension StringProtocol {
    subscript(offset: Int) -> Character { self[index(startIndex, offsetBy: offset)] }
    subscript(range: CountableRange<Int>) -> SubSequence {
        let startIndex = index(self.startIndex, offsetBy: range.lowerBound)
        return self[startIndex..<index(startIndex, offsetBy: range.count)]
    }
    subscript(range: ClosedRange<Int>) -> SubSequence {
        let startIndex = index(self.startIndex, offsetBy: range.lowerBound)
        return self[startIndex..<index(startIndex, offsetBy: range.count)]
    }
    subscript(range: CountablePartialRangeFrom<Int>) -> SubSequence { self[index(startIndex, offsetBy: range.lowerBound)...] }
    subscript(range: PartialRangeThrough<Int>) -> SubSequence { self[...index(startIndex, offsetBy: range.upperBound)] }
    subscript(range: PartialRangeUpTo<Int>) -> SubSequence { self[..<index(startIndex, offsetBy: range.upperBound)] }
}
```

## Test

```swift
class Problem_226Tests: XCTestCase {

    func test_example() {
        
        var language = Language(nodes: [], root: nil, compared: [])
        language.process(words: ["xww", "wxyz", "wxyw", "ywx", "ywz"])
        
        let expected = "x->z->w->y"
        let actual = language.root?.printableTree()
        
        XCTAssert(actual == expected)
    }

}
```