## Description

This problem was asked by Google.

Find the minimum number of coins required to make `n` cents.

You can use standard American denominations, that is, 1¢, 5¢, 10¢, and 25¢.

For example, given `n = 16`, return `3` since we can make it with a 10¢, a 5¢, and a 1¢.

## Solution

```swift
class CoinDistributor {
    static private let coins = Set([1, 5, 10, 25])
    
    static func withdraw(n: Int) -> [Int] {
        var remaining = n
        var result: [Int] = []
        
        for coinType in Array(coins).sorted(by: { $0 > $1 }) {
            while remaining >= coinType && remaining > 0 {
                remaining -= coinType
                result.append(coinType)
                
                if remaining == 0 {
                    return result
                }
            }
        }
        
        return result
    }
}
```

## Test

```swift
class Problem_138Tests: XCTestCase {

    func test_example() {
        XCTAssert(CoinDistributor.withdraw(n: 16).count == 3)
    }

}
```