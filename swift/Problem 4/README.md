## Description

```swift
extension Array where Element == Int {
    func lowerMissingPositiveInteger() -> Int {
        var index = 1
        
        while (true) {
            if !self.contains(index) {
                return index
            }
            
            index += 1
        }
    }
}

extension Array where Element == Int {
    func lowerMissingPositiveInteger2() -> Int {
        let sortedAndPositive = self.sorted{ $0 < $1}.filter{ $0 > 0 }
        
        var lastValue = 0
        
        for element in sortedAndPositive {
            if element != lastValue + 1 {
                return lastValue + 1
            }
            
            lastValue += 1
        }
        
        return lastValue + 1
    }
}
```

## Tests

```swift
class Problem_4Tests: XCTestCase {

    func testExample() {
        let input = [3, 4, -1, 1]
        
        XCTAssert(input.lowerMissingPositiveInteger() == 2)
        XCTAssert(input.lowerMissingPositiveInteger2() == 2)
    }
    
    func testExample2() {
        let input = [1, 2, 0]
        
        XCTAssert(input.lowerMissingPositiveInteger() == 3)
        XCTAssert(input.lowerMissingPositiveInteger2() == 3)
    }

}
```