## Description

This problem was asked by Uber.

One way to unlock an Android phone is through a pattern of swipes across a `1-9` keypad.

For a pattern to be valid, it must satisfy the following:

- All of its keys must be distinct.
- It must not connect two keys by jumping over a third key, unless that key has already been used.

For example, `4 - 2 - 1 - 7` is a valid pattern, whereas `2 - 1 - 7` is not.

Find the total number of valid unlock patterns of length N, where 1 <= N <= 9.

## Solution

```swift
struct AndroidScreenLock {
    
    func totalPossibilities(length n: Int) -> Int {
        
        var result = 0
        
        for i in 0...2 {
            for j in 0...2 {
                var board = [
                    [0, 0, 0],
                    [0, 0, 0],
                    [0, 0, 0]
                ]
                
                board[i][j] = 1
                
                result += next(board: board, length: n, current: 1, position: (i, j))
            }
        }
        
        return result
    }
    
    typealias Position = (row: Int, column: Int)
    
    func next(board: [[Int]], length n: Int, current: Int, position: Position) -> Int {
        
        if current == n {
            return 1
        }
        
        var result = 0
        
        // left
        
        if let l = valueIfExist(board: board, position: (position.row, position.column-1)) {
            
            if l == 0 {
                
                var copy = board
                copy[position.row][position.column-1] = current+1
                
                result += next(board: copy, length: n, current: current+1, position: (position.row, position.column-1))
                
            } else {
                
                if let ll = valueIfExist(board: board, position: (position.row, position.column-2)) {
                    
                    if ll == 0 {

                        var copy = board
                        copy[position.row][position.column-2] = current+1
                        
                        result += next(board: copy, length: n, current: current+1, position: (position.row, position.column-2))
                    }
                }
            }
        }
        
        // top left
        
        if let tl = valueIfExist(board: board, position: (position.row-1, position.column-1)) {
            
            if tl == 0 {
                
                var copy = board
                copy[position.row-1][position.column-1] = current+1
                
                result += next(board: copy, length: n, current: current+1, position: (position.row-1, position.column-1))
                
            } else {
                
                if let tltl = valueIfExist(board: board, position: (position.row-2, position.column-2)) {
                    
                    if tltl == 0 {

                        var copy = board
                        copy[position.row-2][position.column-2] = current+1
                        
                        result += next(board: copy, length: n, current: current+1, position: (position.row-2, position.column-2))
                    }
                }
            }
        }
        
        // top
        
        if let t = valueIfExist(board: board, position: (position.row-1, position.column)) {
            
            if t == 0 {
                
                var copy = board
                copy[position.row-1][position.column] = current+1
                
                result += next(board: copy, length: n, current: current+1, position: (position.row-1, position.column))
                
            } else {
                
                if let tt = valueIfExist(board: board, position: (position.row-2, position.column)) {
                    
                    if tt == 0 {

                        var copy = board
                        copy[position.row-2][position.column] = current+1
                        
                        result += next(board: copy, length: n, current: current+1, position: (position.row-2, position.column))
                    }
                }
            }
        }
        
        // top right
        
        if let tr = valueIfExist(board: board, position: (position.row-1, position.column+1)) {
            
            if tr == 0 {
                
                var copy = board
                copy[position.row-1][position.column+1] = current+1
                
                result += next(board: copy, length: n, current: current+1, position: (position.row-1, position.column+1))
                
            } else {
                
                if let trtr = valueIfExist(board: board, position: (position.row-2, position.column+2)) {
                    
                    if trtr == 0 {

                        var copy = board
                        copy[position.row-2][position.column+2] = current+1
                        
                        result += next(board: copy, length: n, current: current+1, position: (position.row-2, position.column+2))
                    }
                }
            }
        }
        
        // right
        
        if let r = valueIfExist(board: board, position: (position.row, position.column+1)) {
            
            if r == 0 {
                
                var copy = board
                copy[position.row][position.column+1] = current+1
                
                result += next(board: copy, length: n, current: current+1, position: (position.row, position.column+1))
                
            } else {
                
                if let rr = valueIfExist(board: board, position: (position.row, position.column+2)) {
                    
                    if rr == 0 {

                        var copy = board
                        copy[position.row][position.column+2] = current+1
                        
                        result += next(board: copy, length: n, current: current+1, position: (position.row, position.column+2))
                    }
                }
            }
        }
        
        // bottom right
        
        if let br = valueIfExist(board: board, position: (position.row+1, position.column+1)) {
            
            if br == 0 {
                
                var copy = board
                copy[position.row+1][position.column+1] = current+1
                
                result += next(board: copy, length: n, current: current+1, position: (position.row+1, position.column+1))
                
            } else {
                
                if let brbr = valueIfExist(board: board, position: (position.row+1, position.column+2)) {
                    
                    if brbr == 0 {

                        var copy = board
                        copy[position.row+1][position.column+2] = current+1
                        
                        result += next(board: copy, length: n, current: current+1, position: (position.row+1, position.column+2))
                    }
                }
            }
        }
        
        // bottom
        
        if let b = valueIfExist(board: board, position: (position.row+1, position.column)) {
            
            if b == 0 {
                
                var copy = board
                copy[position.row+1][position.column] = current+1
                
                result += next(board: copy, length: n, current: current+1, position: (position.row+1, position.column))
                
            } else {
                
                if let bb = valueIfExist(board: board, position: (position.row+2, position.column)) {
                    
                    if bb == 0 {

                        var copy = board
                        copy[position.row+2][position.column] = current+1
                        
                        result += next(board: copy, length: n, current: current+1, position: (position.row+2, position.column))
                    }
                }
            }
        }
        
        // bottom left
        
        if let bl = valueIfExist(board: board, position: (position.row+1, position.column-1)) {
            
            if bl == 0 {
                
                var copy = board
                copy[position.row+1][position.column-1] = current+1
                
                result += next(board: copy, length: n, current: current+1, position: (position.row+1, position.column-1))
                
            } else {
                
                if let blbl = valueIfExist(board: board, position: (position.row+2, position.column-2)) {
                    
                    if blbl == 0 {

                        var copy = board
                        copy[position.row+2][position.column-2] = current+1
                        
                        result += next(board: copy, length: n, current: current+1, position: (position.row+2, position.column-2))
                    }
                }
            }
        }
        
        return result
    }
    
    func valueIfExist(board: [[Int]], position: Position) -> Int? {
        
        if position.row >= 0 && position.column >= 0 && position.row <= board.count-1 && position.column <= board[0].count-1 {
            return board[position.row][position.column]
        } else {
            return nil
        }
    }
    
}
```

## Tests

```swift
class Problem_239Tests: XCTestCase {

    func test_android_screen_lock() {
        
        let asl = AndroidScreenLock()
        
        XCTAssert(asl.totalPossibilities(length: 1) == 9)
        
        print(asl.totalPossibilities(length: 2))
        print(asl.totalPossibilities(length: 3))
        print(asl.totalPossibilities(length: 4))
        print(asl.totalPossibilities(length: 5))
        print(asl.totalPossibilities(length: 6))
        print(asl.totalPossibilities(length: 7))
        print(asl.totalPossibilities(length: 8))
        print(asl.totalPossibilities(length: 9))
    }

}
```