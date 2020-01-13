## Description

This problem was asked by Apple.

Implement the function `fib(n)`, which returns the `nth` number in the Fibonacci sequence, using only `O(1)` space.

## Solution

```swift
func fib(n: Int) -> Int {
    
    // According to http://www.maths.surrey.ac.uk/hosted-sites/R.Knott/Fibonacci/fibFormula.html
    // Fibonacci sequence can be approximated using the golden number 1.618...
    
    let phi = (sqrt(5) + 1) / 2
    let rPhi = 1 / phi
    
    let numerator = pow(phi, Double(n)) - pow(-rPhi, Double(n))
    let denumerator = phi - (-rPhi)
    
    return Int(numerator / denumerator)
}
```

## Tests

```swift
class Problem_233Tests: XCTestCase {

    func test_fibonacci() {
        
        let expected = [0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610, 987, 1597, 2584, 4181, 6765]
        
        var actual: [Int] = []
        for i in 0...20 {
            actual.append(fib(n: i))
        }
        
        XCTAssert(actual == expected)
    }

}
```