## Description

This problem was asked by Sumo Logic.

Given an unsorted array, in which all elements are distinct, find a "peak" element in O(log N) time.

An element is considered a peak if it is greater than both its left and right neighbors. It is guaranteed that the first and last elements are lower than all others.

## Solution

```swift
extension Array where Element == Int {
    
    func anyPeak() -> Int {
        
        guard count > 0 else {
            fatalError("Invalid input")
        }
        
        if self[count/2] > self[(count/2)+1] && self[count/2] > self[(count/2)-1] {
            return self[count/2]
        }
        
        if self[count/2] > self[(count/2)+1] {
            return Array(suffix(count/2+1)).anyPeak()
        }
        
        return Array(prefix(count/2+1)).anyPeak()
    }
}
```

## Tests

```swift
class Problem_311Tests: XCTestCase {

    func test_find_a_peak() {
        
        let input = [2, 3, 4, 5, 3, 2, 7, 6, 1]
        
        print(input.anyPeak())
        
        let input2 = [2, 3, 12, 15, 3, 1]
        
        print(input2.anyPeak())
    }

}
```