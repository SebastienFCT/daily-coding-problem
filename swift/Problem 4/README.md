### Description

This problem was asked by Stripe.

Given an array of integers, find the first missing positive integer in linear time and constant space. In other words, find the lowest positive integer that does not exist in the array. The array can contain duplicates and negative numbers as well.

For example, the input `[3, 4, -1, 1]` should give `2`. The input `[1, 2, 0]` should give `3`.

You can modify the input array in-place.

### Solution

```swift
extension Array where Element == Int {
    func lowerMissingPositiveInteger() -> Int {
        let sortedAndPosition = self.sorted{ $0 < $1}.filter{ $0 > 0 }
        
        var index = 1
        
        while (true) {
            if !sortedAndPosition.contains(index) {
                return index
            }
            
            index += 1
        }
    }
}
```