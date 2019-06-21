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

This is a problem I partially solved when I implemented a breadcrumb component for iOS and Android.
 
Basically we start by creating our custom class that is serializable & de-serializable

```swift
class Node {
    var val: String
    
    init(val: String) {
        self.val = val
    }
    
    func serialize() -> String {
        return "\(self.val)"
    }
}
 
extension String {
    func deserialize() -> Node {
        return Node(self)
    }
}
```

Since we're building a binary tree, each node should hold a reference to two branches
 
At this point, we need to setup serialization rules that will help us deserializing a string into a node

Let's set the following rules:
- serialized nodes are separated by an empty space (so a serialized node looks like this: `ROOT BRANCH1 BRANCH2`
- Since a node's branch can be null, we will represent a null reference using an underscore _ (this implies that our node cannot have an underscore in their value, which is probably not good but it will be enough for this exercise).


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
    func deserialize() -> Node {
        return Node(self)
    }
}
```

We now must update the `deserialize()` function to support the new node structure:
 
- We can split the initial string into an array of string based on our separator character (an empty space)
- For each string in the array,
    - if it's an underscore, we return nil
    - if it's a valid string, we create a node out of it and we assume the next two nodes correspond to its branches

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