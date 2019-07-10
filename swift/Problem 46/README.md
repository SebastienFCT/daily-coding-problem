## Description

This problem was asked by Amazon.

Given a string, find the longest palindromic contiguous substring. If there are more than one with the maximum length, return any one.

For example, the longest palindromic substring of `aabcdcb` is `bcdcb`. The longest palindromic substring of `bananas` is `anana`.

## Solution

For this problem, we need to visualize the string as an array of character

A palindrome is when the array is symetric, aka

- with N = size / 2, array(N+X) = array(N-1-X) for even arrays
- with N = size / 2, array(N+X+0.5) = array(N-X-0.5) for odd arrays

Let start by implementing a function that test if a string is a palindrome
 

```swift
extension String {
    
    func isPalindrom() -> Bool {
        var copy = self
        
        while !copy.isEmpty {
            if copy.count == 1 {
                return true
            }
            
            let first = copy.removeFirst()
            let last = copy.removeLast()
            
            if first != last {
                return false
            }
        }
        
        return true
    }
}
```

Ok, that's a good start, let's implement this function a little more and try to get the minimum possible palinddrom from a string (if there is none, then return nil - we ignore single characters)

```swift
extension String {
    
    func anyPalindrome() -> String? {
        if self.count <= 1 {
            return nil
        }
        
        if self.isPalindrom() {
            return self
        } else {
            var copy = self
            copy.removeFirst()
            copy.removeLast()
            
            return copy.anyPalindrome()
        }
    }
}
```

Now from this, we should be able to return the longest palindromic sub-string:
 
- we start from the full string and check if there is any palindrome
- if we find one, we check if it size is bigger than input.size - 1, otherwise we can try the same algo on the same word less its last character or its first

```swift
extension String {
    
    func longestPalindrom() -> String? {
        let copy = self
        
        if copy.isPalindrom() {
            return copy
        }
        
        if let anyPalindrom = copy.anyPalindrome() {
            if anyPalindrom.count == copy.count - 1 {
                return anyPalindrom
            }
        }
        
        var left = copy
        left.removeFirst()
        var right = copy
        right.removeLast()
        
        switch (left.longestPalindrom(), right.longestPalindrom()) {
        case (nil, nil):
            return nil
        case (nil, _):
            return right.longestPalindrom()!
        case (_, nil):
            return left.longestPalindrom()!
        default:
            let leftPalindrom = left.longestPalindrom()!
            let rightPalindrom = right.longestPalindrom()!
            
            return leftPalindrom.count > rightPalindrom.count ? leftPalindrom : rightPalindrom
        }
    }
}
```

## Test

```swift
class Problem_46Tests: XCTestCase {

    func test_1() {
        let a = "abccba"
        XCTAssertTrue(a.isPalindrom())
        
        let b = "abbcca"
        XCTAssertFalse(b.isPalindrom())
    }
    
    func test_2() {
        let a = "abccba"
        XCTAssert(a.anyPalindrome()! == "abccba")
        
        let b = "abbcca"
        XCTAssertNil(b.anyPalindrome())
    }
    
    func test_3() {
        let input1 = "aabcdcb"
        XCTAssert(input1.longestPalindrom() == "bcdcb")
        
        let input2 = "bananas"
        XCTAssert(input2.longestPalindrom() == "anana")
    }

}
```