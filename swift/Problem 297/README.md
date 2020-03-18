## Description

This problem was asked by Amazon.

At a popular bar, each customer has a set of favorite drinks, and will happily accept any drink among this set. For example, in the following situation, customer 0 will be satisfied with drinks 0, 1, 3, or 6.

```
preferences = {
    0: [0, 1, 3, 6],
    1: [1, 4, 7],
    2: [2, 4, 7, 5],
    3: [3, 2, 5],
    4: [5, 8]
}
```

A lazy bartender working at this bar is trying to reduce his effort by limiting the drink recipes he must memorize. Given a dictionary input such as the one above, return the fewest number of drinks he must learn in order to satisfy all customers.

For the input above, the answer would be 2, as drinks 1 and 5 will satisfy everyone.

## Solution

```swift
struct Bar {
    
    var preferences: [Int: [Int]]
    
    func lazyBartender() -> [Int] {
        
        var result: [Int] = []
        
        var copy = preferences
        
        while !copy.isEmpty {
            let next = nextMostCommmon(inPreferences: copy)
            result.append(next.result)
            copy = next.rest
        }
        
        return result
    }
    
    private func nextMostCommmon(inPreferences: [Int: [Int]]) -> (result: Int, rest: [Int: [Int]]) {
        
        var commons: [Int: Int] = [:]
        
        for key in inPreferences.keys {
            for drink in inPreferences[key]! {
                if commons.keys.contains(drink) {
                    commons[drink]! += 1
                } else {
                    commons[drink] = 1
                }
            }
        }
        
        let mostCommon = commons.sorted{ $0.value > $1.value }.first!.key
        var copy: [Int: [Int]] = [:]
        
        for pref in inPreferences {
            if !pref.value.contains(mostCommon) {
                copy[pref.key] = pref.value
            }
        }
        
        return (mostCommon, (copy))
    }
}
```

## Tests

```swift
class Problem_297Tests: XCTestCase {

    func test_example() {
        
        let input = Bar(preferences: [
            0: [0, 1, 3, 6],
            1: [1, 4, 7],
            2: [2, 4, 7, 5],
            3: [3, 2, 5],
            4: [5, 8]
        ])
        
        let actual = input.lazyBartender()
        
        XCTAssert(actual.count == 2)
        XCTAssert(actual.contains(1))
        XCTAssert(actual.contains(5))
    }

}
```