## Description

This problem was asked by Snapchat.

Given a list of possibly overlapping intervals, return a new list of intervals where all overlapping intervals have been merged.

The input list is not necessarily ordered in any way.

For example, given `[(1, 3), (5, 8), (4, 10), (20, 25)]`, you should return `[(1, 3), (4, 10), (20, 25)]`.

## Solution

```swift
struct Interval {
    var start: Int
    var end: Int
    
    func isOverlapping(interval: Interval) -> Bool {
        return start >= interval.start && end <= interval.end
    }
}

extension Array where Element == Interval {
    mutating func reduceOverlapping() -> [Interval] {

        for i in 0..<count {
            // Loop through the elements
            let element = self[i]
            
            // Create a copy of the initial array without the current element
            var copy = self
            copy.remove(at: i)
            
            // If the element is overlapping any other interval, remove it and re-iterate
            for interval in copy {
                if element.isOverlapping(interval: interval) {
                    remove(at: i)
                    return reduceOverlapping()
                }
            }
        }
        
        return self
    }
}

func tuplesToIntervals(input: [(start: Int, end: Int)]) -> [Interval] {
    var result: [Interval] = []
    
    for tuple in input {
        result.append(Interval(start: tuple.start, end: tuple.end))
    }
    
    return result
}

func intervalsToTuples(input: [(Interval)]) -> [(start: Int, end: Int)] {
    var result: [(start: Int, end: Int)] = []
    
    for interval in input {
        result.append((start: interval.start, end: interval.end))
    }
    
    return result
}
```

## Test

```swift
class Problem_77Tests: XCTestCase {

    func test_example() {
        var input = tuplesToIntervals(input: [(1, 3), (5, 8), (4, 10), (20, 25)])
        print(intervalsToTuples(input: input.reduceOverlapping()))
    }

}
```