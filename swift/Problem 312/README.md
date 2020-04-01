## Description

This problem was asked by Wayfair.

You are given a `2 x N` board, and instructed to completely cover the board with the following shapes:

- Dominoes, or `2 x 1` rectangles.
- Trominoes, or `L`-shapes.

For example, if `N = 4`, here is one possible configuration, where `A` is a domino, and `B` and `C` are trominoes.

```
A B B C
A B C C
```

Given an integer `N`, determine in how many ways this task is possible.

## Solution

```swift
struct Board {
    var columns: Int
    
    func countUniqueConfiguration(remainingSpace: Int? = nil) -> Int {
        
        let remainingSpace = remainingSpace ?? columns * 2
        
        var result = 0
        
        if remainingSpace > 3 {
            result += countUniqueConfiguration(remainingSpace: remainingSpace-3)
            result += countUniqueConfiguration(remainingSpace: remainingSpace-2)
        }
        
        // last tromino
        if remainingSpace == 3 {
            return 1
        }
        
        // last domino
        if remainingSpace == 2 {
            return 1
        }
        
        return result
    }
}
```

## Tests

```swift
class Problem_312Tests: XCTestCase {

    func test_example() {
        
        let input = Board(columns: 4)
        
        let actual = input.countUniqueConfiguration()
        let expected = 4
        
        // A B B C | A B C D | A A B C | A A C C
        // A B C C | A B C D | A B B C | A B B C
        
        XCTAssert(actual == expected)
    }

}
```