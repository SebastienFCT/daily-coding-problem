## Description

This problem was asked by Microsoft.

Given a string and a pattern, find the starting indices of all occurrences of the pattern in the string. For example, given the string "abracadabra" and the pattern "abr", you should return `[0, 7]`.

## Solution

```swift
extension String {
    
    func indexes(forSubstring substring: String) -> [Int] {
        
        var result: [Int] = []
        
        for i in 0..<count {
            let copy = suffix(count-i)
            
            if copy.prefix(substring.count) == substring {
                result.append(i)
            }
        }
        
        return result
    }
}
```

## Test

```swift
class Problem_211Tests: XCTestCase {

    func test_example() {
        let input = "abracadabra"
        let expected = [0, 7]
        let actual = input.indexes(forSubstring: "abr")
        
        XCTAssert(actual == expected)
    }

}
```