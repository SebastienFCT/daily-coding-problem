## Description

This problem was asked by Two Sigma.

Alice wants to join her school's Probability Student Club. Membership dues are computed via one of two simple probabilistic games.

The first game: roll a die repeatedly. Stop rolling once you get a five followed by a six. Your number of rolls is the amount you pay, in dollars.

The second game: same, except that the stopping condition is a five followed by a five.

Which of the two games should Alice elect to play? Does it even matter? Write a program to simulate the two games and calculate their expected value.

## Solution

```swift
struct Alice_s_Choice {
    
    static func averageForRoll(toValue: Int, followedBy: Int, sampleSize: Int) -> Int {
        var sums: [Int] = []
        
        for _ in 0...sampleSize {
            sums.append(roll(toValue: toValue, followedBy: followedBy))
        }
        
        return sums.reduce(0, +) / sampleSize
    }
    
    static func roll(toValue: Int, followedBy: Int) -> Int {
        
        var result = 1
        
        var previous = rollDice()
        var current = 0
        
        while !(previous == toValue && current == followedBy) {
            let new = rollDice()
            previous = current
            current = new
            result += 1
        }
        
        return result
    }
    
    static private func rollDice() -> Int {
        return Int.random(in: 1...6)
    }
}
```

## Test

```swift
class Problem_178Tests: XCTestCase {

    func test_example() {
        // I expected the game to result in the exact same probabilities however the program seems to constantly get an average of 36 or 37 rolls required for the first game versus 42 or 43 rolls required for the second game (for 100000 samples)
        print(Alice_s_Choice.averageForRoll(toValue: 5, followedBy: 6, sampleSize: 100000))
        print(Alice_s_Choice.averageForRoll(toValue: 5, followedBy: 5, sampleSize: 100000))
    }

}
```