## Description

This problem was asked by Apple.

Gray code is a binary code where each successive value differ in only one bit, as well as when wrapping around. Gray code is common in hardware so that we don't see temporary spurious values during transitions.

Given a number of bits `n`, generate a possible gray code for it.

For example, for n = `2`, one gray code would be `[00, 01, 11, 10]`.

## Solution

```swift
struct AppleGrayCode {
    
    func possibilities(for n: Int) -> [[Int]] {
        var result: [[Int]] = []
        
        for _ in 0...n-1 {
            if result.isEmpty {
                result.append(contentsOf: [[0], [1]])
            } else {
                result = result.grayCodes()
            }
        }
        
        return result
    }
}

extension Array where Element == [Int] {
    func grayCodes() -> [[Int]] {
        var result: [[Int]] = []
        
        for element in self {
            var first = element
            first.append(0)
            result.append(first)
            
            var second = element
            second.append(1)
            result.append(second)
        }
        
        return result
    }
}
```

## Test

```swift
class Problem_148Tests: XCTestCase {

    func test_example() {
        XCTAssert(AppleGrayCode().possibilities(for: 2) == [[0, 0], [0, 1], [1, 0], [1, 1]])
        XCTAssert(AppleGrayCode().possibilities(for: 4) == [
            [0, 0, 0, 0], [0, 0, 0, 1], [0, 0, 1, 0], [0, 0, 1, 1],
            [0, 1, 0, 0], [0, 1, 0, 1], [0, 1, 1, 0], [0, 1, 1, 1],
            [1, 0, 0, 0], [1, 0, 0, 1], [1, 0, 1, 0], [1, 0, 1, 1],
            [1, 1, 0, 0], [1, 1, 0, 1], [1, 1, 1, 0], [1, 1, 1, 1]]
        )
    }

}
```