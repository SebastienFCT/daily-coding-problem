## Description

This problem was asked by Microsoft.

Given an array of positive integers, divide the array into two subsets such that the difference between the sum of the subsets is as small as possible.

For example, given `[5, 10, 15, 20, 25]`, return the sets `{10, 25}` and `{5, 15, 20}`, which has a difference of 5, which is the smallest possible difference.

## Solution

```swift
extension Array where Element == Int {
    
    func pairWithSmallestDifference() -> (diff: Int, left: [Int], right: [Int]) {
        
        return pairWithMininmumDiff(currentIndex: count, left: [], right: [], currentTotal: 0, total: self.reduce(0, +))
    }
    
    private func pairWithMininmumDiff(currentIndex: Int, left: [Int], right: [Int], currentTotal: Int, total: Int) -> (diff: Int, left: [Int], right: [Int]) {
        
        if currentIndex == 0 {
            let diff = abs((total - currentTotal) - currentTotal)
            return (diff, left, right)
        }
        
        var newLeft = left
        newLeft.append(self[currentIndex-1])
        
        var newRight = right
        newRight.append(self[currentIndex-1])
        
        let leftChoice = pairWithMininmumDiff(currentIndex: currentIndex-1, left: newLeft, right: right, currentTotal: currentTotal + self[currentIndex-1], total: total)
        let rightChoice = pairWithMininmumDiff(currentIndex: currentIndex-1, left: left, right: newRight, currentTotal: currentTotal, total: total)
        
        return leftChoice.diff < rightChoice.diff ? leftChoice : rightChoice
    }
    
}
```

## Test

```swift
class Problem_186Tests: XCTestCase {

    func test_example() {
        let result = [5, 10, 15, 20, 25].pairWithSmallestDifference()
        print(result)
        
        XCTAssert(result.diff == 5)
    }

}
```