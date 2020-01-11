## Description

This problem was asked by Google.

Given pre-order and in-order traversals of a binary tree, write a function to reconstruct the tree.

For example, given the following preorder traversal:

`[a, b, d, e, c, f, g]`

And the following inorder traversal:

`[d, b, e, a, f, c, g]`

You should return the following tree:

```
    a
   / \
  b   c
 / \ / \
d  e f  g
```

## Solution

```swift
class Node {
    var value: String
    var parent: Node?
    var left: Node?
    var right: Node?
    
    init(triple: [Node]) {
        guard triple.count == 3 else {
            fatalError("init requires 3 elements")
        }
        
        value = triple[0].value
        left = triple[1]
        right = triple[2]
    }
    
    init(value: String) {
        self.value = value
        self.parent = nil
        self.left = nil
        self.right = nil
    }
}

extension Array where Element == String {
    func toNodes() -> [Node] {
        var result: [Node] = []
        
        for element in self {
            result.append(Node(value: element))
        }
        
        return result
    }
}

struct GoogleChallenge {
    var preorder: [String]
    var inorder: [String]
    var root: Node? = nil

    
    func treeLength() -> Int {
        var result = 0
        
        for element in preorder {
            if element == inorder[0] {
                return result
            }
            
            result += 1
        }
        
        return result
    }
}

extension GoogleChallenge {
    func buildChildren(children: [Node], preorder: [Node]) -> [Node] {
        var result: [Node] = []
        
        var childrenCopy = children
        var preorderCopy = preorder
        
        if children.isEmpty {
            let groupCount = 2*(treeLength()-1)
            
            for _ in 0..<groupCount {
                let suffix = Array(preorderCopy.suffix(3))
                let node = Node(triple: suffix)
                result.insert(node, at: 0)
                
                preorderCopy.removeLast()
                preorderCopy.removeLast()
                preorderCopy.removeLast()
            }
        } else {
            for _ in 0..<children.count/2 {
                let node = preorderCopy.suffix(1)[0]
                
                let leftAndRight = childrenCopy.suffix(2)
                node.left = leftAndRight[0]
                node.right = leftAndRight[1]
                
                preorderCopy.removeLast()
                childrenCopy.removeLast()
                childrenCopy.removeLast()
                
                result.insert(node, at: 0)
            }
        }
        
        if result.count == 1 {
            return result
        } else {
            return buildChildren(children: result, preorder: preorderCopy)
        }
    }
}
```
## Test

```swift
class Problem_48Tests: XCTestCase {

    func test_example() {
        let preorder = ["a", "b", "d", "e", "c", "f", "g"]
        let inorder = ["d", "b", "e", "a", "f", "c", "g"]
        
        var instance = GoogleChallenge(preorder: preorder, inorder: inorder, root: nil)
        instance.root = instance.buildChildren(children: [], preorder: instance.preorder.toNodes())[0]
        
        XCTAssert(instance.root?.value == "a")
        XCTAssert(instance.root?.left?.value == "b")
        XCTAssert(instance.root?.right?.value == "c")
        XCTAssert(instance.root?.left?.left?.value == "d")
        XCTAssert(instance.root?.left?.right?.value == "e")
        XCTAssert(instance.root?.right?.left?.value == "f")
        XCTAssert(instance.root?.right?.right?.value == "g")
    }

}
```