## Description

This problem was asked by Facebook.

Given a function that generates perfectly random numbers between `1` and `k` (inclusive), where `k` is an input, write a function that shuffles a deck of cards represented as an array using only swaps.

It should run in `O(N)` time.

Hint: Make sure each one of the 52! permutations of the deck is equally likely.

## Solution

In this problem, we're given with a function that returns a return number between 1 and k, let's add this quickly

```swift
func rand(k: Int) -> Int {
    return Int.random(in: 1..<k)
}
```

We need a method for swapping elements of an array

```swift
extension Array where Element == Int {
    mutating func swapElements(leftIndex: Int, rightIndex: Int) {
        let copy = self[leftIndex]
        
        self[leftIndex] = self[rightIndex]
        self[rightIndex] = copy
    }
}
```

Now we will loop through our array and everytime we will re-locate the card to another position

```swift
extension Array where Element == Int {
    mutating func shuffleDeck() {
        for i in 0..<count {
            let randomValue = rand(k: self.count)
            
            swapElements(leftIndex: i, rightIndex: randomValue)
        }
    }
}
```

## Test

```swift
class Problem_51Tests: XCTestCase {

    func test_shuffling() {
        var deck: [Int] = []
        for i in 1...52 {
            deck.append(i)
        }
        
        deck.shuffleDeck()
        print(deck)
    }

}

```