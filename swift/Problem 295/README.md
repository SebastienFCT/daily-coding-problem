## Description

This problem was asked by Stitch Fix.

Pascal's triangle is a triangular array of integers constructed with the following formula:

- The first row consists of the number 1.
- For each subsequent row, each element is the sum of the numbers directly above it, on either side.

For example, here are the first few rows:

```
    1
   1 1
  1 2 1
 1 3 3 1
1 4 6 4 1
```

Given an input `k`, return the `kth` row of Pascal's triangle.

Bonus: Can you do this using only `O(k)` space?

## Solution

```swift
struct PascalTriangle {
    
    func getRow(n: Int) -> [Int] {
        
        if n == 0 {
            fatalError("n must be greater than 0")
        }
        
        if n == 1 {
            return [1]
        }
        
        var result: [Int] = Array(repeating: 0, count: n)
        
        let previous = getRow(n: n-1)
        for i in 0..<result.count {
            
            if i != 0 {
                result[i] += previous[i-1]
            }
            
            if i != result.count-1 {
                result[i] += previous[i]
            }
        }
        
        return result
    }
}
```

## Tests

```swift
class Problem_295Tests: XCTestCase {

    func test_pascal_triangle() {
        
        for i in 1...10 {
            print(PascalTriangle().getRow(n: i))
        }
    }

}
```