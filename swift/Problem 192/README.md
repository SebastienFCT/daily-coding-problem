## Description

This problem was asked by Google.

You are given an array of nonnegative integers. Let's say you start at the beginning of the array and are trying to advance to the end. You can advance at most, the number of steps that you're currently on. Determine whether you can get to the end of the array.

For example, given the array `[1, 3, 1, 2, 0, 1]`, we can go from indices `0 -> 1 -> 3 -> 5`, so return true.

Given the array `[1, 2, 1, 0, 0]`, we can't reach the end, so return false.

## Solution

```swift
extension Array where Element == Int {
    
    func canReachTheEndByWalkingAtMostEachIndex() -> Bool {
        
        guard let first = first else {
            return true
        }
        
        guard first > 0 else {
            return false
        }
        
        for i in 1...first {
            let next = Array(self.suffix(count-i))
            
            if next.canReachTheEndByWalkingAtMostEachIndex() {
                return true
            }
        }
        
        return false
    }
}
```

## Test

```swift
class Problem_192Tests: XCTestCase {

    func test_example_1() {
        XCTAssertTrue([1, 3, 1, 2, 0, 1].canReachTheEndByWalkingAtMostEachIndex())
    }
    
    func test_example_2() {
        XCTAssertFalse([1, 2, 1, 0, 0].canReachTheEndByWalkingAtMostEachIndex())
    }
}
```