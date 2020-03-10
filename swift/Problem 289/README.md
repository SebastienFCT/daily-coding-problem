## Description

This problem was asked by Google.

The game of Nim is played as follows. Starting with three heaps, each containing a variable number of items, two players take turns removing one or more items from a single pile. The player who eventually is forced to take the last stone loses. For example, if the initial heap sizes are 3, 4, and 5, a game could be played as shown below:

```
  A  |  B  |  C
-----------------
  3  |  4  |  5
  3  |  1  |  3
  3  |  1  |  3
  0  |  1  |  3
  0  |  1  |  0
  0  |  0  |  0 
```

In other words, to start, the first player takes three items from pile B. The second player responds by removing two stones from pile C. The game continues in this way until player one takes last stone and loses.

Given a list of non-zero starting values [a, b, c], and assuming optimal play, determine whether the first player has a forced win.

## Solution

```swift
struct Nim {
    
    var heap1: Int
    var heap2: Int
    var heap3: Int
    
    func canWin() -> Bool {
        
        switch (heap1, heap2, heap3) {
            
        case (0, 0, _), (_, 0, 0), (0, _, 0):
            return true
        case (0, _, _):
            return heap2 != 1 && heap3 != 1
        case (_, 0, _):
            return heap1 != 1 && heap3 != 1
        case (_, _, 0):
            return heap1 != 1 && heap2 != 1
        case (1, 1, 1):
            return false
        case (1, 1, _), (1, _, 1), (_, 1, 1):
            return true
        case (1, _, _):
            return heap2 > 1 && heap3 > 1
        case (_, _, 1):
            return heap1 > 1 && heap2 > 1
        case (_, 1, _):
            return heap1 > 1 && heap3 > 1
        default:
            
            if heap1 > 1 {
                return !Nim(heap1: heap1-1, heap2: heap2, heap3: heap3).canWin()
            }
            if heap2 > 1 {
                return !Nim(heap1: heap1, heap2: heap2-1, heap3: heap3).canWin()
            }
            
            return !Nim(heap1: heap1, heap2: heap2, heap3: heap3-1).canWin()
        }
    }
}
```

## Tests

```swift
class Problem_289Tests: XCTestCase {

    func test_nim_game() {
        
        XCTAssertFalse(Nim(heap1: 1, heap2: 1, heap3: 1).canWin())
        XCTAssertTrue(Nim(heap1: 2, heap2: 1, heap3: 1).canWin())
        XCTAssertTrue(Nim(heap1: 2, heap2: 2, heap3: 1).canWin())
        XCTAssertTrue(Nim(heap1: 3, heap2: 4, heap3: 5).canWin())
        XCTAssertTrue(Nim(heap1: 1, heap2: 2, heap3: 3).canWin())
        XCTAssertTrue(Nim(heap1: 5, heap2: 5, heap3: 5).canWin())
    }

}

```