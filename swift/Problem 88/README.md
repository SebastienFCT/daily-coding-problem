## Description

This question was asked by ContextLogic.

Implement division of two positive integers without using the division, multiplication, or modulus operators. Return the quotient as an integer, ignoring the remainder.

## Solution

No too much to explain here.

A division (without remainder) is basically "how many times do I have this in that?"

```swift
struct GoogleCalculator {
    
    func customQuotientDivision(dividend: Int, divisor: Int) -> Int {
        guard divisor != 0 else {
            fatalError("divisor can't be 0")
        }
        
        return findHowManyTime(x: divisor, inTotal: dividend).count
    }
    
    func findHowManyTime(x: Int, inTotal total: Int) -> (count: Int, sum: Int) {
        var count = 0
        var sum = 0
        
        while sum < total {
            count += 1
            sum += x
        }
        
        if sum > total {
            return (count: count-1, sum: sum-x)
        }
        
        return (count: count, sum: sum)
    }
}
```

## Test

```swift
class Problem_88Tests: XCTestCase {

    func test_rounded() {
        let calculator = GoogleCalculator()
        XCTAssert(calculator.customQuotientDivision(dividend: 100, divisor: 10) == 10)
    }
    
    func test_notRounded() {
        let calculator = GoogleCalculator()
        XCTAssert(calculator.customQuotientDivision(dividend: 100, divisor: 33) == 3)
    }

}
```