## Description

This problem was asked by Yelp.

You are given an array of integers, where each element represents the maximum number of steps that can be jumped going forward from that element. Write a function to return the minimum number of jumps you must take in order to get from the start to the end of the array.

For example, given `[6, 2, 4, 0, 5, 1, 1, 4, 2, 9]`, you should return `2`, as the optimal solution involves jumping from `6` to `5`, and then from `5` to `9`.

## Solution

```swift
extension Array where Element == Int {
    
    func minJumps() -> Int {
        
        guard count > 0 else {
            fatalError("invalid length.")
        }
        
        guard (filter{ $0 > 0 }.count) > 0 else {
            fatalError("all inputs must be positive.")
        }
        
        let candidates = next(current: 0)
        let sorted = candidates.sorted{ $0 < $1 }
        
        return sorted.first!
    }
    
    func next(current: Int) -> [Int] {
        
        var result: [Int] = []
        
        let max = self.first!
        
        if max >= count-1 {
            return [current+1]
        }
        
        if max == 0 {
            return []
        }
        
        for i in 1...max {
            result.append(contentsOf: Array(suffix(count-i)).next(current: current+1))
        }
        
        return result
    }
}
```

## Tests

```swift
class Problem_245Tests: XCTestCase {

    func test_example() {
        
        let input = [6, 2, 4, 0, 5, 1, 1, 4, 2, 9]
        let expected = 2
        let actual = input.minJumps()
        
        XCTAssert(actual == expected)
    }

}
```