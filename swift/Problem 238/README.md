## Description

This problem was asked by MIT.

Blackjack is a two player card game whose rules are as follows:

- The player and then the dealer are each given two cards.
- The player can then "hit", or ask for arbitrarily many additional cards, so long as their total does not exceed `21`.
- The dealer must then hit if their total is `16` or lower, otherwise pass.
- Finally, the two compare totals, and the one with the greatest sum not exceeding `21` is the winner.

For this problem, cards values are counted as follows: each card between `2` and `10` counts as their face value, face cards count as `10`, and aces count as `1`.

Given perfect knowledge of the sequence of cards in the deck, implement a blackjack solver that maximizes the player's score (that is, wins minus losses).

## Solution

```swift
struct BlackJack {
    
    var deck: [Int] = [
        1,1,1,1,
        2,2,2,2,
        3,3,3,3,
        4,4,4,4,
        5,5,5,5,
        6,6,6,6,
        7,7,7,7,
        8,8,8,8,
        9,9,9,9,
        10,10,10,10,
        10,10,10,10,
        10,10,10,10
    ]
    
    init() {
        deck.shuffle()
    }
    
    func solve() -> [Round] {
        let allCandidates = possibilities(left: deck, currentRounds: [])
        
        let scoreMap = allCandidates.map { $0.reduce(0) { $0 + ($1.win ? 1 : -1) } }
        
        var bestScoreIndex = 0
        
        for i in 0..<scoreMap.count {
            if scoreMap[i] > scoreMap[bestScoreIndex] { bestScoreIndex = i }
        }
        
        return allCandidates[bestScoreIndex]
    }
    
    typealias Round = (playerHits: Int, dealerHits: Int, win: Bool)
    
    func possibilities(left: [Int], currentRounds: [Round]) -> [[Round]] {
        
        if left.count < 4 {
            return [currentRounds]
        }
        
        var copy = left
        
        var result: [[Round]] = []
        
        var player = 0
        var dealer = 0
        
        player += copy.removeFirst()
        player += copy.removeFirst()
        
        dealer += copy.removeFirst()
        dealer += copy.removeFirst()
        
        // No more cards
        
        if copy.isEmpty {
            var copyRounds = currentRounds
            
            copyRounds.append((0, 0, player > dealer))
            result.append(copyRounds)
            
            return result
        }
        
        // Player passes
        
        if dealer < 16 {
            var allToDealer = copy
            var dealerCopy = dealer
            var dealerCount = 0
            
            while dealerCopy < 16 && !allToDealer.isEmpty {
                dealerCopy += allToDealer.removeFirst()
                dealerCount += 1
            }
            
            if dealerCopy > 21 {
                var copyRounds = currentRounds
                copyRounds.append((0, dealerCount, true))
                
                result.append(contentsOf: possibilities(left: allToDealer, currentRounds: copyRounds))
            } else {
                var copyRounds = currentRounds
                copyRounds.append((0, dealerCount, player > dealerCopy))
                
                result.append(contentsOf: possibilities(left: allToDealer, currentRounds: copyRounds))
            }
        } else {
            var copyRounds = currentRounds
            copyRounds.append((0, 0, player > dealer))
            
            result.append(contentsOf: possibilities(left: copy, currentRounds: copyRounds))
        }
        
        // Player hits
        
        var playerCount = 0
        while player <= 21 && !copy.isEmpty {
            
            if player + copy[0] <= 21 {
                player += copy.removeFirst()
                playerCount += 1
                
                if dealer < 16 {
                    var allToDealer = copy
                    var dealerCopy = dealer
                    var dealerCount = 0
                    
                    while dealerCopy < 16 && !allToDealer.isEmpty {
                        dealerCopy += allToDealer.removeFirst()
                        dealerCount += 1
                    }
                    
                    if dealerCopy > 21 {
                        var copyRounds = currentRounds
                        copyRounds.append((playerCount, dealerCount, true))
                        
                        result.append(contentsOf: possibilities(left: allToDealer, currentRounds: copyRounds))
                    } else {
                        var copyRounds = currentRounds
                        copyRounds.append((playerCount, dealerCount, true))
                        
                        result.append(contentsOf: possibilities(left: allToDealer, currentRounds: copyRounds))
                    }
                } else {
                    var copyRounds = currentRounds
                    copyRounds.append((playerCount, 0, player > dealer))
                    
                    result.append(copyRounds)
                }
            } else {
                var allToDealer = copy
                var dealerCopy = dealer
                var dealerCount = 0
                
                while dealerCopy < 16 && !allToDealer.isEmpty {
                    dealerCopy += allToDealer.removeFirst()
                    dealerCount += 1
                }
                
                if dealerCopy > 21 {
                    var copyRounds = currentRounds
                    copyRounds.append((playerCount, dealerCount, true))
                    
                    result.append(contentsOf: possibilities(left: allToDealer, currentRounds: copyRounds))
                } else {
                    var copyRounds = currentRounds
                    copyRounds.append((playerCount, dealerCount, player > dealerCopy))
                    
                    result.append(contentsOf: possibilities(left: allToDealer, currentRounds: copyRounds))
                }
                
                break
            }
        }
        
        return result
    }
}
```

## Tests

```swift
class Problem_238Tests: XCTestCase {

    func test_blackjack() {
        
        let bj = BlackJack()
        
        print("shuffled deck is \(bj.deck)")
        
        let optimal = bj.solve()
        print("optimal path is \(optimal)")
        
        var cardDrawn = 0
        for i in 0..<optimal.count {
            cardDrawn += optimal[i].playerHits + 2
            cardDrawn += optimal[i].dealerHits + 2
        }
        
        print("\(cardDrawn) cards were drawn")
    }

}
```