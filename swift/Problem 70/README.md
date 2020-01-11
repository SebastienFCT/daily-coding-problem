## Description

This problem was asked by Microsoft.

A number is considered perfect if its digits sum up to exactly 10.

Given a positive integer `n`, return the `n-th` perfect number.

For example, given 1, you should return 19. Given 2, you should return 28.

## Solution

```swift
struct Microsoft {
    func naivePerfect(n: Int) -> Int {
        var count = 0
        
        for i in 0..<Int.max {
            if i.sumOfDigits() == 10 {
                count += 1
            }
            
            if count == n {
                return i
            }
        }
        
        return 0
    }
}

extension Int {
    func sumOfDigits() -> Int {
        var result = 0
        var copy = self
        
        while copy > 0 {
            result += copy % 10
            copy /= 10
        }
        
        return result
    }
}
```