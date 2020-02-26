## Description

This problem was asked by Google.

UTF-8 is a character encoding that maps each symbol to one, two, three, or four bytes.

For example, the Euro sign, €, corresponds to the three bytes `11100010` `10000010` `10101100`. The rules for mapping characters are as follows:

- For a single-byte character, the first bit must be zero.
- For an n-byte character, the first byte starts with n ones and a zero. The other n - 1 bytes all start with `10`.
Visually, this can be represented as follows.

```
 Bytes   |           Byte format
-----------------------------------------------
   1     | 0xxxxxxx
   2     | 110xxxxx 10xxxxxx
   3     | 1110xxxx 10xxxxxx 10xxxxxx
   4     | 11110xxx 10xxxxxx 10xxxxxx 10xxxxxx
```

Write a program that takes in an array of integers representing byte values, and returns whether it is a valid UTF-8 encoding.


## Solution

```swift
extension Array where Element == Int {
    
    func isValidUtf8() -> Bool {
        
        guard count == 32 || count == 24 || count == 16 || count == 8 else {
            return false
        }
        
        guard (filter{ $0 != 0 && $0 != 1 }.count == 0) else {
            return false
        }
        
        if self[0] == 0 {
            return true
        }
        
        if self[0...2] == [1, 1, 0] {
            return self[8...9] == [1, 0]
        }
        
        if self[0...3] == [1,1,1,0] {
            return self[8...9] == [1, 0] && self[16...17] == [1, 0]
        }
        
        if self[0...4] == [1, 1, 1, 1, 0] {
            return self[8...9] == [1, 0] && self[16...17] == [1, 0] && self[24...25] == [1, 0]
        }
        
        return false
    }
}
```

## Tests

```swift
class Problem_277Tests: XCTestCase {

    func test_utf8_validation() {
        
        XCTAssertTrue([1,1,1,0,0,0,1,0,1,0,0,0,0,0,1,0,1,0,1,0,1,1,0,0].isValidUtf8())
        XCTAssertFalse([1,0,0,0,0,0,1,0,1,0,0,0,0,0,1,0,1,0,1,0,1,1,0,0].isValidUtf8())
        XCTAssertFalse([1,0].isValidUtf8())
        
    }
}
```