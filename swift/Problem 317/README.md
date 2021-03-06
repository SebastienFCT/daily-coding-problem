## Description

This problem was asked by Yahoo.

Write a function that returns the bitwise AND of all integers between `M` and `N`, inclusive.

## Solution

```swift
func andBitwise(from: Int, to: Int) -> UInt {
    
    var result = from.toUInt()
    
    for i in from+1...to {
        result = result & i.toUInt()
    }
    
    return result
}

extension Int {
    func toUInt() -> UInt {
        return self >= 0 ? UInt(self) : UInt(self  - Int.min) + UInt(Int.max) + 1
    }
}

extension UInt {
    func toInt() -> Int {
        return (self <= UInt(Int.max)) ? Int(self) : Int(self - UInt(Int.max) - 1) + Int.min
    }
}
```

## Tests

```swift
class Problem_317Tests: XCTestCase {

    func test_and_bitwise() {
        print(andBitwise(from: 9, to: 10))
    }

}
```