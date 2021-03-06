## Description

This problem was asked by Netflix.

Given an array of integers, determine whether it contains a Pythagorean triplet. Recall that a Pythogorean triplet `(a, b, c)` is defined by the equation `a²+ b²= c²`.

## Solution

```swift
extension Array where Element == Int {
    
    func pythogoranTriplet() -> [Int]? {
        
        guard count >= 3 else {
            return nil
        }
        
        for i in 0..<count-1 {
            
            for j in i..<count {
                
                for k in 0..<count {
                    
                    if k == i || k == j {
                        continue
                    }
                    
                    if self[i] * self[i] + self[j] * self[j] == self[k] * self[k] {
                        return [self[i], self[j], self[k]]
                    }
                }
            }
        }
        
        return nil
    }
}
```

## Tests

```swift
class Problem_282Tests: XCTestCase {

    func test_pythogoran_triplet() {
        
        XCTAssert([24, 7, 25, 10, 2, 12].pythogoranTriplet() == [24, 7, 25])
        XCTAssert([25, 10, 7, 2, 24, 12].pythogoranTriplet() == [7, 24, 25])
        
        XCTAssertNil([1].pythogoranTriplet())
        XCTAssertNil([2, 4, 6, 8].pythogoranTriplet())
    }

}
```