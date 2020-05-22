## Description

This problem was asked by Squarespace.

Write a function, `add_subtract`, which alternately adds and subtracts curried arguments. Here are some sample operations:

```
add_subtract(7) -> 7

add_subtract(1)(2)(3) -> 1 + 2 - 3 -> 0

add_subtract(-5)(10)(3)(9) -> -5 + 10 - 3 + 9 -> 11
```

## Solution

```swift
func add_substract(values: Int...) -> Int {
    
    var result = values[0]
    
    for i in 1..<values.count {
        if i % 2 == 0 {
            result -= values[i]
        } else {
            result += values[i]
        }
    }
    
    return result
}
```

## Tests

```swift
class Problem_363Tests: XCTestCase {

    func test_example() {
        
        XCTAssert(add_substract(values: 7) == 7)
        XCTAssert(add_substract(values: 1, 2, 3) == 0)
        XCTAssert(add_substract(values: -5, 10, 3, 9) == 11)
    }

}
```