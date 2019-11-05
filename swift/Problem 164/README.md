## Description

This problem was asked by Google.

You are given an array of length `n + 1` whose elements belong to the set `{1, 2, ..., n}`. By the pigeonhole principle, there must be a duplicate. Find it in linear time and space.

## Solution

```swift
extension Array where Element == Int {
    
    func pigeonhole() -> Int? {
        var set: Set<Int> = Set()
        
        for item in self {
            if set.contains(item) {
                return item
            }
            
            set.insert(item)
        }
        
        return nil
    }
    
}
```

## Test

```swift
class Problem_164Tests: XCTestCase {

    func test_pigeonhole() {
        XCTAssert([1,2,3,4,5,6,7,7,8].pigeonhole() == 7)
        XCTAssert([101,6345,2,132,45,0,243,2345,2,665,34].pigeonhole() == 2)
    }

}
```