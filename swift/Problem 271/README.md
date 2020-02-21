## Description

This problem was asked by Netflix.

Given a sorted list of integers of length `N`, determine if an element `x` is in the list without performing any multiplication, division, or bit-shift operations.

Do this in `O(log N)` time.


## Solution

```swift
extension Array where Element == Int {
    
    func quickContains(value: Int) -> Bool {
        
        // Must be sorted
        
        guard value >= first! && value <= last! else {
            return false
        }
        
        let current = self[count/2]
        
        if current == value { return true }
        
        if current > value {
            return Array(prefix(count/2)).quickContains(value: value)
        } else {
            return Array(suffix(count/2)).quickContains(value: value)
        }
    }
}
```

## Tests

```swift
class Problem_271Tests: XCTestCase {

    func test_quick_contains() {
        
        let input = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
        
        for i in 1...10 {
            let actual = input.quickContains(value: i)
            
            XCTAssertTrue(actual)
        }
    }

}
```