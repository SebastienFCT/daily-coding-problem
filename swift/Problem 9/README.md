### Description

This problem was asked by Airbnb.

Given a list of integers, write a function that returns the largest sum of non-adjacent numbers. Numbers can be `0` or negative.

For example, `[2, 4, 6, 2, 5]` should return `13`, since we pick `2`, `6`, and `5`. `[5, 1, 1, 5]` should return `10`, since we pick `5` and `5`.

Follow-up: Can you do this in O(N) time and constant space?

### Solution

```swift
extension Array where Element == Int {
    
    func largestSumWithNonAdjacent() -> Int {
        var reversed = Array(self)
        reversed.reverse()
        
        return Swift.max(self.findLargestSumOfNonAdjacent(), reversed.findLargestSumOfNonAdjacent())
    }
    
    func findLargestSumOfNonAdjacent() -> Int {
        var copy = Array(self)
        
        if copy.count == 0 {
            return 0
        }
        
        if copy.count == 1 {
            return copy.first!
        }
        
        if copy.count == 2 {
            return Swift.max(copy.first!, copy.last!)
        }
        
        if copy[0] > copy[1] {
            return copy[0] + Array(copy[2...copy.count - 1]).findLargestSumOfNonAdjacent()
        } else {
            if copy.count > 3 {
                return copy[1] + Array(copy[3...copy.count - 1]).findLargestSumOfNonAdjacent()
            } else {
                return Swift.max(copy[1], copy[0] + copy[2])
            }
        }
    }
}
```