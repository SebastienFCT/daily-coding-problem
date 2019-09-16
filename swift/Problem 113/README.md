## Description

This problem was asked by Google.

Given a string of words delimited by spaces, reverse the words in string. For example, given "hello world here", return "here world hello"

Follow-up: given a mutable string representation, can you perform this operation in-place?

## Solution

```swift
extension String {
    func reverseWords() -> String {
        
        let words = self.components(separatedBy: .whitespacesAndNewlines).reversed()
        
        return words.joined(separator: " ")
    }
}
```

## Test

```swift
class Problem_113Tests: XCTestCase {

    func test_reverse() {
        XCTAssert("Hello Green World".reverseWords() == "World Green Hello")
    }

}
```