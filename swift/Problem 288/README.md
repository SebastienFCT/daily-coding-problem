## Description

This problem was asked by Salesforce.

The number 6174 is known as Kaprekar's contant, after the mathematician who discovered an associated property: for all four-digit numbers with at least two distinct digits, repeatedly applying a simple procedure eventually results in this value. The procedure is as follows:

- For a given input `x`, create two new numbers that consist of the digits in `x` in ascending and descending order.
- Subtract the smaller number from the larger number.

For example, this algorithm terminates in three steps when starting from 1234:

```
4321 - 1234 = 3087
8730 - 0378 = 8352
8532 - 2358 = 6174
```

Write a function that returns how many steps this will take for a given input `N`.

## Solution

```swift
struct Kaprekar {
    
    func countStepsTo6174(from: Int) -> Int {
        
        var count = 0
        var copy = from
        
        while copy != 6174 {
            copy = next(from: copy)
            count += 1
        }
        
        return count
    }
    
    private func next(from: Int) -> Int {
        
        let digits = String(from).compactMap{ $0.wholeNumberValue }
        
        guard let ascending = Int(digits.sorted{ $0 > $1 }.reduce("") { "\($0)\($1)" }), let descending = Int(digits.sorted{ $0 < $1 }.reduce("") { "\($0)\($1)" }) else {
            fatalError("Could not map digits for \(from)")
        }
        
        return ascending > descending ? (ascending - descending) : (descending - ascending)
    }
}
```

## Tests

```swift
class Problem_288Tests: XCTestCase {

    func test_example() {
        
        let kaprekar = Kaprekar()
        
        let actual = kaprekar.countStepsTo6174(from: 1234)
        let expected = 3
        
        XCTAssert(actual == expected)
    }

}
```