## Description

This problem was asked by Citrix.

You are given a circular lock with three wheels, each of which display the numbers `0` through `9` in order. Each of these wheels rotate clockwise and counterclockwise.

In addition, the lock has a certain number of "dead ends", meaning that if you turn the wheels to one of these combinations, the lock becomes stuck in that state and cannot be opened.

Let us consider a "move" to be a rotation of a single wheel by one digit, in either direction. Given a lock initially set to `000`, a target combination, and a list of dead ends, write a function that returns the minimum number of moves required to reach the target state, or `None` if this is impossible.

## Solution

```swift
typealias LockCombination = (first: Int, second: Int, third: Int)

struct Lock {
    
    var code: LockCombination
    var deadEnds: [LockCombination]
    
    func minMoves() -> Int? {
        
        if deadEnds.contains(where: { (value) -> Bool in
            value.first == 0 && value.second == 0 && value.third == 0
        }) {
            return nil
        }
        
        var candidates: [Int] = []
        
        for firstAscending in [true, false] {
         
            for secondAscending in [true, false] {
                
                for thirdAscending in [true, false] {
                    
                    var values: [[Int]] = [[], [], []]
                    
                    var count = 0
                    
                    if firstAscending {
                        count += code.first
                        
                        for i in 0...code.first {
                            values[0].append(i)
                        }
                    } else {
                        count += (10 - code.first)
                        
                        values[0].append(0)
                        for i in stride(from: 9, through: (10 - code.first), by: -1) {
                            values[0].append(i)
                        }
                    }
                    
                    if secondAscending {
                        count += code.second
                        
                        for i in 0...code.second {
                            values[1].append(i)
                        }
                    } else {
                        count += (10 - code.second)
                        
                        values[1].append(0)
                        for i in stride(from: 9, through: (10 - code.second), by: -1) {
                            values[1].append(i)
                        }
                    }
                    
                    if thirdAscending {
                        count += code.third
                        
                        for i in 0...code.third {
                            values[2].append(i)
                        }
                    } else {
                        count += (10 - code.third)
                        
                        values[2].append(0)
                        for i in stride(from: 9, through: (10 - code.third), by: -1) {
                            values[2].append(i)
                        }
                    }
                    
                    if deadEnds.count > 0 {
                        let deFirstValues = deadEnds.map{ $0.first }
                        
                        guard (deFirstValues.filter{ values[0].contains($0) }.count > 0) else {
                            continue
                        }
                        
                        let deSecondValues = deadEnds.map{ $0.second }
                        
                        guard (deSecondValues.filter{ values[1].contains($0) }.count > 0) else {
                            continue
                        }
                        
                        let deThirdValues = deadEnds.map{ $0.third }
                        
                        guard (deThirdValues.filter{ values[2].contains($0) }.count > 0) else {
                            continue
                        }
                    }
                    
                    candidates.append(count)
                }
            }
        }
        
        let sorted = candidates.sorted{ $0 < $1 }
        
        return sorted.first
    }
}
```

## Tests

```swift
class Problem_313Tests: XCTestCase {

    func test_lock_count() {
        
        let lock = Lock(code: (0,0,1), deadEnds: [])
        
        let actual = lock.minMoves()
        let expected = 1
        
        XCTAssert(actual == expected)
    }
    
    func test_lock_count2() {
        
        let lock = Lock(code: (0,0,9), deadEnds: [])
        
        let actual = lock.minMoves()
        let expected = 1
        
        XCTAssert(actual == expected)
    }

}
```