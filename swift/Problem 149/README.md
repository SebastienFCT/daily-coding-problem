## Description

This problem was asked by Goldman Sachs.

Given a list of numbers `L`, implement a method `sum(i, j)` which returns the sum from the sublist `L[i:j]` (including `i`, excluding `j`).

For example, given `L = [1, 2, 3, 4, 5]`, `sum(1, 3)` should return `sum([2, 3])`, which is `5`.

You can assume that you can do some pre-processing. `sum()` should be optimized over the pre-processing step.

## Solution

```swift
class CustomList {
    var list: [Int]
    var processedList: [Int]
    
    init(list: [Int]) {
        self.list = list
        self.processedList = []
        var sum = 0
        
        for element in list {
            sum += element
            self.processedList.append(sum)
        }
        
        print(list)
        print(processedList)
    }
    
    func sum(_ i: Int, _ j: Int) -> Int {
        guard i >= 0, j < self.list.count else {
            fatalError("index out of bounds")
        }
        
        return processedList[j-1] - ((i == 0) ? 0 : processedList[i-1])
    }
    
    // For UITests to valid the custom sum
    func sumByLoop(_ i: Int, _ j: Int) -> Int {
        var result = 0
        
        for index in i..<j {
            result += list[index]
        }
        
        return result
    }
}
```

## Test

```swift
class Problem_149Tests: XCTestCase {

    func test_example() {
        let input = CustomList(list: [1, 2, 3, 4, 5])
        XCTAssert(input.sum(1, 3) == input.sumByLoop(1, 3))
        XCTAssert(input.sum(0, 4) == input.sumByLoop(0, 4))
    }
    
    func test_other() {
        let input = CustomList(list: [21, 34, 54, 4123, 4545, 62, 662, 75, 234, 11, 76, 2354, 7])
        XCTAssert(input.sum(1, 3) == input.sumByLoop(1, 3))
        XCTAssert(input.sum(5, 8) == input.sumByLoop(5, 8))
        XCTAssert(input.sum(0, 12) == input.sumByLoop(0, 12))
    }

}
```