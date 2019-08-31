## Description

This problem was asked by Stripe.

Write a map implementation with a get function that lets you retrieve the value of a key at a particular time.

It should contain the following methods:

- `set(key, value, time)`: sets key to value for t = time.
- `get(key, time)`: gets the key at t = time.

The map should work like this. If we set a key at a particular time, it will maintain that value forever or until it gets set at a later time. In other words, when we get a key at a time, it should return the value that was set for that key set at the most recent time.

Consider the following examples:

```
d.set(1, 1, 0) # set key 1 to value 1 at time 0
d.set(1, 2, 2) # set key 1 to value 2 at time 2
d.get(1, 1) # get key 1 at time 1 should be 1
d.get(1, 3) # get key 1 at time 3 should be 2
```

```
d.set(1, 1, 5) # set key 1 to value 1 at time 5
d.get(1, 0) # get key 1 at time 0 should be null
d.get(1, 10) # get key 1 at time 10 should be 1
```

```
d.set(1, 1, 0) # set key 1 to value 1 at time 0
d.set(1, 2, 0) # set key 1 to value 2 at time 0
d.get(1, 0) # get key 1 at time 0 should be 2
```

## Solution

```swift
struct TimedDictionary {
    var map: [String : [(value: Int, time: Int)]]
    
    func get(key: String, time: Int) -> Int? {
        if let values = map[key] {
            let filtered = values.filter{ $0.time <= time }
            
            if filtered.isEmpty {
                return nil
            }
            
            return filtered.last!.value
        }
        
        return nil
    }
    
    mutating func set(key: String, value: Int, time: Int) {
        if let values = map[key] {
            
            for i in 0..<values.count {
                let current = values[i]
                
                if current.time == time {
                    var copy = values
                    copy[i].value = value
                    
                    map[key] = copy
                    return
                }
            }
            
            map[key]?.append((value: value, time: time))
            
        } else {
            map[key] = [(value: value, time: time)]
        }
    }
}
```

## Test

```swift
class Problem_97Tests: XCTestCase {

    func test_1() {
        var td = TimedDictionary(map: [:])
        
        td.set(key: "1", value: 1, time: 0)
        td.set(key: "1", value: 2, time: 2)
        XCTAssert(td.get(key: "1", time: 1) == 1)
        XCTAssert(td.get(key: "1", time: 3) == 2)
    }
    
    func test_2() {
        var td = TimedDictionary(map: [:])
        
        td.set(key: "1", value: 1, time: 5)
        XCTAssert(td.get(key: "1", time: 0) == nil)
        XCTAssert(td.get(key: "1", time: 10) == 1)
    }
    
    func test_3() {
        var td = TimedDictionary(map: [:])
        
        td.set(key: "1", value: 1, time: 0)
        td.set(key: "1", value: 2, time: 0)
        XCTAssert(td.get(key: "1", time: 0) == 2)
    }

}
```