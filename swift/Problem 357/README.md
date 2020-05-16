## Description

This problem was asked by LinkedIn.

You are given a binary tree in a peculiar string representation. Each node is written in the form `(lr)`, where `l` corresponds to the left child and `r` corresponds to the right child.

If either l or r is null, it will be represented as a zero. Otherwise, it will be represented by a new `(lr)` pair.

Here are a few examples:

- A root node with no children: `(00)`
- A root node with two children: `((00)(00))`
- An unbalanced tree with three consecutive left children: `((((00)0)0)0)`

Given this representation, determine the depth of the tree.

## Solution

```swift
extension String {
    
    func treeDepth() -> Int {
        
        let stripped = filter{ $0 == "(" || $0 == ")" }
        
        var leftCount = 0
        var rightCount = 0
        
        for i in 0..<stripped.count {
            if stripped[i] == "(" {
                leftCount += 1
            } else {
                break
            }
        }
        
        for i in stride(from: stripped.count-1, through: 0, by: -1) {
            if stripped[i] == ")" {
                rightCount += 1
            } else {
                break
            }
        }
        
        return Swift.max(leftCount, rightCount) - 1
    }
}
```

## Tests

```swift
class Problem_357Tests: XCTestCase {

    func test_example() {
        
        XCTAssert("(00)".treeDepth() == 0)
        XCTAssert("((00)(00))".treeDepth() == 1)
        XCTAssert("((((00)0)0)0)".treeDepth() == 3)
    }

}
```