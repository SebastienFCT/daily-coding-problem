## Description

This problem was asked by Google.

Given the root to a binary tree, implement `serialize(root)`, which serializes the tree into a string, and `deserialize(s)`, which deserializes the string back into the tree.

For example, given the following Node class

```
class Node:
    def __init__(self, val, left=None, right=None):
        self.val = val
        self.left = left
        self.right = right
```

The following test should pass:

```
node = Node('root', Node('left', Node('left.left')), Node('right'))
assert deserialize(serialize(node)).left.left.val == 'left.left'
```

## Solution

```swift
class Node {
    var val: String
    var left: Node? = nil
    var right: Node? = nil
    
    init(_ val: String, _ left: Node? = nil, _ right: Node? = nil) {
        self.val = val
        self.left = left
        self.right = right
    }
    
    func serialize() -> String {
        return "\(self.val) \((self.left?.serialize() ?? "_")) \((self.right?.serialize() ?? "_")) "
    }
}

extension String {
    func deserialize() -> Node? {
        var splitted = self.split(separator: " ")
        
        return splitted.deserialize()
    }
}

extension Array where Element == Substring {
    mutating func deserialize() -> Node? {
        if self.isEmpty {
            return nil
        }
        
        let element = self.removeFirst()
        
        if element == "_" {
            return nil
        }
        
        while self.count > 0 {
            let node = Node(String(element))
            node.left = deserialize()
            node.right = deserialize()
            
            return node
        }
        
        return nil
    }
}

```

## Tests

```swift
class Problem_3Tests: XCTestCase {

    func testExample() {
        let node = Node("root", Node("left", Node("left.left")), Node("right"))
        
        let serialized = node.serialize()
        let deserialized = serialized.deserialize()
        
        if let value = deserialized?.left?.left?.val {
            XCTAssert(value == "left.left")
        } else {
            XCTFail()
        }
    }
}
```