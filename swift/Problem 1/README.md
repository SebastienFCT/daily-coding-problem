## Description

This problem was recently asked by Google.

Given a list of numbers and a number `k`, return whether any two numbers from the list add up to `k`.

For example, given `[10, 15, 3, 7]` and `k` of `17`, return true since `10 + 7` is `17`.

Bonus: Can you do this in one pass?

## Solution

```swift
extension Array where Element == Int {
    func hasPairForSum(sum k: Int) -> Bool {
        
        var set: Set<Int> = Set()
        
        for element in self {
            if set.contains(where: { (value) -> Bool in
                k - element == value
            }) {
                return true
            }
            
            set.insert(element)
        }
        
        return false
    }
}
```

## Tests

```swift
class Problem_1Tests: XCTestCase {

    func testExample() {
        let input = [10, 15, 3, 7]
        
        XCTAssertTrue(input.hasPairForSum(sum: 17))
    }

    func testFailure() {
        let input = [1, 2, 3, 4]
        
        XCTAssertFalse(input.hasPairForSum(sum: 100))
    }
}
```