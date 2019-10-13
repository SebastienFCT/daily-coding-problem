## Description

This problem was asked by Facebook.

Given an array of integers in which two elements appear exactly once and all other elements appear exactly twice, find the two elements that appear only once.

For example, given the array `[2, 4, 6, 8, 10, 2, 6, 10]`, return `4` and `8`. The order does not matter.

Follow-up: Can you do this in linear time and constant space?

## Solution

```swift
extension Array where Element == Int {
    
    func findSingles() -> [Int] {
        var result: [Int] = []
        
        var dictionary: [Int: Int] = [:]
        
        for item in self {
            if dictionary.keys.contains(item) {
                dictionary[item]! += 1
            } else {
                dictionary[item] = 1
            }
        }
        
        for key in dictionary.keys {
            if dictionary[key] == 1 {
                result.append(key)
            }
        }
        
        return result
    }
}
```

## Test

```swift
class Problem_140Tests: XCTestCase {

    func test_example() {
        let input = [2, 4, 6, 8, 10, 2, 6, 10]
        XCTAssert(input.findSingles() == [8, 4])
    }

}
```