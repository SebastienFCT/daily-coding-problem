## Description

This problem was asked by Facebook.

Given a multiset of integers, return whether it can be partitioned into two subsets whose sums are the same.

For example, given the multiset `{15, 5, 20, 10, 35, 15, 10}`, it would return true, since we can split it up into `{15, 5, 10, 15, 10}` and `{20, 35}`, which both add up to `55`.

Given the multiset `{15, 5, 20, 10, 35}`, it would return false, since we can't split it up into two subsets that add up to the same sum.

## Solution

```swift
class Node {
    var value: Int
    var previousElements: [Int]
    var remainingElements: [Int]
    
    init(value: Int, previousElements: [Int], remainingElements: [Int]) {
        self.value = value
        self.previousElements = previousElements
        self.remainingElements = remainingElements
    }
}

extension Node {
    func coupleWithCommonSum() -> (left: [Int], right: [Int])? {
        let reducedPrevious = previousElements.reduce(0, +)
        let reducedRemaining = remainingElements.reduce(0, +)
        
        // Win condition
        if reducedPrevious == reducedRemaining {
            return (previousElements, remainingElements)
        }
        
        // Loose condition
        if reducedPrevious > reducedRemaining {
            return nil
        }
        
        var index = 0
        for element in remainingElements {
            let newPrevious = previousElements + [element]
            var newRemaining = remainingElements
            newRemaining.remove(at: index)
            
            let newNode = Node(value: element, previousElements: newPrevious, remainingElements: newRemaining)
            if let solution = newNode.coupleWithCommonSum() {
                return solution
            }
            
            index += 1
        }
        
        // We tried all combinations and none worked
        return nil
    }
}

extension Array where Element == Int {
    func findCoupleSetWithCommonSum() -> (left: [Int], right: [Int])? {
        
        var index = 0
        for element in self {
            let previous = [element]
            var remaining = self
            remaining.remove(at: index)
            
            let root = Node(value: element, previousElements: previous, remainingElements: remaining)
            if let solution = root.coupleWithCommonSum() {
                return solution
            }
            
            index += 1
        }
        
        return nil
    }
}
```
## Test

```swift
class Problem_60Tests: XCTestCase {

    func test_example() {
        let input = [15, 5, 20, 10, 35, 15, 10]
        
        XCTAssert(input.findCoupleSetWithCommonSum() != nil)
    }
    
    func test_example2() {
        let input = [15, 5, 20, 10, 35]
        
        XCTAssert(input.findCoupleSetWithCommonSum() == nil)
    }
    
    func test_obvious() {
        let input = [1,1,2,2]
        
        XCTAssert(input.findCoupleSetWithCommonSum() != nil)
    }
    
    func test_obvious2() {
        let input = [1,2]
        
        XCTAssert(input.findCoupleSetWithCommonSum() == nil)
    }

}
```