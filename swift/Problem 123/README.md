## Description

This problem was asked by LinkedIn.

Given a string, return whether it represents a number. Here are the different kinds of numbers:

- "10", a positive integer
- "-10", a negative integer
- "10.1", a positive real number
- "-10.1", a negative real number
- "1e5", a number in scientific notation

And here are examples of non-numbers:

- "a"
- "x 1"
- "a -2"
- "-"

## Solution

```swift
extension String {
    
    func representNumber() -> Bool {
        
        if matchesRegex("^[+-]?([0-9]*\\.?[0-9]+|[0-9]+\\.?[0-9]*)([eE][+-]?[0-9]+)?$") {
            return true
        }
        
        return false
    }
    
    func matchesRegex(_ regexString: String) -> Bool {
        if let regex = try? NSRegularExpression(pattern: regexString), let _ = regex.firstMatch(in: self.trimmingCharacters(in: .whitespacesAndNewlines), options: [], range: NSRange(location: 0, length: self.count)) {
            return true
        }
        
        return false
    }
}
```

## Test

```swift
class Problem_123Tests: XCTestCase {

    func test_example() {
        XCTAssertTrue("10".representNumber())
        XCTAssertTrue("-10".representNumber())
        XCTAssertTrue("10.1".representNumber())
        XCTAssertTrue("-10.1".representNumber())
        XCTAssertTrue("1e5".representNumber())
        XCTAssertFalse("a".representNumber())
        XCTAssertFalse("x 1".representNumber())
        XCTAssertFalse("a -2".representNumber())
        XCTAssertFalse("-".representNumber())
    }

}
```