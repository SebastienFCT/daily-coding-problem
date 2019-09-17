## Description

This problem was asked by Facebook.

Given a string and a set of delimiters, reverse the words in the string while maintaining the relative order of the delimiters. For example, given "hello/world:here", return "here/world:hello"

Follow-up: Does your solution work for the following cases: "hello/world:here/", "hello//world:here"

## Solution

```swift
extension String {
    func reverse(withDelimeters delimiters: Set<Character>) -> String {
        var copy = self
        
        var result = ""
        
        var words: [String?] = []
        var delimiterList: [Character] = []
        
        // This nil indexes isn't really ideal nor readable for developer but it's the first idea that came to mind to handle the last case in the follow up question given the existing code
        var currentIndex = 0
        var nilIndexes: [Int] = []
        
        var currentWord = ""
        
        while !copy.isEmpty {
            let next = copy.removeFirst()
            
            if delimiters.contains(next) {
                delimiterList.append(next)
                if currentWord.isEmpty {
                    nilIndexes.append(currentIndex)
                } else {
                    words.append(currentWord)
                }
                currentWord = ""
                currentIndex += 1
            } else {
                currentWord += String(next)
            }
        }
        
        if currentWord.count > 0 {
            words.append(currentWord)
            currentWord = ""
        }
        
        words = words.reversed()
        
        for index in nilIndexes {
            words.insert(nil, at: index)
        }
        
        for word in words {
            if let word = word {
                result += word
            }
            
            if !delimiterList.isEmpty {
                result += String(delimiterList.removeFirst())
            }
        }
        
        return result
    }
}
```

## Test

```swift
class Problem_114Tests: XCTestCase {

    func test_example_1() {
        XCTAssert("hello/world:here".reverse(withDelimeters: Set(["/", ":"])) == "here/world:hello")
    }
    
    func test_example_2() {
        XCTAssert("hello/world:here/".reverse(withDelimeters: Set(["/", ":"])) == "here/world:hello/")
    }
    
    func test_example_3() {
        XCTAssert("hello//world:here".reverse(withDelimeters: Set(["/", ":"])) == "here//world:hello")
    }

}
```