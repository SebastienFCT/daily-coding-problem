## Description

This problem was asked by Google.

Given an array of elements, return the length of the longest subarray where all its elements are distinct.

For example, given the array `[5, 1, 3, 5, 2, 3, 4, 1]`, return 5 as the longest subarray of distinct elements is `[5, 2, 3, 4, 1]`.

## Solution

```swift
extension Array where Element == Int {
    
    func sizeOfLongestSubarrayWithUniqueElements() -> Int {
        
        var set: Set<Int> = Set()
        
        for item in self {
            if !set.contains(item) {
                set.insert(item)
            }
        }
        
        return set.count
    }
}
```

## Test

```swift
class Problem_189Tests: XCTestCase {

    func test_example() {
        XCTAssert([5, 1, 3, 5, 2, 3, 4, 1].sizeOfLongestSubarrayWithUniqueElements() == 5)
    }

}
```