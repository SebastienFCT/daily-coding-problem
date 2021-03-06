## Description

This problem was asked by Facebook.

Given an array of numbers representing the stock prices of a company in chronological order and an integer `k`, return the maximum profit you can make from `k` buys and sells. You must buy the stock before you can sell it, and you must sell the stock before you can buy it again.

For example, given `k` = 2 and the array `[5, 2, 4, 0, 1]`, you should return 3.

## Solution

```swift
extension Array where Element == Int {
    
    func maxProfits(k actions: Int) -> Int {
        return next(index: 0, balance: 0, buys: actions, sells: actions, hasActions: false)
    }
    
    private func next(index: Int, balance: Int, buys: Int, sells: Int, hasActions: Bool) -> Int {
        if index == count || sells == 0 {
            return balance
        }
        
        if hasActions {
            let sellChoice = next(index: index+1, balance: balance+self[index], buys: buys, sells: sells-1, hasActions: false)
            let passChoice = next(index: index+1, balance: balance, buys: buys, sells: sells, hasActions: true)
            
            return Swift.max(sellChoice, passChoice)
        } else {
            let buyChoice = next(index: index+1, balance: balance-self[index], buys: buys-1, sells: sells, hasActions: true)
            let passChoice = next(index: index+1, balance: balance, buys: buys, sells: sells, hasActions: false)
            
            return Swift.max(buyChoice, passChoice)
        }
    }
}
```

## Test

```swift
class Problem_130Tests: XCTestCase {

    func test_example() {
        let input = [5, 2, 4, 0, 1]
        XCTAssert(input.maxProfits(k: 2) == 3)
    }

}
```