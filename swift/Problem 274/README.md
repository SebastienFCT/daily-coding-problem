## Description

This problem was asked by Facebook.

Given a string consisting of parentheses, single digits, and positive and negative signs, convert the string into a mathematical expression to obtain the answer.

Don't use eval or a similar built-in parser.

For example, given '-1 + (2 + 3)', you should return 4.


## Solution

```swift
extension String {
    
    func eval() -> Int? {
        
        var result: Int? = nil
        var operation: Character? = nil
        
        for character in self {
            
            if character.isNumber {
                if let op = operation {
                    switch op {
                    case "-":
                        if result != nil {
                            result! -= Int(String(character))!
                        } else {
                            result = -Int(String(character))!
                        }
                    default:
                        if result != nil {
                            result! += Int(String(character))!
                        } else {
                            result = Int(String(character))!
                        }
                    }
                    
                    operation = nil
                } else {
                    result = Int(String(character))!
                }
            } else {
                operation = character
            }
        }
     
        return result
    }
}
```

## Tests

```swift
class Problem_274Tests: XCTestCase {

    func test_example() {
        
        let input = "-1 + (2 + 3)"
        let expected = 4
        let actual = input.eval()
        
        XCTAssert(actual == expected)
    }

}

```