## Description

This problem was asked by Apple.

A Collatz sequence in mathematics can be defined as follows. Starting with any positive integer:

if n is even, the next number in the sequence is n / 2
if n is odd, the next number in the sequence is 3n + 1
It is conjectured that every such sequence eventually reaches the number `1`. Test this conjecture.

Bonus: What input `n <= 1000000` gives the longest sequence?

## Solution

```swift
func longestCollatzSequence() -> [Int] {
    var result: [Int] = []
    
    for i in 2...1000000 {
        let collatz = testCollatz(withInt: i)
        
        if collatz.count > result.count {
            result = collatz
        }
    }
    
    return result
}

func testCollatz(withInt: Int) -> [Int] {
    var sequence = [withInt]
    var current = withInt
    
    while true {
        
        if current == 1 {
            return sequence
        }
        
        if current % 2 == 0 {
            current = current / 2
        } else {
            current = (current * 3) + 1
        }
        
        sequence.append(current)
    }
    
    return sequence
}
```

## Test

```swift
class Problem_210Tests: XCTestCase {

    func test_collatz() {
        
        print(longestCollatzSequence().count)
    }

}
```