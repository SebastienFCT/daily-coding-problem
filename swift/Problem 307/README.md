## Description

This problem was asked by Oracle.

Given a binary search tree, find the floor and ceiling of a given integer. The floor is the highest element in the tree less than or equal to an integer, while the ceiling is the lowest element in the tree greater than or equal to an integer.

If either value does not exist, return None.

## Solution

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
    
    init(value: Int) {
        self.value = value
        self.left = nil
        self.right = nil
    }
}

struct Tree {
    
    var root: Node
    
    func floorAndCeiling(value: Int) -> (floor: Node?, ceil: Node?) {
        
        let allValues = valuesByLevel()
        var floor: Node? = nil
        var ceil: Node? = nil
        
        for level in allValues {
            
            for node in level {
                if floor == nil {
                    if node.value <= value {
                        floor = node
                    }
                }
                
                if node.value >= value {
                    ceil = node
                }
            }
        }
        
        return (floor, ceil)
    }
    
    private func valuesByLevel() -> [[Node]] {
        
        var result: [[Node]] = [[root]]
        var currentIndex = 0
        
        while currentIndex <= result.count {
            
            var next: [Node] = []
            
            for node in result[currentIndex] {
                if let left = node.left {
                    next.append(left)
                }
                
                if let right = node.right {
                    next.append(right)
                }
            }
            
            if !next.isEmpty {
                result.append(next)
                currentIndex += 1
            } else {
                currentIndex += 2
            }
        }
        
        return result
    }
}
```

## Tests

```swift
class Problem_307Tests: XCTestCase {

    func test_tree_floor_and_ceil() {
        
        let root = Node(value: 8
            , left: Node(value: 3
                , left: Node(value: 1)
                , right: Node(value: 6
                    , left: Node(value: 4)
                    , right: Node(value: 7)
                )
            )
            , right: Node(value: 10
                , left: nil
                , right: Node(value: 14, left: Node(value: 13), right: nil)
            )
        )
        
        let bt = Tree(root: root)
        
        let actual = bt.floorAndCeiling(value: 6)
        XCTAssert(actual.floor?.value == 3)
        XCTAssert(actual.ceil?.value == 13)
    }

}
```