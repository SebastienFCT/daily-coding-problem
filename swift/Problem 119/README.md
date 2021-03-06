## Description

This problem was asked by Google.

Given a set of closed intervals, find the smallest set of numbers that covers all the intervals. If there are multiple smallest sets, return any of them.

For example, given the intervals `[0, 3], [2, 6], [3, 4], [6, 9]`, one set of numbers that covers all these intervals is `{3, 6}`.

## Solution

```swift
struct Interval {
    var min: Int
    var max: Int

    func values() -> [Int] {
        var result: [Int] = []

        for i in min...max {
            result.append(i)
        }

        return result
    }

}

extension Array where Element == Interval {
    func sortedByMaxValues() -> [Interval] {
        return self.sorted{ $0.max < $1.max }
    }
    
    func mininumCover() -> [Int] {
        var result: [Int] = []
        
        var sorted = self.sortedByMaxValues()
        
        while !sorted.isEmpty {
            let current = sorted.removeFirst()
            result.append(current.max)
            
            for i in stride(from: sorted.count-1, to: -1, by: -1) {
                let element = sorted[i]
                
                if element.values().contains(current.max) {
                    sorted.remove(at: i)
                }
            }
        }
        
        return result
    }
}
```

## Test

```swift
class Problem_119Tests: XCTestCase {

    func test_example() {
        let input = [Interval(min: 0, max: 3), Interval(min: 2, max: 6), Interval(min: 3, max: 4), Interval(min: 6, max: 9)]
        
        let actual = input.mininumCover()
        let expected = [3, 6]
        XCTAssert(actual == expected || actual.count == expected.count)
    }

}
```