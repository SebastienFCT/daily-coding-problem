### Description

This problem was asked by Facebook.

Given a stream of elements too large to store in memory, pick a random element from the stream with uniform probability.

### Solution

```swift
func testExample() {
    var random = Random()
    let max = 30
    
    for i in 0..<max {
        print("After reading \(i) value(s). Random = \(random.selectRandom(x: i))")
    }
}

// https://www.geeksforgeeks.org/select-a-random-number-from-stream-with-o1-space/

struct Random {
    
    var result = 0
    var count = 0
    
    mutating func selectRandom(x: Int) -> Int {
        count += 1
        
        if (count == 1) {
            result = count
        } else {
            let rand = Int.random(in: 0...(count-1))
            
            if (rand == count - 1) {
                result = x
            }
        }
        
        return result
    }
}
```