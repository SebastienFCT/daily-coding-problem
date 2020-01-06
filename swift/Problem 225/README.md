## Description

This problem was asked by Bloomberg.

There are N prisoners standing in a circle, waiting to be executed. The executions are carried out starting with the kth person, and removing every successive kth person going clockwise until there is no one left.

Given N and k, write an algorithm to determine where a prisoner should stand in order to be the last survivor.

For example, if N = 5 and k = 2, the order of executions would be [2, 4, 1, 5, 3], so you should return 3.

Bonus: Find an O(log N) solution if k = 2.


## Solution

```swift
extension Array where Element == Int {
    
    func last(withInterval: Int) -> Int {
        
        var indexes: [Int] = []
        var lastIndex = 0
        
        while count > indexes.count {
            
            var pointer = lastIndex
            
            for _ in 0..<withInterval {
                
                pointer += 1
                if pointer == count {
                    pointer = 0
                }
                
                while indexes.contains(self[pointer]) {
                    pointer += 1
                    if pointer == count {
                        pointer = 0
                    }
                }
            }
            
            indexes.append(pointer)
            lastIndex = pointer
        }
        
        return lastIndex
    }
}
```

## Test

```swift
class Problem_225Tests: XCTestCase {

    func test_example() {
        
        XCTAssert([0, 1, 2, 3, 4].last(withInterval: 2) == 3)
    }

}
```