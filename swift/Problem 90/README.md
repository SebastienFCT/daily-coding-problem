## Description

This question was asked by Google.

Given an integer n and a list of integers l, write a function that randomly generates a number from 0 to n-1 that isn't in l (uniform).

## Solution

```swift
struct GoogleLibrary {
    
    /// randomly generates a number from 0 to n-1 that isn't in l
    static func rand(n: Int, l: [Int]) -> Int {
        var result: Int = -1
        
        while (result < 0 || l.contains(result)) {
            result = Int.random(in: 0...n-1)
        }
        
        return result
    }
}
```

## Test

```swift
class Problem_90Tests: XCTestCase {

    func test_rand() {
        print(GoogleLibrary.rand(n: 10, l: [0,1,2,3,4,5,7,9,10]))
    }

}
```