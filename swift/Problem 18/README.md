### Description

This problem was asked by Google.

Given an array of integers and a number `k`, where 1 <= `k` <= length of the array, compute the maximum values of each subarray of length `k`.

For example, given array = `[10, 5, 2, 7, 8, 7]` and `k = 3`, we should get: `[10, 7, 8, 8]`, since:

```
10 = max(10, 5, 2)
7 = max(5, 2, 7)
8 = max(2, 7, 8)
8 = max(7, 8, 7)
```

Do this in `O(n)` time and `O(k)` space. You can modify the input array in-place and you do not need to store the results. You can simply print them out as you compute them.

### Solution

```swift
extension Array where Element == Int {
    func getMaxValueOfSubarray(ofLength length: Int) -> [Int] {
        guard length <= self.count else {
            fatalError("length can't be greater than the array length")
        }
        
        var result: [Int] = []
        
        if length == self.count {
            return [self.max() ?? 0]
        }
        
        for i in 1...(self.count - (length - 1)) {
            let subarray = self[(i-1)...(i + length - 2)]
            
            let value = subarray.max() ?? 0
            result.append(value)
        }
        
        return result
    }
}
```

#### Test

```swift
class Problem_18Tests: XCTestCase {

    func testExample() {
        let input =  [10, 5, 2, 7, 8, 7]
        XCTAssert(input.getMaxValueOfSubarray(ofLength: 3) == [10, 7, 8, 8])
        XCTAssert(input.getMaxValueOfSubarray(ofLength: 4) == [10, 8, 8])
        XCTAssert(input.getMaxValueOfSubarray(ofLength: 5) == [10, 8])
        XCTAssert(input.getMaxValueOfSubarray(ofLength: 6) == [10])
    }

}
```