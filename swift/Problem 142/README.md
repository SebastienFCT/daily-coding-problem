## Description

This problem was asked by Google.

You're given a string consisting solely of `(`, `)`, and `*`. `*` can represent either a `(`, `)`, or an empty string. Determine whether the parentheses are balanced.

For example, `(()*` and `(*)` are balanced. `)*(` is not balanced.

## Solution

```swift
extension String {
    
    func isBalanced() -> Bool {
        guard Set(self).isSubset(of: ["(", ")", "*"]) else {
            return false
        }
        
        let candidates = possibilities()
        
        for candidate in candidates {
            if candidate.balancedParentheses() {
                return true
            }
        }
        
        return false
    }
    
    private func balancedParentheses() -> Bool {
        var openingParentheses = 0
        
        for character in self {
            if character == "(" {
                openingParentheses += 1
            } else if character == ")" {
                guard openingParentheses > 0 else {
                    return false
                }
                
                openingParentheses -= 1
            }
        }
        
        return openingParentheses == 0
    }
    
    private func possibilities() -> [String] {
        var result: [String] = [""]
        
        for character in self {
            if character == "*" {
                var copy: [String] = []
                
                for row in result {
                    copy.append(row)
                    copy.append(row + ["("])
                    copy.append(row + [")"])
                }
                
                result = copy
            } else {
                var copy: [String] = []
                
                for row in result {
                    copy.append(row + String(character))
                }
                
                result = copy
            }
        }
        
        return result
    }
}
```

## Test

```swift
class Problem_142Tests: XCTestCase {

    func test_example() {
        let input1 = "(()*"
        XCTAssertTrue(input1.isBalanced())
        
        let input2 = "(*)"
        XCTAssertTrue(input2.isBalanced())
        
        let input3 = ")*("
        XCTAssertFalse(input3.isBalanced())
        
        let input4 = "((*))"
        XCTAssertTrue(input4.isBalanced())
    }

}
```