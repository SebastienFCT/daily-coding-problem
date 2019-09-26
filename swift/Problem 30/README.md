## Description

This problem was asked by Facebook.

You are given an array of non-negative integers that represents a two-dimensional elevation map where each element is unit-width wall and the integer is the height. Suppose it will rain and all spots between two walls get filled up.

Compute how many units of water remain trapped on the map in `O(N)` time and `O(1)` space.

For example, given the input `[2, 1, 2]`, we can hold `1` unit of water in the middle.

Given the input `[3, 0, 1, 3, 0, 5]`, we can hold `3` units in the first index, `2` in the second, and `3` in the fourth index (we cannot hold `5` since it would run off to the left), so we can trap `8` units of water.

## Solution

```swift
extension Array where Element == Int {
    func findDeepestValley() -> (subArray: [Int], leftBoundaryIndex: Int, rightBoundaryIndex: Int) {
        var enumeratedAndSorted = self.enumerated().sorted{ $0.element > $1.element }
        
        let boundaries = enumeratedAndSorted[0...1].sorted{ $0.offset < $1.offset }
        
        return (Array(self[boundaries[0].offset...boundaries[1].offset]), boundaries[0].offset, boundaries[1].offset)
    }
    
    func fill() -> (totalUnits: Int, maxHeight: Int) {
        let maxHeight = self.reduce(0, {$0 > $1 ? $0 : $1})
        let boundaryMaxHeight = Swift.min(self[0], self[self.count-1])
        var totalDrops = 0
        
        for element in self {
            if boundaryMaxHeight > element {
                totalDrops += boundaryMaxHeight - element
            }
        }
        
        return (totalDrops, maxHeight)
    }
    
    mutating func rain() -> Int {
        var count = 0
        
        while self.count != 1 {
            let valley = self.findDeepestValley()
            let fillValley = valley.subArray.fill()
            count += fillValley.totalUnits
            
            print(valley)
            print("adding \(fillValley.totalUnits)")
            
            if valley.leftBoundaryIndex == 0 && valley.rightBoundaryIndex == self.count-1 {
               return count
            }
            
            if valley.rightBoundaryIndex == 0 {
                self = Array(self[0...valley.leftBoundaryIndex-1]) + [fillValley.maxHeight]
                continue
            }
            
            if valley.leftBoundaryIndex == 0 {
                self = [fillValley.maxHeight] + Array(self[valley.rightBoundaryIndex+1...self.count-1])
                continue
            }
            
            self = Array(self[0...valley.leftBoundaryIndex-1]) + [fillValley.maxHeight] + Array(self[valley.rightBoundaryIndex+1...self.count-1])
        }
        
        return count
    }
}
```

## Tests

```swift
class Problem_30Tests: XCTestCase {

    func test_1() {
        let input1 = [2, 0, 4, 0, 4, 1, 2]
        XCTAssert(input1.findDeepestValley().subArray == [4, 0, 4])
        
        
        let input2 = [4, 4]
        XCTAssert(input2.findDeepestValley().subArray == [4, 4])
    }

    func test_2() {
        let input1 = [4, 0, 4]
        XCTAssert(input1.fill() == (4, 4))
        
        let input2 = [4, 4]
        XCTAssert(input2.fill() == (0, 4))
    }
    
    func test_3() {
        var input1 = [2, 0, 4, 0, 4, 1, 2]
        XCTAssert(input1.rain() == 7)
    }
    
    func test_example() {
        var input1 = [2, 1, 2]
        XCTAssert(input1.rain() == 1)
        
        var input2 = [3, 0, 1, 3, 0, 5]
        XCTAssert(input2.rain() == 8)
    }
}
```