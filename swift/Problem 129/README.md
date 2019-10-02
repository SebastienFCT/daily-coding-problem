## Description

Given a real number n, find the square root of n. For example, given n = 9, return 3.

## Solution

```swift
extension Float {
    func findSquareRoot() -> Float {
        var current: Float = 1
        var limit: Float = self
        
        while current <= limit {
            let mid = (current + limit) / 2
            
            switch (mid * mid) {
            case self: return mid
            case let value where value < self: current = mid + 1
            default: limit = mid - 1
            }
        }
        
        return current
    }
}
```

## Test

```swift
class Problem_129Tests: XCTestCase {

    func test_square_root() {
        XCTAssert(Float(exactly: 175)!.squareRoot().rounded() - Float(exactly: 175)!.findSquareRoot().rounded() <= 1)
        XCTAssert(Float(exactly: 22)!.squareRoot().rounded() - Float(exactly: 22)!.findSquareRoot().rounded() <= 1)
        XCTAssert(Float(exactly: 1223)!.squareRoot().rounded() - Float(exactly: 1223)!.findSquareRoot().rounded() <= 1)
    }

}
```