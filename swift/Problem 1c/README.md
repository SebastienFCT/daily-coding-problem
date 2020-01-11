## Description

Given array of integers, there is any combination of **exact** N elements which sum return K

## Solution

```swift
extension Array where Element == Int {
    
    func hasCombination(withCount n: Int, forSum k: Int) -> Bool {
        
        let candidates = next(current: [], maxLength: n)
        let mapped = candidates.map{ $0.reduce(0, { $0 + $1 }) }
        
        return mapped.contains(k)
    }
    
    private func next(current: [Int], maxLength: Int) -> [[Int]] {
        
        if count == maxLength {
            return [self]
        }
        
        var result: [[Int]] = []
        
        for i in 0..<count {
            let item = self[i]
            
            var copy = current
            copy.append(item)
            
            var left = self
            left.remove(at: i)
            
            result.append(contentsOf: copy.next(current: copy, maxLength: maxLength))
        }
        
        return result
    }
}
```

## Tests

```swift
class Problem_1cTests: XCTestCase {

    func test_true() {
        
        let input = [10, 6, 12, 890, 10, 10, 20, 5, 10, 90, 12, 22, 9, 10]
        
        XCTAssertTrue(input.hasCombination(withCount: 5, forSum: 50))
    }
    
    func test_false() {
        
        let input = [10, 10, 10, 10, 10, 10, 10, 10, 10, 1, 1, 1, 1]
        
        XCTAssertFalse(input.hasCombination(withCount: 5, forSum: 59))
    }

}
```