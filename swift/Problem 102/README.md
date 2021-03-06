## Description

This problem was asked by Lyft.

Given a list of integers and a number K, return which contiguous elements of the list sum to K.

For example, if the list is [1, 2, 3, 4, 5] and K is 9, then it should return [2, 3, 4], since 2 + 3 + 4 = 9.

## Solution

```swift
extension Array where Element == Int {
    
    func contiguousElement(forSum sum: Int) -> [Int] {
        
        var result: [Int] = []
        
        for i in 0..<count {
            result = []
            
            if self[i] == sum {
                return [self[i]]
            }
            
            result.append(self[i])
            
            let rest = Array(self.suffix(count-i-1))
            
            for item in rest {
                result.append(item)
                
                let currentSum = result.reduce(0){ $0 + $1 }
                if currentSum == sum {
                    return result
                }
                
                if currentSum > sum {
                    break
                }
            }
        }
        
        return []
    }
}
```

## Test

```swift
class Problem_102Tests: XCTestCase {

    func test_example() {
        let input = [1, 2, 3, 4, 5]
        XCTAssert(input.contiguousElement(forSum: 9) == [2, 3, 4])
    }
    
    func test_other() {
        let input = [1,2,3,4,5,6]
        XCTAssert(input.contiguousElement(forSum: 3) == [1, 2])
        XCTAssert(input.contiguousElement(forSum: 2) == [2])
        XCTAssert(input.contiguousElement(forSum: 100) == [])
    }

}
```