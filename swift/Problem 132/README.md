## Description

This question was asked by Riot Games.

Design and implement a HitCounter class that keeps track of requests (or hits). It should support the following operations:

- `record(timestamp)`: records a hit that happened at timestamp
- `total()`: returns the total number of hits recorded
- `range(lower, upper)`: returns the number of hits that occurred between timestamps lower and upper (inclusive)

Follow-up: What if our system has limited memory?


## Solution

```swift
struct HitCounter {
    var hits: [Double]
    var limit: Int

    mutating func record(timestamp: Double) {
        hits.append(timestamp)
        
        if hits.count > limit {
            hits.removeFirst()
        }
    }
    
    func total() -> Int {
        return hits.count
    }
    
    func range(lower: Double, upper: Double) -> Int {
        return hits.filter{ $0 > lower && $0 < upper }.count
    }
}
```

## Test

```swift
class Problem_132Tests: XCTestCase {

    func test_hit_counter() {
        var counter = HitCounter(hits: [], limit: 5)
        
        XCTAssert(counter.total() == 0)
        
        counter.record(timestamp: 1450249151)
        
        XCTAssert(counter.total() == 1)
        
        counter.record(timestamp: 1470249151)
        
        XCTAssert(counter.total() == 2)
        
        counter.record(timestamp: 1520249151)
        
        XCTAssert(counter.total() == 3)
        
        counter.record(timestamp: 1540249151)
        
        XCTAssert(counter.total() == 4)
        
        counter.record(timestamp: 1570249151)
        
        XCTAssert(counter.total() == 5)
        XCTAssert(counter.range(lower: 1450249150, upper: 1470249152) == 2)
        
        counter.record(timestamp: 1570249171)
        
        XCTAssert(counter.total() == 5)
        XCTAssert(counter.range(lower: 1450249150, upper: 1470249152) == 1)
    }

}
```