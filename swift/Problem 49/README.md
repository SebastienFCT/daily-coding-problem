## Description

This problem was asked by Amazon.

Given an array of numbers, find the maximum sum of any contiguous subarray of the array.

For example, given the array `[34, -50, 42, 14, -5, 86]`, the maximum sum would be `137`, since we would take elements `42`, `14`, `-5`, and `86`.

Given the array `[-5, -1, -8, -9]`, the maximum sum would be `0`, since we would not take any elements.

Do this in O(N) time.

## Solution

n this problem we need to find the maximum sub-array in one pass
 
When the absolute value of a negative element is larger than the sum of its elements on the left, then it means that taking these elements would have a negative impact on the total sum

We basically need to track our sum as we're going through the array and override it any time the next value is  greater than the sum of it with the previous elements

```swift
extension Array where Element == Int {
    func findLargestConsecutiveSum() -> Int {
        var sum = 0

        for element in self {
            sum += element
            if element > sum {
                sum = element
            }
        }

        return sum
    }
}
```

After testing, we can see that we need to ignore negative value. We can just apply the previous logic and return 0 if the final result is negative

```swift
extension Array where Element == Int {
    func findLargestConsecutiveSum() -> Int {
        var sum = 0
        
        for element in self {
            sum += element
            if element > sum {
                sum = element
            }
        }
        
        return sum > 0 ? sum : 0
    }
}
```

## Test

```swift
class Problem_49Tests: XCTestCase {

    func test_example() {
        let input = [34, -50, 42, 14, -5, 86]
        XCTAssert(input.findLargestConsecutiveSum() == 137)
    }
    
    func test_example2() {
        let input = [-5, -1, -8, -9]
        XCTAssert(input.findLargestConsecutiveSum() == 0)
    }

}
```