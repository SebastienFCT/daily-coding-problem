## Description

This problem was asked by Amazon.

You are given a list of data entries that represent entries and exits of groups of people into a building. An entry looks like this:

`{"timestamp": 1526579928, count: 3, "type": "enter"}`

This means 3 people entered the building. An exit looks like this:

`{"timestamp": 1526580382, count: 2, "type": "exit"}`

This means that 2 people exited the building. `timestamp` is in Unix time.

Find the busiest period in the building, that is, the time with the most people in the building. Return it as a pair of `(start, end)` timestamps. You can assume the building always starts off and ends up empty, i.e. with 0 people inside.

## Solution
    
```swift
struct Presence {
    
    enum entryType: String {
        case enter = "enter"
        case exit = "exit"
    }

    typealias Entry = (timestamp: Double, count: Int, type: entryType)
    
    var entries: [Entry]
    
    func busiestPeriod() -> (Double, Double) {
        let sorted = entries.sorted{ $0.timestamp < $1.timestamp }
        
        var current = 0
        var max = 0
        
        var currentPeriod: (before: Double, after: Double) = (sorted.first!.timestamp, sorted.first!.timestamp)
        var maxPeriod = currentPeriod
        
        for entry in sorted {
            currentPeriod.before = currentPeriod.after
            currentPeriod.after = entry.timestamp
            
            switch entry.type {
            case .enter:
                current += entry.count
                if current > max {
                    max = current
                    maxPeriod = currentPeriod
                }
            case .exit:
                current -= entry.count
            }
        }
        
        return maxPeriod
    }
}
```

## Test

```swift
class Problem_171Tests: XCTestCase {

    func test_presence() {
        let presence = Presence(entries: [
            (1573599077, 1, .enter),
            (1573599078, 7, .enter),
            (1573599078, 1, .exit),
            (1573599079, 7, .enter),
            (1573599079, 2, .exit)
        ])
        
        XCTAssert(presence.busiestPeriod() == (1573599078.0, 1573599079.0))
    }

}
```