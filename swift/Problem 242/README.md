## Description

This problem was asked by Twitter.

You are given an array of length `24`, where each element represents the number of new subscribers during the corresponding hour. Implement a data structure that efficiently supports the following:

- update(hour: int, value: int): Increment the element at index hour by value.
- query(start: int, end: int): Retrieve the number of subscribers that have signed up between start and end (inclusive).

You can assume that all values get cleared at the end of the day, and that you will not be asked for `start` and `end` values that wrap around midnight.

## Solution

```swift
enum TwitterError: Swift.Error {
    case invalidInput(String)
    case invalidInterval
}

class DailyTwitter {
    
    var values: [Int]
    
    init() {
        self.values = Array(repeating: 0, count: 24)
    }
    
    init(value: [Int]) throws {
        guard value.count == 24 else {
            throw TwitterError.invalidInput("Length invalid")
        }
        
        self.values = value
    }
    
    func update(hour: Int, value: Int) {
        values[hour] += value
    }
    
    func query(start: Int, end: Int) throws -> Int {
        
        guard end-1 >= start else {
            throw TwitterError.invalidInterval
        }
        
        return values[start...end-1].reduce(0) { $0 + $1 }
        
    }
    
}
```

## Tests

```swift
class Problem_242Tests: XCTestCase {

    func test_daily_twitter() {
        
        let dt = DailyTwitter()
        
        XCTAssert(try dt.query(start: 0, end: 24) == 0)
        
        dt.update(hour: 8, value: 10)
        
        XCTAssert(try dt.query(start: 0, end: 24) == 10)
        XCTAssert(try dt.query(start: 9, end: 10) == 0)
        
        dt.update(hour: 8, value: 1)
        
        XCTAssert(try dt.query(start: 0, end: 24) == 11)
        XCTAssert(try dt.query(start: 9, end: 10) == 0)
        
        dt.update(hour: 9, value: 14)
        
        XCTAssert(try dt.query(start: 0, end: 24) == 25)
        XCTAssert(try dt.query(start: 9, end: 10) == 14)
    }

}
```