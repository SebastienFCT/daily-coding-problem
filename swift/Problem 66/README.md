## Description

This problem was asked by Square.

Assume you have access to a function toss_biased() which returns 0 or 1 with a probability that's not 50-50 (but also not 0-100 or 100-0). You do not know the bias of the coin.

Write a function to simulate an unbiased coin toss.

## Solution

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