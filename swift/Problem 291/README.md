## Description

This problem was asked by Glassdoor.

An imminent hurricane threatens the coastal town of Codeville. If at most two people can fit in a rescue boat, and the maximum weight limit for a given boat is `k`, determine how many boats will be needed to save everyone.

For example, given a population with weights `[100, 200, 150, 80]` and a boat limit of `200`, the smallest number of boats required will be three.

## Solution

```swift
struct Hurricane {
    
    var population: [Int]
    
    func minBoats(withMaxWeightPerPerson maxWeight: Int) -> Int {
        
        var sorted = population.sorted{ $0 > $1 }
        
        var pairs: [(left: Int, right: Int?)] = []
        
        while !sorted.isEmpty {
            if sorted.count == 1 {
                let left = sorted.removeFirst()
                pairs.append((left, nil))
                break
            }
            
            let left = sorted.removeFirst()
            let right = sorted.removeLast()
            
            if left + right <= maxWeight {
                pairs.append((left, right))
                break
            }
            
            // Here we assume that all boat can hold any single person from the population, we can catch this earlier otherwise
            pairs.append((left, nil))
            
            sorted.append(right)
        }
        
        return pairs.count
    }
}
```

## Tests

```swift
class Problem_291Tests: XCTestCase {

    func test_example() {
        
        let input = Hurricane(population: [100, 200, 150, 80])
        
        let actual = input.minBoats(withMaxWeightPerPerson: 200)
        let expected = 3
        
        XCTAssert(actual == expected)
    }

}
```