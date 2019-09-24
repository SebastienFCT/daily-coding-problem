## Description

This problem was asked by Facebook.

Given a string of round, curly, and square open and closing brackets, return whether the brackets are balanced (well-formed).

For example, given the string `([])[]({})`, you should return true.

Given the string `([)]` or `((()`, you should return false.

## Solution

```swift
extension String {    
    mutating func isWellFormed3(forPairs pairs: Pairs) -> Bool {
        var openingBrackets: [Character] = []
        
        while !self.isEmpty {
            if let next = self.first {
                if pairs.isOpeningCharacter(next) {
                    openingBrackets.append(next)
                }
                
                if pairs.isClosingCharacter(next), let lastOpening = openingBrackets.last {
                    if pairs.matches(lhs: lastOpening, rhs: next) {
                        _ = openingBrackets.removeLast()
                    } else {
                        return false
                    }
                }
                
                self = String(self.dropFirst())
            }
        }
        
        if !openingBrackets.isEmpty {
            // some opening brackets didn't close
            return false
        }
        
        return true
    }
}

struct Pairs {
    var sets: [Pair]
    
    func matches(lhs: Character, rhs: Character) -> Bool {
        return sets.contains(where: { (pair) -> Bool in
            (pair.left == lhs && pair.right == rhs)
        })
    }
    
    func isOpeningCharacter(_ character: Character) -> Bool {
        for set in sets {
            if set.left == character {
                return true
            }
        }
        
        return false
    }
    
    func isClosingCharacter(_ character: Character) -> Bool {
        for set in sets {
            if set.right == character {
                return true
            }
        }
        
        return false
    }
}

struct Pair {
    var left: Character
    var right: Character
}
```

## Tests

```swift
class Problem_27Tests: XCTestCase {
    
    func test_example() {
        let pairs = Pairs(sets: [Pair(left: "{", right: "}"), Pair(left: "[", right: "]"), Pair(left: "(", right: ")")])
        
        var input = "([])[]({})"
        XCTAssertTrue(input.isWellFormed3(forPairs: pairs))
    }

}
```