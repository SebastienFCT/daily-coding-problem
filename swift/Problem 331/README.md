## Description

This problem was asked by LinkedIn.

You are given a string consisting of the letters `x` and `y`, such as `xyxxxyxyy`. In addition, you have an operation called flip, which changes a single `x` to `y` or vice versa.

Determine how many times you would need to apply this operation to ensure that all `x`'s come before all `y`'s. In the preceding example, it suffices to flip the second and sixth characters, so you should return `2`.

## Solution

```swift
extension String {
    
    func countMinFlips() -> Int {
        
        guard (self.filter({ $0 != "x" && $0 != "y" }).isEmpty) else {
            fatalError("input invalid")
        }
        
        var copy = self
        
        while copy.first == "x" {
            copy.removeFirst()
        }
        
        while copy.last == "y" {
            copy.removeLast()
        }
        
        if copy.isEmpty {
            return 0
        }
        
        let xCount = copy.filter({ $0 == "x" }).count
        let yCount = copy.filter({ $0 == "y" }).count
        
        return min(xCount, yCount)
    }
}
```

## Tests

```swift
class Problem_331Tests: XCTestCase {

    func test_example() {
        
        let input = "xyxxxyxyy"
        
        let actual = input.countMinFlips()
        let expected = 2
        
        XCTAssert(actual == expected)
    }

}
```