## Description

This problem was asked by Google.

Given two strings A and B, return whether or not A can be shifted some number of times to get B.

For example, if A is `abcde` and B is `cdeab`, return `true`. If A is `abc` and B is `acb`, return `false`.

## Solution

```swift
extension String {
    func canShiftTo(target: String) -> Bool {
        var shifted = self
        
        guard self.count == target.count else {
            return false
        }
        
        for _ in 0..<count {
            shifted = "\(shifted.suffix(1))\(shifted.prefix(count-1))"
            if shifted == target {
                return true
            }
        }
        
        return false
    }
}
```

## Test

```swift
class Problem_108Tests: XCTestCase {

    func test_example_1() {
        let input = "abcde"
        XCTAssertTrue(input.canShiftTo(target: "cdeab"))
    }
    
    func test_example_2() {
        let input = "abc"
        XCTAssertFalse(input.canShiftTo(target: "acb"))
    }

}
```