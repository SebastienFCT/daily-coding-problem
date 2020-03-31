## Description

This problem was asked by Pivotal.

Write an algorithm that finds the total number of set bits in all integers between 1 and N.

## Solution

```swift
extension Int {
    
    func countSetBits() -> Int {
        
        if self <= 0 {
            return 0
        }
        
        let rest = self / 2
        
        return (self % 2 == 0 ? 0 : 1) + rest.countSetBits()
    }
}
```

## Tests

```swift
class Problem_310Tests: XCTestCase {

    func test_count_set_bits() {
        
        for i in 0...100 {
            print(i.countSetBits())
        }
    }

}
```