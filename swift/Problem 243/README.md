## Description

This problem was asked by Etsy.

Given an array of numbers N and an integer k, your task is to split N into k partitions such that the maximum sum of any partition is minimized. Return this sum.

For example, given `N = [5, 1, 2, 7, 3, 4]` and `k = 3`, you should return `8`, since the optimal partition is `[5, 1, 2], [7], [3, 4]`.

## Solution

```swift
extension Array where Element == Int {
    
    func minimumSumForKPartitions(k: Int) -> Int {
        
        guard count > 0 else {
            fatalError("empty array")
        }
        
        let candidates = split(partitionsSize: k, base: [])
        let sums = candidates.map{ $0.map{ $0.reduce(0) { $0 + $1 } } }
        let maxValues = sums.map{ $0.reduce(0) { $1 > $0 ? $1 : $0 } }
        let sorted = maxValues.sorted{ $0 < $1 }
        
        return sorted.first!
    }
    
    func split(partitionsSize k: Int, base: [[Int]]) -> [[[Int]]] {
        
        var result: [[[Int]]] = []
        
        if k > 1 {
            for i in 0..<count-k {
                
                var copy = base
                
                copy.append(Array(self[0...i]))
                result.append(contentsOf: Array(self[i+1...count-1]).split(partitionsSize: k-1, base: copy))
            }
        } else {
            var copy = base
            copy.append(self)
            result.append(copy)
        }
        
        return result
    }
}
```

## Tests

```swift
class Problem_243Tests: XCTestCase {

    func test_example() {
        
        let input = [5, 1, 2, 7, 3, 4]
        
        print(input.minimumSumForKPartitions(k: 3) == 8)
    }

}
```