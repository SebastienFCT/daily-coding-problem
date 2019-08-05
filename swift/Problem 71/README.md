## Description

This problem was asked by Two Sigma.

Using a function `rand7()` that returns an integer from 1 to 7 (inclusive) with uniform probability, implement a function `rand5()` that returns an integer from 1 to 5 (inclusive).

## Solution

```swift
struct TwoSigma {
    static func rand7() -> Int {
        return Int.random(in: 1...7)
    }
    
    static func rand5() -> Int {
        var result: Int = 0
        
        while result <= 0 || result > 5 {
            result = TwoSigma.rand7()
        }
        
        return result
    }
}
```

## Test

```swift
class Problem_71Tests: XCTestCase {

    func test_rand5() {
        var distribution: [Int : Int] = [
            1:0,
            2:0,
            3:0,
            4:0,
            5:0
        ]
        
        for _ in 0...100000 {
            let rand5 = TwoSigma.rand5()
            
            distribution[rand5]! += 1
        }
        
        print(distribution.mapValues{ value in
            return Double(value) / 10000.0
        })
    }

}
```