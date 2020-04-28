## Description

This problem was asked by Microsoft.

Given an array of numbers and a number k, determine if there are three entries in the array which add up to the specified number `k`. For example, given `[20, 303, 3, 4, 25]` and `k = 49`, return true as `20 + 4 + 25 = 49`.

## Solution

```swift
extension Array where Element == Int {
    
    func countainsTrio(withSum sum: Int) -> Bool {
        
        for i in 0..<count-2 {
            
            for j in i+1..<count-1 {
                
                for k in j+1..<count {
                    
                    if self[i] + self[j] + self[k] == sum {
                        return true
                    }
                }
            }
        }
        
        return false
    }
}
```

## Tests

```swift
class Problem_339Tests: XCTestCase {

    func test_example() {
        
        let input = [20, 303, 3, 4, 25]
        
        XCTAssertTrue(input.countainsTrio(withSum: 49))
        XCTAssertFalse(input.countainsTrio(withSum: 50))
    }

}
```