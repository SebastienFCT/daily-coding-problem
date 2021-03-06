## Description

This problem was asked by Google.

A regular number in mathematics is defined as one which evenly divides some power of `60`. Equivalently, we can say that a regular number is one whose only prime divisors are `2`, `3`, and `5`.

These numbers have had many applications, from helping ancient Babylonians keep time to tuning instruments according to the diatonic scale.

Given an integer `N`, write a program that returns, in order, the first `N` regular numbers.

## Solution

```swift
// Adaptation of https://www.tutorialspoint.com/Ugly-Numbers

func regularNumbers(limit n: Int) -> [Int] {
    
    var result: [Int] = [1]
    
    var a = 2
    var aIncrement = 0
    var b = 3
    var bIncrement = 0
    var c = 5
    var cIncrement = 0
    
    for _ in 1..<n {
        
        let next = min(a, b, c)
        
        result.append(next)
        
        if result.last == a {
            aIncrement += 1
            a = 2 * result[aIncrement]
        }
        
        if result.last == b {
            bIncrement += 1
            b = 3 * result[bIncrement]
        }
        
        if result.last == c {
            cIncrement += 1
            c = 5 * result[cIncrement]
        }
    }
    
    return result
}
```

## Tests

```swift
class Problem_283Tests: XCTestCase {

    func test_regular_numbers() {
        
        XCTAssert(regularNumbers(limit: 20) == [1, 2, 3, 4, 5, 6, 8, 9, 10, 12, 15, 16, 18, 20, 24, 25, 27, 30, 32, 36])
    }

}
```