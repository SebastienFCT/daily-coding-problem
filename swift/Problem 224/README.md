## Description

This problem was asked by Amazon.

Given a sorted array, find the smallest positive integer that is not the sum of a subset of the array.

For example, for the input `[1, 2, 3, 10]`, you should return `7`.

Do this in `O(N)` time.


## Solution

```swift
extension Array where Element == Int {
    
    func smallestPositiveIntNotInAnySumSubset() -> Int {
        
        guard count > 1 else {
            return 1
        }
        
        var result = 1
        var index = 0
        
        while result >= self[index] {
            result += self[index]
            index += 1
        }
        
        return result
    }
}
```

## Test

```swift
class Problem_224Tests: XCTestCase {

    func test_example() {
        let input = [1, 2, 3, 10]
        let actual = input.smallestPositiveIntNotInAnySumSubset()
        let expected = 7
        
        XCTAssert(actual == expected)
    }

}
```