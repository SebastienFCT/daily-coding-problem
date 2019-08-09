## Description

This problem was asked by Google.

You are given an N by M 2D matrix of lowercase letters. Determine the minimum number of columns that can be removed to ensure that each row is ordered from top to bottom lexicographically. That is, the letter at each column is lexicographically later as you go down each row. It does not matter whether each row itself is ordered lexicographically.

For example, given the following table:

```
cba
daf
ghi
```

This is not ordered because of the a in the center. We can remove the second column to make it ordered:

```
ca
df
gi
```

So your function should return 1, since we only needed to remove 1 column.

As another example, given the following table:

```
abcdef
```

Your function should return 0, since the rows are already ordered (there's only one row).

As another example, given the following table:

```
zyx
wvu
tsr
```

Your function should return 3, since we would need to remove all the columns to order it.

## Solution

I would first write a function that can reverse my matrix (each column becomes a row) and run a function for each row checking if their elements are ordered alphabetically

```swift
extension Array where Element == Array<Character> {
    
    private func flip() -> [[Character]] {
        var result: [[Character]] = []
        
        for i in 0..<self.count {
            
            var resultRow: [Character] = []
            
            for row in self {
                resultRow.append(row[i])
            }
            
            result.append(resultRow)
        }
        
        return result
    }
    
    func rowsToRemoveForLexicographicallyOrdered() -> (count: Int, indexes: [Int]) {
        
        var copy = self.flip()
        var count: Int = 0
        var indexes: [Int] = []
        
        for i in 0..<copy.count {
            let row = copy[i]
            
            if !row.isLexicographicallyOrdered() {
                count += 1
                indexes.append(i)
            }
        }
        
        return (count: count, indexes: indexes)
    }
}

extension Array where Element == Character {
    func isLexicographicallyOrdered() -> Bool {
        guard let first = first else {
            return true
        }
        
        var current: Character = first
        
        for i in 1..<self.count {
            guard current < self[i] else {
                return false
            }
            
            current = self[i]
        }
        
        return true
    }
}
```

## Test

```swift
class Problem_76Tests: XCTestCase {

    func test_example() {
        let input: [[Character]] = [
            ["c", "b", "a"],
            ["d", "a", "f"],
            ["g", "h", "i"]
        ]
        
        XCTAssert(input.rowsToRemoveForLexicographicallyOrdered().count == 1)
        XCTAssert(input.rowsToRemoveForLexicographicallyOrdered().indexes == [1])
    }
    
    func test_example2() {
        let input: [[Character]] = [
            ["a", "b", "c", "d", "e", "f"]
        ]
        
        XCTAssert(input.rowsToRemoveForLexicographicallyOrdered().count == 0)
    }
    
    func test_example3() {
        let input: [[Character]] = [
            ["z","y","x"],
            ["w","v","u"],
            ["t","s","r"]
        ]
        
        XCTAssert(input.rowsToRemoveForLexicographicallyOrdered().count == 3)
    }

}
```