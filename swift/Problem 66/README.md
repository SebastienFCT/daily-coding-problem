## Description

This problem was asked by Square.

Assume you have access to a function toss_biased() which returns 0 or 1 with a probability that's not 50-50 (but also not 0-100 or 100-0). You do not know the bias of the coin.

Write a function to simulate an unbiased coin toss.

## Solution

What I would try to do for this exercise is determine what is the actual probability table of my toss_biased function
 
Let's do two things:

- Write a really dummy function that returns a random value between 0 and 1 with a non equally reparted probability
- Write a function that decrypt the probability of my function (by approximation)

```swift
struct Square {
    static func toss_biased() -> Bool {
        let randomFloat = Float.random(in: 0..<1)
        
        if randomFloat > 0.2 {
            return true
        } else {
            return false
        }
    }
    
    func determineProbabilityTable(repetition: Int) -> [Bool: Float] {
        var table: [Bool: Int] = [ true: 0, false: 0]
        
        for _ in 0..<repetition {
            let random = Square.toss_biased()
            table[random]! += 1
        }
        
        return [true: Float(table[true]!) / Float(repetition), false: Float(table[false]!) / Float(repetition)]
    }
}
```

Now, given that I have a table of probability for my coin, I need to get a random value between 0 and 1
 
Let's imagine that we toss 2 coins, there is four possibilities:

- true, true
- true, false
- false, true
- false, false

Since our coin is biased, true and true doesn't have the same probability as false and false, however there is as much chances to draw true and false that there are to draw false and true (the chances are equal to chanceToGetHead * chanceToGetTail VS chanceToGetTail * chanceToGetHead)

So following this logic, we could simple toss 2 coins and expect either one of them. If we don't get it, we just ignore and try again

```swift
extension Square {
    static func toss_unbiased() -> Bool {
        var result: Bool? = nil
        
        while result == nil {
            let tosses = (toss_biased(), toss_biased())
            
            switch tosses {
            case (true, false):
                result = true
            case (false, true):
                result = false
            default:
                break
            }
        }
        
        return result!
    }
}
```

## Test

```swift
class Problem_66Tests: XCTestCase {

    func test_utilities() {
        print(Square().determineProbabilityTable(repetition: 500))
    }
    
    func test_tossing() {
        var biased = [true: 0, false: 0]
        var unbiased = [true: 0, false: 0]
        
        for _ in 0..<500 {
            biased[Square.toss_biased()]! += 1
            unbiased[Square.toss_unbiased()]! += 1
        }
        
        print("biased: \(biased)")
        print("unbiased: \(unbiased)")
    }

}
```