## Description

This problem was asked by Google.

Given a list of integers S and a target number k, write a function that returns a subset of S that adds up to k. If such a subset cannot be made, then return null.

Integers can appear more than once in the list. You may assume all numbers in the list are positive.

For example, given `S = [12, 1, 61, 5, 9, 2]` and `k = 24`, return `[12, 9, 2, 1]` since it sums up to `24`.

## Solution


```swift
extension Array where Element == Int {
    
    // The function tries to find an element that is equals to the sum `forSum`
    // If it doesn't find one, it adds the element to a list of sum element already tested and tries with the next element
    func subset(forSum: Int, andList: [Int]) -> [Int]? {
        
        // Each element is a potential combination
        for i in 0..<self.count {
            // We create a copy that we can mutate
            var copy = self
            
            // We update our list of elements
            var newList = andList
            newList.append(copy[i])
            
            // We substract the element to the expected sum, if it works we return, otherwise the sum is being updated
            let newSum = forSum - copy[i]
            if newSum == 0 {
                return newList
            }
            
            copy.remove(at: i)
            
            // We re-iterate with the new sum and the new lists
            if let solution = copy.subset(forSum: newSum, andList: newList) {
                return solution
            }
        }
        
        return nil
    }
}
```

## Test

```swift
class Problem_42Tests: XCTestCase {

    func test_1() {
        let input = [12, 1, 61, 5, 9, 2]
        print(input.subset(forSum: 24, andList: []))
    }

}
```