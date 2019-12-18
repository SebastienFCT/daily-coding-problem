## Description

This problem was asked by Twitter.

A permutation can be specified by an array `P`, where `P[i]` represents the location of the element at `i` in the permutation. For example, `[2, 1, 0]` represents the permutation where elements at the index `0` and `2` are swapped.

Given an array and a permutation, apply the permutation to the array. For example, given the array `["a", "b", "c"]` and the permutation `[2, 1, 0]`, return `["c", "b", "a"]`.

## Solution

```swift
extension Array {
    
    mutating func applyPermutation(permutation: [Int]) {
        
        var copy = self
        var viewed: Set<Int> = Set()
        
        for i in 0..<count {
            if viewed.contains(i) { continue }
            
            if permutation[i] != i {
                copy[i] = self[permutation[i]]
                copy[permutation[i]] = self[i]
                
                viewed.insert(permutation[i])
            } else {
                copy[i] = self[i]
            }
            
            viewed.insert(i)
            
            if viewed.count == count {
                self = copy
            }
        }
        
        self = copy
        
    }
}
```

## Test

```swift
class Problem_206Tests: XCTestCase {

    func test_example() {
        var current = ["a", "b", "c"]
        current.applyPermutation(permutation: [2, 1, 0])
        
        let expected = ["c", "b", "a"]
            
        XCTAssert(current == expected)
    }

}
```