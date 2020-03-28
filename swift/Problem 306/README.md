## Description

This problem was asked by Palantir.

You are given a list of N numbers, in which each number is located at most k places away from its sorted position. For example, if k = 1, a given element at index 4 might end up at indices 3, 4, or 5.

Come up with an algorithm that sorts this list in O(N log k) time.

## Solution

```swift
extension Array where Element == Int {
    
    mutating func finishSorting(maxDistance k: Int) {
        
        var ref: Int
        
        for i in 1..<count {
                
            ref = self[i]
            var j = i-1
            
            while j >= 0 && self[j] > ref {
                self[j+1] = self[j]
                j = j-1
            }
            
            self[j+1] = ref
        }
    }
}
```

## Tests

```swift
class Problem_306Tests: XCTestCase {

    func test_finish_sorting() {
        
        let sorted = [2, 5, 8, 10, 21, 43, 100]
        var input = [5, 2, 10, 8, 100, 21, 43]
        
        input.finishSorting(maxDistance: 2)
        XCTAssert(input == sorted)
    }

}
```