## Description

This problem was asked by Amazon.

Consider the following scenario: there are N mice and N holes placed at integer points along a line. Given this, find a method that maps mice to holes such that the largest number of steps any mouse takes is minimized.

Each move consists of moving one mouse one unit to the left or right, and only one mouse can fit inside each hole.

For example, suppose the mice are positioned at [1, 4, 9, 15], and the holes are located at [10, -5, 0, 16]. In this case, the best pairing would require us to send the mouse at 1 to the hole at -5, so our function should return 6.

## Solution

```swift
struct Amazon {
    
    var mouses: [Int]
    var holes: [Int]
    
    func maxMoveCountToHide() -> Int {
        
        guard mouses.count == holes.count else {
            fatalError("mouses.count != holes.count")
        }
        
        let sortedMouses = mouses.sorted{ $0 < $1 }
        let sortedHoles = holes.sorted{ $0 < $1 }
        
        var largerDiff = 0
        
        for i in 0..<mouses.count {
            if abs(sortedMouses[i] - sortedHoles[i]) > largerDiff {
               largerDiff = abs(sortedMouses[i] - sortedHoles[i])
            }
        }
        
        return largerDiff
    }
}
```

## Tests

```swift
class Problem_324Tests: XCTestCase {

    func test_example() {
        
        let input = Amazon(mouses: [1, 4, 9, 15], holes: [10, -5, 0, 16])
        
        let actual = input.maxMoveCountToHide()
        let expected = 6
        
        XCTAssert(actual == expected)
    }

}
```