## Description

This problem was asked by Facebook.

Given a circular array, compute its maximum subarray sum in O(n) time. A subarray can be empty, and in this case the sum is 0.

For example, given `[8, -1, 3, 4]`, return `15` as we choose the numbers `3`, `4`, and `8` where the 8 is obtained from wrapping around.

Given `[-4, 5, 1, 0]`, return `6` as we choose the numbers `5` and `1`.

## Solution

```swift
extension Array where Element == Int {
    
    func maxSubArraySum() -> Int {
        
        var result: [Int] = []
        var maximum = 0
        var current = 0
        
        for i in 0..<count*2 {
            
            let position = i % count
            
            while result.count >= count || (result.count > 0 && result.first! < 1) {
                current -= result.removeFirst()
            }
            
            result.append(self[position])
            current += self[position]
            
            maximum = Swift.max(current, maximum)
        }
        
        return maximum
    }
}
```

## Test

```swift
class Problem_190Tests: XCTestCase {

    func test_example_1() {
        XCTAssert([8, -1, 3, 4].maxSubArraySum() == 15)
    }
    
    func test_example_2() {
        XCTAssert([-4, 5, 1, 0].maxSubArraySum() == 6)
    }

}
```