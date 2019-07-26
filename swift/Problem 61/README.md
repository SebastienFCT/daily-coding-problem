## Description

This problem was asked by Google.

Implement integer exponentiation. That is, implement the `pow(x, y)` function, where `x` and y are integers and returns `x^y`.

Do this faster than the naive method of repeated multiplication.

For example, `pow(2, 10)` should return `1024`.

## Solution

My first intuition for this problem is to see how I can decompose the exponential operation. For example:
 
- 2^4 = 2*2*2*2 which is also equal to 4*4. 4*4 = 4^2 => `2^4 = 4^2`
- 4^5 = 4*4*4*4*4 = 4*4^4 = 4*16^2

```swift
func exponential(base: Int, exponent: Int) -> Int {
    var base = base
    var exponent = exponent
    var result = 1
    
    while true {
        if exponent % 2 == 1 {
            result *= base
        }
        
        exponent = exponent / 2
        
        if exponent == 0 { break }
        
        base = base * base
    }
    
    return result
}
```

I didn't feel like I was really making things "faster" as instead of doing 2*2*2*2, I'm doing 4*4 (which is probably the same thing in the computer language...) so I looked it up:
 
https://www.geeksforgeeks.org/exponential-squaring-fast-modulo-multiplication/

Exponential squaring is based on the following facts, exp(x,n) =:

- x.exp(x,n-1) if n is even
- x.exp(exp(x,2), (n-1)/2) if n is odd

The implementation is a recursive function that look like this

```swift
func exponentialSquaring(base: Int, exponent: Int) -> Int {
    if exponent == 0 { return 1 }
    
    if exponent % 2 == 1 {
        return base * exponentialSquaring(base: base, exponent: (exponent - 1))
    }
    
    return exponentialSquaring(base: base, exponent: (exponent / 2)) * exponentialSquaring(base: base, exponent: (exponent / 2))
}
```

## Test

```swift
class Problem_61Tests: XCTestCase {

    func test_1() {
        print(exponential(base: 2, exponent: 10))
    }

    func test_2() {
        print(exponentialSquaring(base: 2, exponent: 10))
    }
}
```