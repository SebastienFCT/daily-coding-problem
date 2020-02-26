## Description

This problem was asked by Dropbox.

Implement an efficient string matching algorithm.

That is, given a string of length `N` and a pattern of length `k`, write a program that searches for the pattern in the string with less than `O(N * k)` worst-case time complexity.

If the pattern is found, return the start index of its location. If not, return `False`.


## Solution

```swift
extension String {
    
    func find(pattern: String) -> [Int]? {
        
        guard pattern.count <= count else {
            return nil
        }
        
        var result: [Int] = []
        
        for i in 0...count-pattern.count {
            if self[i...i+pattern.count-1] == pattern {
                result.append(i)
            }
        }
        
        return result.isEmpty ? nil : result
    }
}
```

## Tests

```swift
class Problem_276Tests: XCTestCase {

    func test_find_pattern_1() {
        
        let input = "the red fox jumped over the lazy dog"
        let expected = [4]
        let actual = input.find(pattern: "red")
        
        XCTAssert(actual == expected)
    }
    
    func test_find_pattern_2() {
        
        let input = "the red fox jumped over the red dog"
        let expected = [4, 28]
        let actual = input.find(pattern: "red")
        
        XCTAssert(actual == expected)
    }

}
```