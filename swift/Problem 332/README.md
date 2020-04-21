## Description

This problem was asked by Jane Street.

Given integers M and N, write a program that counts how many positive integer pairs (a, b) satisfy the following conditions:

- a + b = M
- a XOR b = N

## Solution

```swift
struct JSProblem {
    
    var m: Int
    var n: Int
    
    func findPairs() -> [(Int, Int)] {
        
        guard m > 0, n > 0 else {
            fatalError("m and n must be positive")
        }
        
        var result: [(Int, Int)] = []
        
        for i in 0...m/2 {
            
            if i ^ (m-i) == n {
                result.append((i, m-i))
            }
        }
        
        return result
    }
}
```

## Tests

```swift
class Problem_332Tests: XCTestCase {

    func test_jane_street_problem() {
        
        for _ in 0...10000 {
            let left = Int.random(in: 10...100)
            let right = Int.random(in: 10...100)
            let input = JSProblem(m: left, n: right)
            
            print("result for (\(left), \(right)) are \(input.findPairs())")
        }
    }

}
```