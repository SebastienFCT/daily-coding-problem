## Description

This problem was asked by Square.

In front of you is a row of `N` coins, with values `v1`, `v2`, ..., `vN`.

You are asked to play the following game. You and an opponent take turns choosing either the first or last coin from the row, removing it from the row, and receiving the value of the coin.

Write a program that returns the maximum amount of money you can win with certainty, if you move first, assuming your opponent plays optimally.


## Solution

```swift
struct TheCoinGame {
    var coins: [Int]
    
    func maximum() -> Int {
        
        // Test starting from left
        
        var copyStartFromLeft = coins
        var p1StartFromLeft = copyStartFromLeft.removeFirst()
        var p2StartFromLeft = 0
        
        var index = 1
        while !copyStartFromLeft.isEmpty {
            if index % 2 == 0 {
                p1StartFromLeft += copyStartFromLeft.nextGreater()
            } else {
                p2StartFromLeft += copyStartFromLeft.nextGreater()
            }
            
            index += 1
        }
        
        // Test starting from right
        
        var copyStartFromRight = coins
        var p1StartFromRight = copyStartFromRight.removeLast()
        var p2StartFromRight = 0
        
        index = 1
        while !copyStartFromRight.isEmpty {
            if index % 2 == 0 {
                p1StartFromRight += copyStartFromRight.nextGreater()
            } else {
                p2StartFromRight += copyStartFromRight.nextGreater()
            }
            
            index += 1
        }
        
        return max(p1StartFromLeft, p1StartFromRight)
    }
}

extension Array where Element == Int {
    
    mutating func nextGreater() -> Int {
        
        if count == 0 {
            return 0
        }
        
        if count == 1 {
            return self.removeFirst()
        }
        
        if let left = self.first, let right = self.last {
            if left == right {
                if count <= 3 {
                    return self.removeFirst()
                }
                
                let nextLeft = self[1]
                let nextRight = self[count-2]
                
                if nextLeft == nextRight {
                    return self.removeFirst()
                }
                
                if nextRight < nextLeft {
                    return self.removeLast()
                } else {
                    return self.removeFirst()
                }
            }
            
            if left > right {
                return self.removeFirst()
            } else {
                return self.removeLast()
            }
        }
        
        return 0
    }
}
```

## Test

```swift
class Problem_220Tests: XCTestCase {

    func test_the_coin_game() {
        
        let game = TheCoinGame(coins: [1,2,3,4,5,6,7,8,9,10])
        print(game.maximum())
    }

}
```