## Description

This problem was asked by Pivotal.

A step word is formed by taking a given word, adding a letter, and anagramming the result. For example, starting with the word "APPLE", you can add an "A" and anagram to get "APPEAL".

Given a dictionary of words and an input word, create a function that returns all valid step words.

## Solution

```swift
extension Array where Element == String {
    
    func stepWords(from input: String) -> [String] {
        
        var result: [String] = []
        
        for word in self {
            
            let difference = word.sorted().difference(from: input.sorted())
            
            if (difference.count == 1) {
                result.append(word)
            }
        }
        
        return result
    }
}
```

## Tests

```swift
class Problem_266Tests: XCTestCase {

    func test_example() {
        
        let input = ["APPEAL", "CATS", "DOGS", "APPLES"]
        let actual = input.stepWords(from: "APPLE")
        let expected = ["APPEAL", "APPLES"]
        
        print(actual == expected)
    }

}
```