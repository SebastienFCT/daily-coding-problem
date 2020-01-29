## Description

This problem was asked by PayPal.

Given a binary tree, determine whether or not it is height-balanced. A height-balanced binary tree can be defined as one in which the heights of the two subtrees of any node never differ by more than one.

## Solution

```swift
func max(left: Int, right: Int) -> Int {
    
    return (left + right + abs(left - right)) / 2
}
```

## Tests

```swift
class Problem_248Tests: XCTestCase {

    func test_max() {
        
        let expected = 23
        let actual = max(left: 23, right: 21)
        
        XCTAssert(expected == actual)
    }
    
    func test_max_2() {

        let expected = 23
        let actual = max(left: 21, right: 23)

        XCTAssert(expected == actual)
    }

    func test_max_3() {

        let expected = 2
        let actual = max(left: 2, right: -10)

        XCTAssert(expected == actual)
    }
    
    func test_max_4() {

        let expected = -2
        let actual = max(left: -2, right: -10)

        XCTAssert(expected == actual)
    }

}
```