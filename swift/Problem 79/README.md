## Description

This problem was asked by Facebook.

Given an array of integers, write a function to determine whether the array could become non-decreasing by modifying at most 1 element.

For example, given the array [10, 5, 7], you should return true, since we can modify the 10 into a 1 to make the array non-decreasing.

Given the array [10, 5, 1], you should return false, since we can't modify any one element to get a non-decreasing array.

## Solution

There are 2 things to implement here:
 
- First we want a function that tells us if an array of integer is non-decreasing
- Second we will create a function that loop through each element and check if removing them result in a non-decreasing array of integer
    
```swift
extension Array where Element == Int {
    func isNonDecreasing() -> Bool {
        guard count > 1 else {
            // If it's empty or only has one element, then it's non-decreasing
            return true
        }
        
        var current = self[0] // there is no need to check against this value as we already know that the array is non empty
        
        for i in 1..<count {
            if self[i] < current {
                return false
            }
            
            current = self[i]
        }
        
        return true
    }
    
    func nonDecreasingByRemovingOneElement() -> (success: Bool, index: Int?) {
        if self.isNonDecreasing() {
            return (true, nil)
        }
        
        for i in 0..<count {
            var copy = self
            _ = copy.remove(at: i)
            
            if copy.isNonDecreasing() {
                return (true, i)
            }
        }
        
        return (false, nil)
    }
}
```

## Test

```swift
class Problem_79Tests: XCTestCase {

    func test_example() {
        let input = [10, 5, 7]
        XCTAssert(input.nonDecreasingByRemovingOneElement() == (true, 0))
    }
    
    func test_example2() {
        let input = [10, 5, 1]
        XCTAssert(input.nonDecreasingByRemovingOneElement().success == false)
    }

}
```