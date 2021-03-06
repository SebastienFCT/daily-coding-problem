## Description

This problem was asked by Dropbox.

Given the root to a binary search tree, find the second largest node in the tree.

## Solution


```swift
class Node {
    var value: String
    var left: Node? = nil
    var right: Node? = nil
    
    init(value: String, left: Node?, right: Node?) {
        self.value = value
        self.left = left
        self.right = right
    }
    
    func maxLengh() -> Int {
        
        if let left = left, let right = right {
            return 1 + max(left.maxLengh(), right.maxLengh())
        }
        
        if let left = left {
            return 1 + left.maxLengh()
        }
        
        if let right = right {
            return 1 + right.maxLengh()
        }
        
        return 0
    }
    
    func nextLargestNode() -> Node? {
        if let left = left, let right = right {
            let leftSize = left.maxLengh()
            let rightSize = right.maxLengh()
            
            return leftSize > rightSize ? left : right
        }
        
        if let left = left {
            return left
        }
        
        if let right = right {
            return right
        }
        
        return nil
    }
}
```

## Tests

```swift
class Problem_36Tests: XCTestCase {

    func test_1() {
        let input = Node(
            value: "root"
            , left: Node(value: "left", left: nil, right: nil)
            , right: Node(
                value: "right"
                , left: Node(
                    value: "right.left"
                    , left: nil
                    , right: Node(value: "right.left.right", left: nil, right: nil))
                , right: Node(
                    value: "right.right"
                    , left: Node(
                        value: "right.right.left"
                        , left: nil
                        , right: Node(value: "right.right.left.right", left: nil, right: nil))
                    , right: nil)))
        
        print(input.maxLengh())
    }
    
    func test_2() {
        let input = Node(
            value: "root"
            , left: Node(value: "left", left: nil, right: nil)
            , right: Node(
                value: "right"
                , left: Node(
                    value: "right.left"
                    , left: nil
                    , right: Node(value: "right.left.right", left: nil, right: nil))
                , right: Node(
                    value: "right.right"
                    , left: Node(
                        value: "right.right.left"
                        , left: nil
                        , right: Node(value: "right.right.left.right", left: nil, right: nil))
                    , right: nil)))
        
        XCTAssert(input.nextLargestNode()!.value == "right")
    }

}
```