## Description

This problem was asked by Google.

Given a sorted list of integers, square the elements and give the output in sorted order.

For example, given [-9, -2, 0, 2, 3], return [0, 4, 4, 9, 81].

## Solution

```swift
extension Array where Element == Int {
    func squareAndSort() -> [Int] {
        return self.map{ $0 * $0 }.sorted()
    }
}
```

## Test

```swift
class Problem_118Tests: XCTestCase {

    func test_example() {
        let input = [-9, -2, 0, 2, 3]
        
        XCTAssert(input.squareAndSort() == [0, 4, 4, 9, 81])
    }

}
```