## Description

This problem was asked by Amazon.

Implement a bit array.

A bit array is a space efficient array that holds a value of `1` or `0` at each index.

- `init(size)`: initialize the array with size
- `set(i, val)`: updates index at `i` with `val` where val is either `1` or `0`.
- `get(i)`: gets the value at index `i`.

## Solution

```swift
class BitArray {
    var array: [Int]
    var size: Int
    
    init(size: Int) {
        self.size = size
        self.array = []
    }
    
    func set(i: Int, val: Bool) {
        if i >= size {
            return
        }
        
        if val && !array.contains(i) {
            array.append(i)
        } else {
            if array.contains(i) {
                array = array.filter{ $0 != i }
            }
        }
    }
    
    func get(i: Int) -> Int? {
        if i >= size {
            return nil
        }
        
        return array.contains(i) ? 1 : 0
    }
}
```

## Test

```swift
class Problem_137Tests: XCTestCase {

    func test_bitArray() {
        var ba = BitArray(size: 10)
        ba.set(i: 5, val: true)
        print(ba.get(i: 0))
        print(ba.get(i: 5))
        print(ba.get(i: 11))
        ba.set(i: 11, val: true)
        ba.set(i: 0, val: true)
        ba.set(i: 5, val: false)
        print(ba.get(i: 0))
        print(ba.get(i: 5))
        print(ba.get(i: 11))
    }

}
```