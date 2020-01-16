## Description

This problem was asked by Facebook.

Given an array of numbers of length `N`, find both the minimum and maximum using less than `2 * (N - 2)` comparisons.

## Solution

```swift
extension Array where Element == Int {
    
    func minMax() -> (min: Int, max: Int, comparisonCount: Int) {
        
        guard count > 0 else {
            fatalError("array is empty")
        }
        
        var comparisonCount = 0
        var min = self[0]
        var max = self[0]
        
        for i in 1..<count {
            if self[i] < min {
                comparisonCount += 1
                min = self[i]
            } else if self[i] > max {
                comparisonCount += 1
                max = self[i]
            }
        }
        
        return (min, max, comparisonCount)
    }
}
```

## Tests

```swift
class Problem_235Tests: XCTestCase {

    func test_min_max() {
        
        var input: [Int] = []
        
        for _ in 1...100 {
            input.append(Int.random(in: -50...50))
        }
        
        let actual = input.minMax()
        
        XCTAssert(actual.comparisonCount < 2*(input.count-2))
        XCTAssert(actual.min == input.min())
        XCTAssert(actual.max == input.max())
    }

}
```