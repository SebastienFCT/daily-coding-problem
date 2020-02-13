## Description

This problem was asked by Nest.

Create a basic sentence checker that takes in a stream of characters and determines whether they form valid sentences. If a sentence is valid, the program should print it out.

We can consider a sentence valid if it conforms to the following rules:

1. The sentence must start with a capital letter, followed by a lowercase letter or a space.
2. All other characters must be lowercase letters, separators (,,;,:) or terminal marks (.,?,!,‽).
3. There must be a single space between each word.
4. The sentence must end with a terminal mark immediately following a word.

## Solution

```swift
extension String {
    
    func areValidSentences() -> Bool {
        
        guard count > 2,  first!.isUppercase else {
            return false
        }
        
        let last = self.last!
        
        guard ["!", "?", "."].contains(last) else {
            return false
        }
        
        var previous = first!
        var current = self[1]
        
        if !((current.isLetter && current.isLowercase) || (current == " ")) {
            return false
        }
        
        for i in 2..<count {
            print("currnet: \(self[i])")
            previous = current
            current = self[i]
            
            switch previous {
            case " ":
                if [" ", "!", "?", "."].contains(current) { return false }
            case "?", "!", ".":
                if current.isLowercase { return false }
                if !current.isLetter { return false }
            default:
                break
            }
        }
        
        return true
    }
}
```

## Tests

```swift
class Problem_263Tests: XCTestCase {

    func test_sentences() {
        
        XCTAssertFalse("The quick brown fox jumps over the lazy dog".areValidSentences())
        XCTAssertTrue("The quick brown fox jumps over the lazy dog!".areValidSentences())
        XCTAssertTrue("The quick brown fox.Jumps over,the lazy dog!".areValidSentences())
        XCTAssertFalse("The quick brown fox. Jumps over,the lazy dog!".areValidSentences())
    }

}
```