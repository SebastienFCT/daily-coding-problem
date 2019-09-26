## Description

This problem was asked by Microsoft.

You have `n` fair coins and you flip them all at the same time. Any that come up tails you set aside. The ones that come up heads you flip again. How many rounds do you expect to play before only one coin remains?

Write a function that, given `n`, returns the number of rounds you'd expect to play until one coin remains.

## Solution

```swift
func approximateIterations(n totalCoins: Int, targetRemaining: Int, sampleSize: Int) -> Int {
    var successes: [Int] = []
    
    for _ in 0...sampleSize {
        var coins = Array(repeating: true, count: totalCoins)
        var attempts = 0
        
        while (coins.filter{ $0 }.count > 1) {
            for i in 0..<coins.count {
                if coins[i] {
                    if Bool.random() { coins[i] = false }
                }
            }
            
            attempts += 1
        }
        
        if (coins.filter{ $0 }.count == 1) {
            successes.append(attempts)
        }
    }
    
    return successes.reduce(0, +) / successes.count
}
```

## Test

```swift
class Problem_124Tests: XCTestCase {

    func test_approximation_of_iteration_before_reaching_one_remaining_coin() {
        print("Starting with 10 coins, you should expect to play \(approximateIterations(n: 10, targetRemaining: 1, sampleSize: 200)) round(s) in average until one coin remains")
        print("Starting with 10 coins, you should expect to play \(approximateIterations(n: 10, targetRemaining: 1, sampleSize: 400)) round(s) in average until one coin remains")
        print("Starting with 10 coins, you should expect to play \(approximateIterations(n: 10, targetRemaining: 1, sampleSize: 1000)) round(s) in average until one coin remains")
    }

}
```