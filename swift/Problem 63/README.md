## Description

This problem was asked by Microsoft.

Given a 2D matrix of characters and a target word, write a function that returns whether the word can be found in the matrix by going left-to-right, or up-to-down.

For example, given the following matrix:

```
[['F', 'A', 'C', 'I'],
 ['O', 'B', 'Q', 'P'],
 ['A', 'N', 'O', 'B'],
 ['M', 'A', 'S', 'S']]
```

and the target word 'FOAM', you should return true, since it's the leftmost column. Similarly, given the target word 'MASS', you should return true, since it's the last row.

## Solution

First we will write a function that find any position that matches the first character of the string

```swift
extension Array where Element == Array<String> {
    func find(character: String) -> [(row: Int, column: Int)] {
        var result: [(row: Int, column: Int)] = []
        
        for i in 0..<self.count {
            for j in 0..<self[i].count {
                if self[i][j] == character {
                    result.append((i, j))
                }
            }
        }
        
        return result
    }
}
```

Ok so now we have multiple potential candidate for the solution, we need to check against each of them until we find the word

```swift
extension Array where Element == Array<String> {
    func runAgainst(word: String, startingAt: (row: Int, column: Int)) -> Bool {
        var row = ""
        var column = ""
        
        for i in startingAt.row..<word.count+startingAt.row {
            if i >= self.count {
                break
            }
            
            row += "\(self[i][startingAt.column])"
        }
        
        for j in startingAt.column..<word.count+startingAt.column {
            if j >= self[startingAt.row].count {
                break
            }
            
            column += "\(self[startingAt.row][j])"
        }
        
        return row == word || column == word
    }
    
    func has(word: String) -> Bool {
        let possibilities = find(character: String(word.first ?? Character("")))
        
        for possibility in possibilities {
            if runAgainst(word: word, startingAt: possibility) {
                return true
            }
        }
        
        return false
    }
}
```

## Test

```swift
class Problem_63Tests: XCTestCase {

    func test_example() {
        let input = [
            ["F", "A", "C", "I"],
            ["O", "B", "Q", "P"],
            ["A", "N", "O", "B"],
            ["M", "A", "S", "S"]
        ]
        
        XCTAssert(input.has(word: "FOAM") == true)
    }
    
    func test_example2() {
        let input = [
            ["F", "A", "C", "I"],
            ["O", "B", "Q", "P"],
            ["A", "N", "O", "B"],
            ["M", "A", "S", "S"]
        ]
        
        XCTAssert(input.has(word: "MASS") == true)
    }
    
    func test_example3() {
        let input = [
            ["F", "A", "C", "I"],
            ["O", "B", "Q", "P"],
            ["A", "N", "O", "B"],
            ["M", "A", "S", "S"]
        ]
        
        XCTAssert(input.has(word: "USER") == false)
    }

}
```