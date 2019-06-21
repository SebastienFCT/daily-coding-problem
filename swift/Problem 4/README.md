## Description

This problem was asked by Stripe.

Given an array of integers, find the first missing positive integer in linear time and constant space. In other words, find the lowest positive integer that does not exist in the array. The array can contain duplicates and negative numbers as well.

For example, the input `[3, 4, -1, 1]` should give `2`. The input `[1, 2, 0]` should give `3`.

You can modify the input array in-place.

## Solution

To solve this problem, I would

1. Loop through positive integers 0, 1, 2, ...
2. For each element, check if the array

```swift
extension Array where Element == Int {
    func lowerMissingPositiveInteger() -> Int {
        var index = 1
        
        while (true) {
            if !self.contains(index) {
                return index
            }
            
            index += 1
        }
    }
}
```

Now this is expensive as each loop is actually scanning the array
 
Another approach might be looping through the elements of the array itself.

1. First let's remove negative element and sort the array
2. Then we loop through the array and make sure that each value is equal to its previous value + 1 otherwise that means that we found the lowest missing integer

```swift
extension Array where Element == Int {
    func lowerMissingPositiveInteger2() -> Int {
        let sortedAndPositive = self.sorted{ $0 < $1}.filter{ $0 > 0 }
        
        var lastValue = 0
        
        for element in sortedAndPositive {
            if element != lastValue + 1 {
                return lastValue + 1
            }
            
            lastValue += 1
        }
        
        return lastValue + 1
    }
}
```

## Tests

```swift
class Problem_4Tests: XCTestCase {

    func testExample() {
        let input = [3, 4, -1, 1]
        
        XCTAssert(input.lowerMissingPositiveInteger() == 2)
        XCTAssert(input.lowerMissingPositiveInteger2() == 2)
    }
    
    func testExample2() {
        let input = [1, 2, 0]
        
        XCTAssert(input.lowerMissingPositiveInteger() == 3)
        XCTAssert(input.lowerMissingPositiveInteger2() == 3)
    }

}
```