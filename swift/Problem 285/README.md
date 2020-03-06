## Description

This problem was asked by Mailchimp.

You are given an array representing the heights of neighboring buildings on a city street, from east to west. The city assessor would like you to write an algorithm that returns how many of these buildings have a view of the setting sun, in order to properly value the street.

For example, given the array `[3, 7, 8, 3, 6, 1]`, you should return `3`, since the top floors of the buildings with heights `8`, `6`, and `1` all have an unobstructed view to the west.

Can you do this using just one forward pass through the array?

## Solution

```swift
struct Street {
    var buildingHeights: [Int]
    
    func countWithSunSet() -> Int {
        
        guard buildingHeights.count > 0 else {
            return 0
        }
        
        var count = 1
        var current = buildingHeights.last!
        
        guard buildingHeights.count > 2 else {
            return count
        }
        
        for i in stride(from: buildingHeights.count-1, through: 0, by: -1) {
            if buildingHeights[i] > current {
                count += 1
                current = buildingHeights[i]
            }
        }
        
        return count
    }
}
```

## Tests

```swift
class Problem_285Tests: XCTestCase {

    func test_example() {
        let input = Street(buildingHeights: [3, 7, 8, 3, 6, 1])
        
        let expected = 3
        let actual = input.countWithSunSet()
        
        XCTAssert(actual == expected)
    }

}
```