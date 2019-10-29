## Description

This problem was asked by Amazon.

Given a string, determine whether any permutation of it is a palindrome.

For example, `carrace` should return true, since it can be rearranged to form `racecar`, which is a palindrome. `daily` should return false, since there's no rearrangement that can form a palindrome.

## Solution

```swift
extension String {
    func isPalindrome() -> Bool {
        var characterSet: Set<Character> = Set()
        
        for character in self {
            if characterSet.contains(character) {
                characterSet.remove(character)
            } else {
                characterSet.insert(character)
            }
        }
        
        if self.count % 2 == 0 {
            return characterSet.isEmpty
        } else {
            return characterSet.count == 1
        }
    }
}
```

## Test

```swift
class Problem_157Tests: XCTestCase {

    func test_example() {
        XCTAssertTrue("carrace".isPalindrome())
        XCTAssertFalse("daily".isPalindrome())
    }

}
```