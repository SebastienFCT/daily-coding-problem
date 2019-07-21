## Description

This problem was asked by Amazon.

Given a string s and an integer k, break up the string into multiple lines such that each line has a length of k or less. You must break it up so that words don't break across lines. Each line has to have the maximum possible amount of words. If there's no way to break the text up, then return null.

You can assume that there are no spaces at the ends of the string and that there is exactly one space between each word.

For example, given the string "the quick brown fox jumps over the lazy dog" and k = 10, you should return: ["the quick", "brown fox", "jumps over", "the lazy", "dog"]. No string in the list has a length of more than 10.

## Solution

We're given a string and we want to distribute its words in lines of k length
 
- First we will split the string into words (using spaces as a splitting reference)
- Then we will loop through the words and append them to array of string, each string representing a row

```swift
extension String {
    func distribute(k: Int) -> [String]? {
        
        let splitted = self.split(separator: " ")
        
        print("splitted: \(splitted)")
        
        var result: [String] = []
        var line = ""
        
        for i in 0..<splitted.count {
            let word = splitted[i]
            
            guard String(word).count <= k else {
                return nil
            }
            
            if line.isEmpty {
                line.append(String(word))
            } else {
                // + 1 for the space in between
                if line.count + String(word).count + 1 > k {
                    result.append(line)
                    line = String(word)
                } else {
                    line += " \(String(word))"
                }
            }
            
            if i == splitted.count-1 && !line.isEmpty {
                result.append(line)
            }
        }
        
        return result
    }
}
```

## Test

```swift
class Problem_57Tests: XCTestCase {

    func test_example() {
        let input = "the quick brown fox jumps over the lazy dog"
        
        XCTAssert(input.distribute(k: 10) == ["the quick", "brown fox", "jumps over", "the lazy", "dog"])
    }

}
```