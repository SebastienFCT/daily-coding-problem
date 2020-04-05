## Description

This problem was asked by Snapchat.

You are given an array of length `N`, where each element `i` represents the number of ways we can produce `i` units of change. For example, `[1, 0, 1, 1, 2]` would indicate that there is only one way to make `0`, `2`, or `3` units, and two ways of making `4` units.

Given such an array, determine the denominations that must be in use. In the case above, for example, there must be coins with value `2`, `3`, and `4`.

## Solution

```swift
extension Array where Element == Int {
    
    func denominations() -> [Int] {
        
        var result: [Int] = []
        var ways: [Int] = Array(repeating: 0, count: count)
        
        for i in 1..<count {
            
            if ways[i] >= self[i] {
                continue
            }
            
            result.append(i)
            ways[i] += 1
        }
        
        
        return result
    }
}
```

## Tests

```swift
class Problem_316Tests: XCTestCase {

    func test_example() {
        
        let input = [1, 0, 1, 1, 2]
        
        let actual = input.denominations()
        let expected = [2, 3, 4]
        
        XCTAssert(actual == expected)
    }

}
```