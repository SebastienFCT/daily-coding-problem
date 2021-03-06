## Description

This problem was asked by Google.

You are given an N by N matrix of random letters and a dictionary of words. Find the maximum number of words that can be packed on the board from the given dictionary.

A word is considered to be able to be packed on the board if:

- It can be found in the dictionary
- It can be constructed from untaken letters by other words found so far on the board
- The letters are adjacent to each other (vertically and horizontally, not diagonally).
- Each tile can be visited only once by any word.

For example, given the following dictionary:

`{ 'eat', 'rain', 'in', 'rat' }`
and matrix:

```
[['e', 'a', 'n'],
 ['t', 't', 'i'],
 ['a', 'r', 'a']]
```

Your function should return 3, since we can make the words 'eat', 'in', and 'rat' without them touching each other. We could have alternatively made 'eat' and 'rain', but that would be incorrect since that's only 2 words.

## Solution

```swift
typealias CharacterMatrix = [[Character]]

extension CharacterMatrix {
    
    typealias Pos = (row: Int, column: Int)
    
    func maximize(forList list: [String]) -> Int {
        
        return maxScore(forList: list)
    }
    
    private func maxScore(forList list: [String], currentPoint: Int = 0) -> Int {
        
        var maxPoints = currentPoint
        
        for index in 0..<list.count {
            let item = list[index]
            
            var newList = list
            newList.remove(at: index)
            
            guard let firstCharacter = item.first else {
                continue
            }
            
            for i in 0..<count {
                for j in 0..<self[i].count {
                    
                    if charAtPos(pos: (i, j)) == firstCharacter {
                        
                        var newWord = item
                        newWord.removeFirst()
                        
                        var copy = self
                        copy[i][j] = " "
                        
                        if let candidates = removeWord(word: newWord, matrix: copy, position: (i, j)) {
                            
                            for candidate in candidates {
                                
                                let nextScore = candidate.maxScore(forList: newList, currentPoint: currentPoint+1)
                                
                                maxPoints = Swift.max(nextScore, maxPoints)
                            }
                            
                        }
                        
                    }
                }
            }
        }
        
        return maxPoints
    }
    
    private func removeWord(word: String, matrix: CharacterMatrix, position: Pos) -> [CharacterMatrix]? {
        
        guard let firstCharacter = word.first else {
            return [matrix]
        }
        
        var candidates: [CharacterMatrix] = []
        
        if charAtPos(pos: (position.row-1, position.column)) == firstCharacter {
            
            var copy = matrix
            copy[position.row-1][position.column] = " "
            
            var newWord = word
            newWord.removeFirst()
            
            if let exists = removeWord(word: newWord, matrix: copy, position: (position.row-1, position.column)) {
                candidates.append(contentsOf: exists)
            }
        }
        
        if charAtPos(pos: (position.row+1, position.column)) == firstCharacter {
            
            var copy = matrix
            copy[position.row+1][position.column] = " "
            
            var newWord = word
            newWord.removeFirst()
            
            if let exists = removeWord(word: newWord, matrix: copy, position: (position.row+1, position.column)) {
                candidates.append(contentsOf: exists)
            }
        }
        
        if charAtPos(pos: (position.row, position.column-1)) == firstCharacter {
            
            var copy = matrix
            copy[position.row][position.column-1] = " "
            
            var newWord = word
            newWord.removeFirst()
            
            if let exists = removeWord(word: newWord, matrix: copy, position: (position.row, position.column-1)) {
                candidates.append(contentsOf: exists)
            }
        }
        
        if charAtPos(pos: (position.row, position.column+1)) == firstCharacter {
            
            var copy = matrix
            copy[position.row][position.column+1] = " "
            
            var newWord = word
            newWord.removeFirst()
            
            if let exists = removeWord(word: newWord, matrix: copy, position: (position.row, position.column+1)) {
                candidates.append(contentsOf: exists)
            }
        }
        
        
        return candidates
    }
    
    private func charAtPos(pos: Pos) -> Character? {
        
        if pos.row < 0 || pos.column < 0 || pos.row >= count || pos.column >= self[0].count {
            return nil
        }
        
        return self[pos.row][pos.column]
    }
}
```

## Tests

```swift
class Problem_341Tests: XCTestCase {

    func test_example() {
        
        let input: CharacterMatrix = [
            ["e", "a", "n"],
            ["t", "t", "i"],
            ["a", "r", "a"]
        ]
        
        let actual = input.maximize(forList: ["eat", "rain", "in", "rat"])
        let expected = 3
        
        XCTAssert(actual == expected)
    }

}
```