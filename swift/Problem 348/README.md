## Description

This problem was asked by Zillow.

A ternary search tree is a trie-like data structure where each node may have up to three children. Here is an example which represents the words `code`, `cob`, `be`, `ax`, `war`, and `we`.

```
       c
    /  |  \
   b   o   w
 / |   |   |
a  e   d   a
|    / |   | \ 
x   b  e   r  e  
```

The tree is structured according to the following rules:

- left child nodes link to words lexicographically earlier than the parent prefix
- right child nodes link to words lexicographically later than the parent prefix
- middle child nodes continue the current word

For instance, since code is the first word inserted in the tree, and cob lexicographically precedes `cod`, `cob` is represented as a left child extending from `cod`.

Implement insertion and search functions for a ternary search tree.

## Solution

```swift
class Node {
    var value: Character
    var left: Node?
    var center: Node?
    var right: Node?
    
    init(value: Character) {
        self.value = value
        self.left = nil
        self.center = nil
        self.right = nil
    }
    
    func search(word: String, current: [Node]) -> [Node]? {
        
        guard let firstCharacter = word.first else {
            return current
        }
        
        var newCurrent = current
        newCurrent.append(self)
        
        if value > firstCharacter {
            return left?.search(word: word, current: newCurrent)
        } else if value < firstCharacter {
            return right?.search(word: word, current: newCurrent)
        } else {
            if word.count == 1 {
                return newCurrent
            } else {
                return center?.search(word: String(word.suffix(word.count-1)), current: newCurrent)
            }
        }
    }
    
    func insert(word: String) {
        
        guard let firstCharacter = word.first else {
            return
        }
        
        if center == nil {
            
            let node = Node(value: firstCharacter)
            self.center = node
            self.center!.insert(word: String(word.suffix(word.count-1)))
            
        } else {
            
            if firstCharacter > value {
                
                if let right = right {
                    right.insert(word: word)
                } else {
                    let node = Node(value: firstCharacter)
                    self.right = node
                    self.right!.insert(word: String(word.suffix(word.count-1)))
                }
                
            } else if firstCharacter < value {
                
                if let left = left {
                    left.insert(word: word)
                } else {
                    let node = Node(value: firstCharacter)
                    self.left = node
                    self.left!.insert(word: String(word.suffix(word.count-1)))
                }
                
            } else {
                
                if let center = center {
                    center.insert(word: word)
                } else {
                    let node = Node(value: firstCharacter)
                    self.center = node
                    self.center!.insert(word: String(word.suffix(word.count-1)))
                }
                
            }
        }
    }
}

struct TernaryTree {
    
    var root: Node? = nil
    
    func search(word: String) -> [Node]? {
        
        return root?.search(word: word, current: [])
    }
    
    mutating func insert(word: String) {
        
        guard let firstCharacter = word.first else {
            return
        }
        
        if let root = root {
            root.insert(word: word)
        } else {
            
            let node = Node(value: firstCharacter)
            self.root = node
            self.root!.insert(word: String(word.suffix(word.count-1)))
        }
    }
}
```

## Tests

```swift
class Problem_348Tests: XCTestCase {

    func test_example() {
        
        var tt = TernaryTree()
        
        XCTAssertNil(tt.root)
        
        tt.insert(word: "code")
        
        if let codeSearch = tt.search(word: "code") {
            XCTAssert(codeSearch.map{ $0.value } == ["c", "o", "d", "e"])
        }
        
        XCTAssertNil(tt.search(word: "cob"))
        
        tt.insert(word: "cob")
        tt.insert(word: "be")
        tt.insert(word: "ax")
        tt.insert(word: "war")
        tt.insert(word: "we")
        
        if let warSearch = tt.search(word: "war") {
            XCTAssert(warSearch.map{ $0.value } == ["c", "w", "a", "r"])
        } else {
            XCTFail("Couldn't find 'war'")
        }
        
        if let axSearch = tt.search(word: "ax") {
            XCTAssert(axSearch.map{ $0.value } == ["c", "b", "a", "x"])
        } else {
            XCTFail("Couldn't find 'ax'")
        }
    }

}
```