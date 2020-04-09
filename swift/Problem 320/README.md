## Description

This problem was asked by Amazon.

Given a string, find the length of the smallest window that contains every distinct character. Characters may appear more than once in the window.

For example, given "jiujitsu", you should return `5`, corresponding to the final five letters.

## Solution

```swift
extension String {
    
    func smallestWindowWithAllDistinctCharacters() -> Int {
        
        var uniqueCharacters: Set<Character> = Set()
        
        for char in self {
            uniqueCharacters.insert(char)
        }
        
        if uniqueCharacters.count == count {
            return count
        }
        
        var candidates: [Int] = []
        
        for i in 0..<count-uniqueCharacters.count {
            
            for j in i+1..<count {
                
                let current = Set(self[i...j])
                
                if (uniqueCharacters.subtracting(current).count == 0) {
                    candidates.append(current.count)
                    break
                }
            }
        }
        
        let sorted = candidates.sorted{ $0 < $1 }
        
        return sorted.first ?? count
    }
}
```

## Tests

```swift
class Problem_320Tests: XCTestCase {

    func test_example() {
        
        let input = "jiujitsu"
        
        let actual = input.smallestWindowWithAllDistinctCharacters()
        let expected = 5
        
        XCTAssert(actual == expected)
    }

}
```