## Description

This problem was asked by Apple.

A fixed point in an array is an element whose value is equal to its index. Given a sorted array of distinct elements, return a fixed point, if one exists. Otherwise, return `False`.

For example, given `[-6, 0, 2, 40]`, you should return `2`. Given `[1, 5, 7, 8]`, you should return `False`.


## Solution

```swift
struct FixedPoint {
    
    var input: [Int]
    
    func anyFixedPoint() -> Any {
        
        for i in 0..<input.count {
            if input[i] == i {
                return i
            }
        }
        
        return false
    }
}
```

## Tests

```swift
class Problem_273Tests: XCTestCase {

    func test_example_1() {
        
        let input = FixedPoint(input: [-6, 0, 2, 40])
        let expected = 2
        let actual = input.anyFixedPoint()
        
        XCTAssert(actual as? Int == expected)
    }
    
    func test_example_2() {
        
        let input = FixedPoint(input: [1, 5, 7, 8])
        let expected = false
        let actual = input.anyFixedPoint()
        
        XCTAssert(actual as? Bool == expected)
    }

}
```