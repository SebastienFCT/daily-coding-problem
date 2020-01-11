## Description

This problem was asked by Facebook.

Given three 32-bit integers x, y, and b, return x if b is 1 and y if b is 0, using only mathematical or bit operations. You can assume b can only be 1 or 0.

## Solution

```swift
struct FacebookChallenge {
    static func binarySelection(x: Int32, y: Int32, b: Int32) -> Int32 {
        return (b * x) + (abs(1-b) * y)
    }
}
```

## Test

```swift
class Problem_85Tests: XCTestCase {

    func test_binarySelection() {
        XCTAssert(FacebookChallenge.binarySelection(x: 10, y: 20, b: 0) == 20)
        XCTAssert(FacebookChallenge.binarySelection(x: 10, y: 20, b: 1) == 10)
        
        XCTAssert(FacebookChallenge.binarySelection(x: 12764, y: 87364, b: 0) == 87364)
        XCTAssert(FacebookChallenge.binarySelection(x: 456, y: 123556, b: 1) == 456)
    }

}
```