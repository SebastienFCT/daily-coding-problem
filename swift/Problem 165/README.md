## Description

This problem was asked by Google.

Given an array of integers, return a new array where each element in the new array is the number of smaller elements to the right of that element in the original input array.

For example, given the array `[3, 4, 9, 6, 1]`, return `[1, 1, 2, 1, 0]`, since:

- There is 1 smaller element to the right of 3
- There is 1 smaller element to the right of 4
- There are 2 smaller elements to the right of 9
- There is 1 smaller element to the right of 6
- There are no smaller elements to the right of 1

## Solution

```swift
extension Array where Element == Int {
    
    func mapToTotalSmallerElementToTheRight() -> [Int] {
        
        var result: [Int] = []
        
        for i in 0..<count {
            let current = self[i]
            let rest = Array(self.suffix(count-i))
            
            result.append(rest.reduce(0, { $1 < current ? $0 + 1 : $0 }))
        }
        
        return result
    }
}
```

## Test

```swift
class Problem_165Tests: XCTestCase {

    func test_example() {
        XCTAssert([3, 4, 9, 6, 1].mapToTotalSmallerElementToTheRight() == [1, 1, 2, 1, 0])
    }

}
```