## Description

This problem was asked by Amazon.

Given a string, find the longest palindromic contiguous substring. If there are more than one with the maximum length, return any one.

For example, the longest palindromic substring of `aabcdcb` is `bcdcb`. The longest palindromic substring of `bananas` is `anana`.

## Solution
 

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