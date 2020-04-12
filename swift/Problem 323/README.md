## Description

This problem was asked by Dropbox.

Create an algorithm to efficiently compute the approximate median of a list of numbers.

More precisely, given an unordered list of N numbers, find an element whose rank is between `N / 4` and `3 * N / 4`, with a high level of certainty, in less than `O(N)` time.

## Solution

```swift
extension Array where Element == Int {
    
    func median() -> Int {
        
        return sorted()[count/2]
    }
}
```

## Tests

```swift
class Problem_323Tests: XCTestCase {

    func test_median() {
        
        print([1,2,3,4,5,6,7,8,9,10].median())
        print([1,1,1,1,2,2,2,2,3,3,3,3].median())
    }

}
```