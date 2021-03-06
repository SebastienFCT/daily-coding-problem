## Description

This problem was asked by Uber.

You have N stones in a row, and would like to create from them a pyramid. This pyramid should be constructed such that the height of each stone increases by one until reaching the tallest stone, after which the heights decrease by one. In addition, the start and end stones of the pyramid should each be one stone high.

You can change the height of any stone by paying a cost of 1 unit to lower its height by 1, as many times as necessary. Given this information, determine the lowest cost method to produce this pyramid.

For example, given the stones `[1, 1, 3, 3, 2, 1]`, the optimal solution is to pay `2` to create `[0, 1, 2, 3, 2, 1]`.

## Solution

```swift
struct Pyramid {
    
    var stones: [Int]
    
    func build() -> (cost: Int, result: [Int])? {
        
        let pyramids = allPyramids(forLength: stones.count)
        
        var candidates: [(cost: Int, result: [Int])] = []
        
        for pyramid in pyramids {
            if let optimized = optimize(forPyramid: pyramid) {
                candidates.append(optimized)
            }
        }
        
        let sorted = candidates.sorted{ $0.cost < $1.cost }
        
        return sorted.first
    }
    
    func allPyramids(forLength length: Int) -> [[Int]] {
        
        var result: [[Int]] = []
        
        if length % 2 == 0 {
            
            var currentLength = length
            
            while currentLength > 0 {
                
                var candidate: [Int] = []
                
                for i in 1...((currentLength)/2) {
                    candidate.append(i)
                }
                
                for i in stride(from: ((currentLength-1) / 2), through: 1, by: -1) {
                    candidate.append(i)
                }
                
                result.append(candidate)
                
                currentLength -= 2
            }
        }
        
        return result
    }
    
    func optimize(forPyramid pyramid: [Int]) -> (cost: Int, result: [Int])? {
        
        var candidates: [(cost: Int, result: [Int])] = []
        
        if pyramid.count == stones.count {
            
            var cost = 0
            
            for i in 0..<stones.count {
                if pyramid[i] > stones[i] {
                    return nil
                }
                    
                cost += stones[i] - pyramid[i]
            }
            
            return (cost, pyramid)
        }
        
        for i in 0...stones.count-pyramid.count {
            
            var cost = 0
            var candidate: [Int] = []
            
            if i > 0 {
                for k in 0..<i {
                    candidate.append(0)
                    cost += stones[k]
                }
            }
            
            var isPossible = true
            
            for j in i..<i+pyramid.count {
                
                if pyramid[j-i] > stones[j] {
                    isPossible = false
                    break
                }
                
                cost += stones[j] - pyramid[j-i]
            }
            
            if !isPossible {
                continue
            }
            
            candidate.append(contentsOf: pyramid)
            
            if i + pyramid.count < stones.count {
                for k in stride(from: stones.count-1, to: i, by: -1) {
                    candidate.append(0)
                    cost += stones[k]
                }
            }
            
            candidates.append((cost, candidate))
        }
        
        let sorted = candidates.sorted{ $0.cost < $1.cost }
        return sorted.first
    }
}
```

## Tests

```swift
class Problem_293Tests: XCTestCase {

    func test_example() {
        
        let input = Pyramid(stones: [1, 1, 3, 3, 2, 1])
        
        let actual = input.build()
        let expectedCost = 2
        let expectedResult = [0, 1, 2, 3, 2, 1]
        
        XCTAssert(actual?.cost == expectedCost)
        XCTAssert(actual?.result == expectedResult)
    }

}
```