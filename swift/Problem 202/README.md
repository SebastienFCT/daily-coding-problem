## Description

This problem was asked by Palantir.

Write a program that checks whether an integer is a palindrome. For example, 121 is a palindrome, as well as 888. 678 is not a palindrome. Do not convert the integer into a string.

## Solution

```swift
extension Int {
    
    func isPalindrome() -> Bool {
        
        var n = self
        var reversed = 0
        var remainder = 0
        
        while n != 0 {
            remainder = n % 10
            reversed = reversed * 10 + remainder
            n /= 10
        }
        
        return self == reversed
        
    }
}
```

## Test

```swift
class Problem_202Tests: XCTestCase {

    func test_example() {
        
        XCTAssertTrue(121.isPalindrome())
        XCTAssertTrue(888.isPalindrome())
        XCTAssertFalse(678.isPalindrome())
    }

}
```