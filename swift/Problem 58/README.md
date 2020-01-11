## Description

This problem was asked by Amazon.

An sorted array of integers was rotated an unknown number of times.

Given such an array, find the index of the element in the array in faster than linear time. If the element doesn't exist in the array, return null.

For example, given the array [13, 18, 25, 2, 8, 10] and the element 8, return 4 (the index of 8 in the array).

You can assume all the integers in the array are unique.

## Solution
    
```swift
extension Array where Element == Int {
    func findIndex(_ value: Int) -> (subArray: [Int], index: Int)? {
        if let first = first, let last = last {
            if first == value {
                return (self, 0)
            }
            
            if last == value {
                return (self, count-1)
            }
            
            if first == last {
                return nil
            }
            
            let mid = self[count/2]
            
            if mid == value {
                return (self, count/2)
            }
            
            var sub: [Int]
            
            if (first > value && value < mid) || (first < value && value > mid) {
                sub = Array(self.prefix(count/2))
                return sub.findIndex(value)
            } else {
                sub = Array(self.suffix(count/2))
                if var subResult = sub.findIndex(value) {
                    let copy = subResult
                    subResult.index = count/2 + copy.index
                    return subResult
                }
            }
        }
        
        return nil
    }
}
```

## Test

```swift
class Problem_58Tests: XCTestCase {

    func test_example() {
        let input = [13, 18, 25, 2, 8, 10]
        XCTAssert(input.findIndex(8)?.index == 4)


        XCTAssert(input.findIndex(0)?.index == nil)
        XCTAssert(input.findIndex(10)?.index == 5)
        XCTAssert(input.findIndex(25)?.index == 2)
        
    }

}
```