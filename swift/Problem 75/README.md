## Description

This problem was asked by Microsoft.

Given an array of numbers, find the length of the longest increasing subsequence in the array. The subsequence does not necessarily have to be contiguous.

For example, given the array [0, 8, 4, 12, 2, 10, 6, 14, 1, 9, 5, 13, 3, 11, 7, 15], the longest increasing subsequence has length 6: it is 0, 2, 6, 9, 11, 15.

## Solution
    
```swift
struct Node {
    var current: [Int]
    var rest: [Int]
    var candidates: [Node]
    
    init(current: [Int], rest: [Int], candidates: [Node]) {
        self.current = current
        self.rest = rest
        self.candidates = candidates
    }
    
    mutating func buildRootCandidates() {
        var newCandidates: [Node] = []
        
        for i in 0..<rest.count {
            let element = rest[i]
            let newRest = Array(rest.suffix(rest.count-1-i))
            
            var node = Node(current: [element], rest: newRest, candidates: [])
            node.generateCandidates()
            newCandidates.append(node)
        }
        
        self.candidates = newCandidates
    }
    
    private mutating func generateCandidates() {
        guard let last = current.last else {
            return
        }
        
        let possibilities = rest.ascendingSeqCandidates(forValue: last)
        
        var newCandidates: [Node] = []
        
        for possibility in possibilities {
            guard let first = possibility.first else {
                continue
            }
            
            let newCurrent = current + [first]
            let newRest = Array(possibility.suffix(possibility.count-1))
            
            var node = Node(current: newCurrent, rest: newRest, candidates: [])
            node.generateCandidates()
            newCandidates.append(node)
        }
        
        self.candidates = newCandidates
    }
    
    func getAllAscendingSequences() -> [[Int]] {
        var result: [[Int]] = []
        
        for candidate in candidates {
            if candidate.candidates.isEmpty {
                result.append(candidate.current)
            } else {
                result.append(contentsOf: candidate.getAllAscendingSequences())
            }
        }
        
        return result
    }
}

extension Array where Element == Int {
    func ascendingSeqCandidates(forValue value: Int) -> [[Int]] {
        var result: [[Int]] = []
        
        for i in 0..<self.count {
            let current = self[i]
            
            if current > value {
                result.append(self.suffix(self.count-i))
            }
        }
        
        return result
    }
}
```

## Test

```swift
class Problem_75Tests: XCTestCase {

    func test_example() {
        var root = Node(current: [], rest: [0, 8, 4, 12, 2, 10, 6, 14, 1, 9, 5, 13, 3, 11, 7, 15], candidates: [])
        
        root.buildRootCandidates()
        
        let sorted = root.getAllAscendingSequences().sorted{ $0.count > $1.count }
        if let largest = sorted.first {
            XCTAssert(largest == [0, 2, 6, 9, 11, 15] || largest == [0, 4, 6, 9, 13, 15])
        }
    }

}
```