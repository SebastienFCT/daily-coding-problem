## Description

This problem was asked by Facebook.

On a mysterious island there are creatures known as Quxes which come in three colors: red, green, and blue. One power of the Qux is that if two of them are standing next to each other, they can transform into a single creature of the third color.

Given N Quxes standing in a line, determine the smallest number of them remaining after any possible sequence of such transformations.

For example, given the input `['R', 'G', 'B', 'G', 'B']`, it is possible to end up with a single Qux through the following steps:

```
        Arrangement       |   Change
----------------------------------------
['R', 'G', 'B', 'G', 'B'] | (R, G) -> B
['B', 'B', 'G', 'B']      | (B, G) -> R
['B', 'R', 'B']           | (R, B) -> G
['B', 'G']                | (B, G) -> R
['R']                     |
```

## Solution

```swift
enum Quxe {
    case r
    case g
    case b
}

struct MisteriousIsland {
    
    var creatures: [Quxe]
    
    func reduce() -> [Quxe] {
        
        var copy = creatures
        
        var keepIterating = true
        while keepIterating {
            
            keepIterating = false
            
            if copy.count <= 1 {
                return copy
            }
            
            for i in 1..<copy.count {
                if copy[i-1] != copy[i] {
                    keepIterating = true
                    
                    let first = copy.remove(at: i-1)
                    let second = copy.remove(at: i-1)
                    
                    let merged = [Quxe.r, Quxe.g, Quxe.b].filter{ $0 != first && $0 != second }.first!
                    copy.insert(merged, at: i-1)
                    break
                }
            }
        }
        
        return copy
    }
}
```

## Tests

```swift
class Problem_290Tests: XCTestCase {

    func test_example() {
        
        let input = MisteriousIsland(creatures: [.r, .g, .b, .g, .b])
        print(input.reduce())
        
    }

}
```