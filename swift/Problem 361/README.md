## Description

This problem was asked by Facebook.

Mastermind is a two-player game in which the first player attempts to guess the secret code of the second. In this version, the code may be any six-digit number with all distinct digits.

Each turn the first player guesses some number, and the second player responds by saying how many digits in this number correctly matched their location in the secret code. For example, if the secret code were `123456`, then a guess of `175286` would score two, since `1` and `6` were correctly placed.

Write an algorithm which, given a sequence of guesses and their scores, determines whether there exists some secret code that could have produced them.

For example, for the following scores you should return `True`, since they correspond to the secret code `123456`:

`{175286: 2, 293416: 3, 654321: 0}`

However, it is impossible for any key to result in the following scores, so in this case you should return `False`:

`{123456: 4, 345678: 4, 567890: 4}`

## Solution

```swift
// Solution found at https://github.com/vineetjohn/daily-coding-problem/blob/master/solutions/problem_361.py
// While I understand what the code does, I'm having a hard time understand how it works...

struct Mastermind {
    var guesses: [String: Int]
    
    func solvable() -> Bool {
        
        for i in 0..<1000000 {
            var code = String(i)
            let array = Array(repeating: "0", count: 6-code.count)
            let arrayValue: String = array.reduce(""){ "\($0)\($1)" }

            code = "\(arrayValue)\(code)"

            var success = UInt8(exactly: NSNumber(booleanLiteral: true))!

            for (pair, value) in guesses {
                success = success & UInt8(exactly: NSNumber(booleanLiteral: matchGuess(code: code, guess: pair, matches: value)))!
            }
            
            if Bool(exactly: NSNumber(value: success)) == true { return true }
        }
        
        return false
    }
    
    private func matchGuess(code: String, guess: String, matches: Int) -> Bool {
        var count = 0
        let max = min(code.count, guess.count)
        
        for i in 0..<max {
            if code[i] == guess[i] {
                count += 1
            }
        }
        
        return count == matches
    }
}
```

## Tests

```swift
class Problem_361Tests: XCTestCase {

    func test_example1() {
        let input = Mastermind(guesses: [
            "175286": 2,
            "293416": 3,
            "654321": 0
        ])
        
        XCTAssertTrue(input.solvable())
    }
    
    func test_example2() {
        let input = Mastermind(guesses: [
            "123456": 4,
            "345678": 4,
            "567890": 4
        ])
        
        XCTAssertFalse(input.solvable())
    }

}
```