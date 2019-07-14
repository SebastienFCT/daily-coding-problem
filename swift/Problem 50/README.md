## Description

This problem was asked by Microsoft.

Suppose an arithmetic expression is given as a binary tree. Each leaf is an integer and each internal node is one of '+', '−', '∗', or '/'.

Given the root to such a tree, write a function to evaluate it.

For example, given the following tree:

```
    *
   / \
  +    +
 / \  / \
3  2  4  5
```

You should return 45, as it is (3 + 2) * (4 + 5).

## Solution

Ok first we will define our tree structure

```swift
class Node {
    var value: Double?
    var operation: Character?
    
    var left: Node?
    var right: Node?
    
    init(value: Double) {
        self.value = value
        self.operation = nil
    }
    
    init(operation: Character) {
        self.value = nil
        self.operation = operation
    }
}
```

With this simple structure we can build a tree based of node having up to two children and holding reference to either a character that represent the operation to apply or an double
 
Let's build a function that determines the value of a node:

- if the node has a value, it returns it
- if the node doesn't have a value, it returns the operation of its children

```swift
extension Node {
    func getValue() -> Double {
        
        if let value = value {
            return value
        }
        
        if let operation = operation, let right = right, let left = left {
            switch operation {
            case "+":
                return left.getValue() + right.getValue()
            case "-":
                return left.getValue() - right.getValue()
            case "*":
                return left.getValue() * right.getValue()
            case "/":
                return left.getValue() / right.getValue()
            default:
                fatalError("operation unknown")
            }
        }
        
        fatalError("operation, left or right was missing")
    }
}
```

## Test

```swift
class Problem_50Tests: XCTestCase {

    func test_example() {
        let tree = Node(operation: "*")
        
        let left = Node(operation: "+")
        let right = Node(operation: "+")
        
        let leftleft = Node(value: 3)
        let leftright = Node(value: 2)
        let rightleft = Node(value: 4)
        let rightright = Node(value: 5)
        
        left.left = leftleft
        left.right = leftright
        right.left = rightleft
        right.right = rightright
        
        tree.left = left
        tree.right = right
        
        XCTAssert(tree.getValue() == 45)
    }

}
```