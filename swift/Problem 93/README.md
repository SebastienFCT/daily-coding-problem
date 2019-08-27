## Description

Good morning! Here's your coding interview problem for today.

This problem was asked by Apple.

Given a tree, find the largest tree/subtree that is a BST.

Given a tree, return the size of the largest tree/subtree that is a BST.

## Solution

We assume that it's a tree with 2 children and integers as value
 
A BST is a tree where each node on the right subtree is larger than the current node & each node on the left subtree is smaller than the current node

```swift
class Node {
    var value: Int
    var left: Node?
    var right: Node?
    
    init(value: Int, left: Node?, right: Node?) {
        self.value = value
        self.left = left
        self.right = right
    }
}

extension Node {
    
    func largestBstSize() -> Int {
        
        if left == nil && right == nil {
            return 1
        }
        
        var currentCount = 1
        let leftCount = (left != nil ? left!.largestBstSize() : 0)
        let rightCount = (right != nil ? right!.largestBstSize() : 0)
        
        if left != nil {
            if left!.value > value {
                currentCount = 0
            } else {
                if right != nil {
                    if right!.value < value {
                        currentCount = 0
                    } else {
                        currentCount += left!.largestBstSize() + right!.largestBstSize()
                    }
                }
            }
        } else {
            if right != nil {
                if right!.value < value {
                    currentCount = 0
                } else {
                    currentCount += right!.largestBstSize()
                }
            }
        }
        
        return max(currentCount, leftCount, rightCount)
    }
}
```

## Test

```swift
class Problem_93Tests: XCTestCase {

    func test_simple_tree() {
        let tree = Node(
            value: 10
            , left: Node(
                value: 9
                , left: nil
                , right: nil)
            , right: Node(
                value: 11
                , left: nil
                , right: Node(
                    value: 12
                    , left: nil
                    , right: nil
                )
            )
        )
        XCTAssert(tree.largestBstSize() == 4)
        
        let tree2 = Node(
            value: 10
            , left: Node(
                value: 9
                , left: nil
                , right: nil)
            , right: Node(
                value: 11
                , left: nil
                , right: Node(
                    value: 8
                    , left: nil
                    , right: nil
                )
            )
        )
        XCTAssert(tree2.largestBstSize() == 3)
    }
    
    func test_multiple_level() {
        let tree = Node(
            value: 5
            , left: Node(
                value: 10
                , left: nil
                , right: nil)
            , right: Node(
                value: 4
                , left: Node(value: 3
                    , left: nil
                    , right: nil)
                , right: Node(value: 5
                    , left: nil
                    , right: nil
                )
            )
        )
        XCTAssert(tree.largestBstSize() == 3)
    }

}
```