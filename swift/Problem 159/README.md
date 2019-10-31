## Description

This problem was asked by Google.

Given a string, return the first recurring character in it, or null if there is no recurring character.

For example, given the string "acbbac", return "b". Given the string "abcdef", return null.

## Solution

```swift
extension String {
    func firstRecurringCharacter() -> Character? {
        
        var scanned: Set<Character> = Set()
        
        for character in self {            
            if scanned.contains(character) {
                return character
            }
            
            scanned.insert(character)
        }
        
        return nil
    }
}
```

## Test

```swift
class Problem_159Tests: XCTestCase {

    func test_example() {
        XCTAssert("acbbac".firstRecurringCharacter() == "b")
        XCTAssertNil("abcdef".firstRecurringCharacter())
    }

}
```