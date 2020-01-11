## Description

This problem was asked by Facebook.

Given a list of integers, return the largest product that can be made by multiplying any three integers.

For example, if the list is `[-10, -10, 5, 2]`, we should return `500`, since that's `-10 * -10 * 5`.

You can assume the list has at least three integers.

## Solution
    
```swift
extension Array where Element == Int {
    func winningTrio() -> Int {
        let sorted = self.sorted{ abs($0) > abs($1) }
        
        let maxWithoutNegative = sorted.findLargestWithoutNegative().reduce(1, *)
        let maxWithPairOfNegatives = sorted.findLargestWithPairOfNegative().reduce(1, *)
        
        return Swift.max(maxWithoutNegative, maxWithPairOfNegatives)
    }
    
    // These functions only works if the array is pre-sorted
    internal func findLargestWithoutNegative() -> [Int] {
        let positiveValues = self.filter{ $0 >= 0 }
        
        // If we have less than 3 positive values, then we return 0
        guard positiveValues.count >= 3 else {
            return []
        }
        
        return Array(positiveValues.prefix(3))
    }
    
    internal func findLargestWithPairOfNegative() -> [Int] {
        var result: [Int] = []
        
        var countPositive = 0
        var countNegative = 0
        
        for value in self {
            // Early loop breaker
            if countNegative == 2 && countPositive == 1 {
                return result
            }
            
            if value >= 0 {
                if countPositive == 1 {
                    continue
                } else {
                    result.append(value)
                    countPositive += 1
                }
            } else {
                if countNegative == 2 {
                    continue
                } else {
                    result.append(value)
                    countNegative += 1
                }
            }
        }
        
        return result
    }
}
```

## Test

```swift
class Problem_69Tests: XCTestCase {

    func test_example() {
        let input = [-10, -10, 5, 2]
        
        XCTAssert(input.winningTrio() == 500)
    }

}
```