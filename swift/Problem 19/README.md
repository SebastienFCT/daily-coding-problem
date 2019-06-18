### Description

This problem was asked by Facebook.

A builder is looking to build a row of `N` houses that can be of `K` different colors. He has a goal of minimizing cost while ensuring that no two neighboring houses are of the same color.

Given an `N` by `K` matrix where the `nth` row and `kth` column represents the cost to build the nth house with kth color, return the minimum cost which achieves this goal.

### Solution

```swift
extension Array where Element == Array<Int> {
    func optimumWithDistinctNeighborsV2() -> [String] {
        var intermediate = buildIntermediate()
        
        var i = 0
        
        while i < intermediate.count-1 {
            if intermediate[i].offset == intermediate[i+1].offset {
                if self[i].findMinN(1).element < self[i+1].findMinN(1).element {
                    intermediate[i] = self[i].findMinN(1)
                } else {
                    intermediate[i+1] = self[i+1].findMinN(1)
                }
                
                i = 0
            } else {
                i += 1
            }
        }
        
        return intermediate.map{ "color \($0.element)" }
    }
    
    func buildIntermediate() -> [(offset: Int, element: Int)] {
        var result: [(offset: Int, element: Int)] = []
        
        for i in 0...self.count-1 {
            result.append(self[i].findMinN(0))
        }
        
        return result
    }
}


extension Array where Element == Int {
    func findMinN(_ n: Int) -> (offset: Int, element: Int) {
        guard n < self.count else {
            fatalError("Can't evaluate n min with index > array length")
        }
        
        let sorted = self.enumerated().sorted{ $0.element < $1.element }
        return sorted[n]
    }
}

```

#### Test

```swift
class Problem_19Tests: XCTestCase {

    func test() {
        let input = [
            [1, 2, 3],
            [1, 2, 3],
            [1, 2, 3]
        ]
     
        XCTAssert(input.optimum() == ["color 1", "color 1", "color 1"])
        XCTAssert(input.optimumWithDistinctNeighborsV1() == ["color 1", "color 2", "color 1"])
    }
    
    func test2() {
        let input = [
            [1, 2, 3],
            [1, 5, 5],
            [1, 2, 3]
        ]
        
        XCTAssert(input.optimumWithDistinctNeighborsV2() == ["color 2", "color 1", "color 2"])
    }

}
```