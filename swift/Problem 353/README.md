## Description

This problem was asked by Square.

You are given a histogram consisting of rectangles of different heights. These heights are represented in an input list, such that `[1, 3, 2, 5]` corresponds to the following diagram:

```
      x
      x  
  x   x
  x x x
x x x x
```

Determine the area of the largest rectangle that can be formed only from the bars of the histogram. For the diagram above, for example, this would be six, representing the `2 x 3` area at the bottom right.

## Solution

```swift
extension Array where Element == Int {
    
    func maxArea() -> Int {
        
        if isEmpty {
            return 0
        }
        
        let candidate1 = self.min()! * count
        let candidate2 = Array(suffix(count-1)).maxArea()
        let candidate3 = Array(prefix(count-1)).maxArea()
        
        return Swift.max(candidate1, candidate2, candidate3)
    }
}
```

## Tests

```swift
class Problem_353Tests: XCTestCase {

    func test_example() {
        
        let input = [1, 3, 2, 5]
        
        let actual = input.maxArea()
        let expected = 6
        
        XCTAssert(actual == expected)
    }

}
```