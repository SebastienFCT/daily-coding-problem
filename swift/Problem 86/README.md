## Description

This problem was asked by Google.

Given a string of parentheses, write a function to compute the minimum number of parentheses to be removed to make the string valid (i.e. each open parenthesis is eventually closed).

For example, given the string "()())()", you should return 1. Given the string ")(", you should return 2, since we must remove all of them.

## Solution

```swift
extension String {
    
    func countNonValidParentheses() -> Int {
        var result = 0
        
        var openingCounting = 0
        
        for character in self {
            // If we have an opening parenthese then we add it to our stack
            if character == "(" {
                openingCounting += 1
                continue
            }
            
            // If we have closing parenthese before an opening one, it should be removed
            if character == ")" && openingCounting == 0 {
                result += 1
                continue
            }
            
            // If it's a closing parenthese and we have opening one to match with invalidate them
            if character == ")" {
                openingCounting -= 1
            }
        }
        
        // Finally, we just have to return the result + non closing ones
        return result + openingCounting
    }
}
```

## Test

```swift
class Problem_86Tests: XCTestCase {

    func test_example() {
        let input = "()())()"
        XCTAssert(input.countNonValidParentheses() == 1)
    }
    
    func test_example2() {
        let input = ")("
        XCTAssert(input.countNonValidParentheses() == 2)
    }

}
```