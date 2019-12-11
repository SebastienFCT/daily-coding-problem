## Description

This problem was asked by Microsoft.

Let X be a set of n intervals on the real line. We say that a set of points P "stabs" X if every interval in X contains at least one point in P. Compute the smallest set of points that stabs X.

For example, given the intervals `[(1, 4), (4, 5), (7, 9), (9, 12)]`, you should return `[4, 9]`.

## Solution

```swift
typealias Interval = (start: Int, end: Int)

extension Array where Element == Interval {
    
    func smallestStabingSet() -> Interval {
        
        let mins = self.map{ $0.end }.sorted()
        let maxs = self.map{ $0.start }.sorted()
        
        return (mins.first!, maxs.last!)
    }
}
```

## Test

```swift
class Problem_200Tests: XCTestCase {

    func test_example() {
        let input: [Interval] = [(1, 4), (4, 5), (7, 9), (9, 12)]
        let computed = input.smallestStabingSet()
        let expected: Interval = (4, 9)
        
        XCTAssert(computed == expected)
    }

}
```