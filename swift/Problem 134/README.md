## Description

This problem was asked by Facebook.

You have a large array with most of the elements as zero.

Use a more space-efficient data structure, SparseArray, that implements the same interface:

- `init(arr, size)`: initialize with the original large array and size.
- `set(i, val)`: updates index at `i` with val.
- `get(i)`: gets the value at index `i`.


## Solution

```swift
class SparseArray {
    
    var size: Int
    var values: [Int: Int]
    
    init(array: [Int], size: Int) {
        self.size = size
        self.values = [:]
        
        for i in 0..<array.count {
            if array[i] != 0 {
                self.values[i] = array[i]
            }
        }
    }
    
    func set(i: Int, val: Int) {
        if i > size {
            size = i+1
        }
        
        values[i] = val
    }
    
    func get(i: Int) -> Int {
        guard i < size else {
            fatalError("Index out of bound")
        }
        
        if values.keys.contains(i) {
            return values[i]!
        }
        
        return 0
    }
}
```

## Test

```swift
class Problem_134Tests: XCTestCase {

    func test_sparse_array() {
        let sparseArray = SparseArray(array: [0,1,0,2,0,3,0], size: 7)
        
        XCTAssert(sparseArray.get(i: 1) == 1)
        
        sparseArray.set(i: 10, val: 10)
        XCTAssert(sparseArray.get(i: 10) == 10)
        XCTAssert(sparseArray.get(i: 9) == 0)
    }

}
```