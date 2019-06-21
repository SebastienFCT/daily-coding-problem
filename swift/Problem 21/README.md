## Description

This problem was asked by Snapchat.

Given an array of time intervals `(start, end)` for classroom lectures (possibly overlapping), find the minimum number of rooms required.

For example, given `[(30, 75), (0, 50), (60, 150)]`, you should return 2.

## Solution

```swift
extension Array where Element == (Int, Int) {
    
    // We're trying to visualize when multiple courses are overlapping
    // When you look at a calendar, you see overlapping event sitting beside each others
    // So let's try to build an array where
    // - The index corresponds to the unit of time
    // - The value corresponds to how many courses are on this window
    // The array should start at the minimum possible unit of time and finish at the maximum possible unit. So index 0 = min([element0, element1])
    
    func minimumRoomRequired() -> Int {
        var result: [Int] = []
        
        let minUnit = (self.map{ $0.0 } + self.map{ $0.1 }).min() ?? 0
        let maxUnit = (self.map{ $0.0 } + self.map{ $0.1 }).max() ?? 0
        let range = maxUnit - minUnit
        
        guard range > 0 else {
            fatalError("range cannot be negative")
        }
        
        // self.map{ minUnit + i >= $0.0 && minUnit + i <= $0.1} returns an array of boolean if the class is during the current unit of time scanned
        // .filter{ $0 == true } will only keep the "true" (which means when a class is on a the unit of time)
        // .count give you how many class are on this same unit of time
        for i in 0...(range - minUnit) {
            result.append(self.map{ minUnit + i >= $0.0 && minUnit + i <= $0.1}.filter{ $0 == true }.count)
        }
        
        return result.max() ?? 0
    }
}
```

## Test

```swift
class Problem_21Tests: XCTestCase {

    func testExample() {
        let input: [(Int, Int)] = [(30, 75), (0, 50), (60, 150)]
        XCTAssert(input.minimumRoomRequired() == 2)
    }
    
    func test2() {
        let input: [(Int, Int)] = [(1, 2), (1, 3), (2, 3), (4, 5)]
        XCTAssert(input.minimumRoomRequired() == 3)
    }

    func test3() {
        let input: [(Int, Int)] = [(1, 2), (1, 3), (2, 3), (3, 5)]
        XCTAssert(input.minimumRoomRequired() == 3)
    }
}
```