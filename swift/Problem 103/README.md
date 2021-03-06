## Description

This problem was asked by Square.

Given a string and a set of characters, return the shortest substring containing all the characters in the set.

For example, given the string "figehaeci" and the set of characters {a, e, i}, you should return "aeci".

If there is no substring containing all the characters in the set, return null.

## Solution

```swift
extension String {
    func subSequeceContaining(set: Set<Character>) -> String? {
        let toArray = self.toArrayOfCharacter()
        
        return toArray.subSequenceContaining(set: set).toString()
    }
    
    func toArrayOfCharacter() -> [Character] {
        var result: [Character] = []
        
        for char in self {
            result.append(char)
        }
        
        return result
    }
}

extension Array where Element == Character {
    
    func subSequenceContaining(set: Set<Character>) -> [Character] {
        var candidates: [[Character]] = []
        
        for i in 0..<count {
            var copy = Array(self.suffix(count-i))
            var copySet = set
            var current: [Character] = []
            
            while !copySet.isEmpty && !copy.isEmpty {
                let next = copy.removeFirst()
                current.append(next)
                
                if copySet.contains(next) {
                    copySet.remove(next)
                }
                
                if copySet.isEmpty {
                    candidates.append(current)
                }
            }
        }
        
        return candidates.sorted{ $0.count < $1.count }.first ?? []
    }
    
    func toString() -> String? {
        guard !self.isEmpty else {
            return nil
        }
        
        var result = ""
        
        for char in self {
            result += String(char)
        }
        
        return result
    }
}
```

## Test

```swift
class Problem_103Tests: XCTestCase {

    func test_example() {
        let input = "figehaeci"
        let set: Set<Character> = ["a", "e", "i"]
        XCTAssert(input.subSequeceContaining(set: set) == "aeci")
    }

}
```