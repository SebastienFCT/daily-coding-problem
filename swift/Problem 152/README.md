## Description

This problem was asked by Triplebyte.

You are given `n` numbers as well as `n` probabilities that sum up to 1. Write a function to generate one of the numbers with its corresponding probability.

For example, given the numbers `[1, 2, 3, 4]` and probabilities `[0.1, 0.5, 0.2, 0.2]`, your function should return `1` 10% of the time, `2` 50% of the time, and `3` and `4` 20% of the time.

You can generate random numbers between 0 and 1 uniformly.

## Solution

```swift
struct Triplebyte {
    var values: [Int]
    var percentages: [Double]
    
    func random() -> Int {
        let randomValue = Double.random(in: 0...1)
        
        var cumul: Double = 0
        
        for i in 0..<values.count {
            cumul += percentages[i]
            
            if randomValue <= cumul {
                return values[i]
            }
        }
        
        return values.last!
    }
}
```

## Test

```swift
class Problem_152Tests: XCTestCase {

    func test_example() {
        let tb = Triplebyte(values: [1, 2, 3, 4], percentages: [0.1, 0.5, 0.2, 0.2])
        
        var repartition: [Int: Double] = [
            1: 0,
            2: 0,
            3: 0,
            4: 0
        ]
        
        let iterationCount = 1000
        
        for _ in 0...iterationCount {
            let value = tb.random()
            repartition[value]! += 1
        }
        
        for key in repartition.keys {
            repartition[key] = repartition[key]! / Double(iterationCount)
        }
        
        print(repartition)
    }

}
```