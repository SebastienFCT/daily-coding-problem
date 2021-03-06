## Description

This problem was asked by Palantir.

Given a number represented by a list of digits, find the next greater permutation of a number, in terms of lexicographic ordering. If there is not greater permutation possible, return the permutation with the lowest value/ordering.

For example, the list `[1,2,3]` should return `[1,3,2]`. The list `[1,3,2]` should return `[2,1,3]`. The list `[3,2,1]` should return `[1,2,3]`.

Can you perform the operation without allocating extra memory (disregarding the input memory)?

## Solution

Taken from https://stackoverflow.com/questions/1622532/algorithm-to-find-next-greater-permutation-of-a-given-string

```swift
extension Array where Element == Int {
    
    func nextPermutation() -> [Int] {
        
        var i = count-1
        
        while (i > 0 && self[i-1] >= self[i]) {
            i -= 1
        }
        
        if i <= 0 {
            return self.reversed()
        }
        
        var j = count-1
        
        while (self[j] <= self[i-1]) {
            j -= 1
        }
        
        var copy = self
        copy[i-1] = self[j]
        copy[j] = self[i-1]
        
        j = count-1
        
        let left = Array(copy.prefix(upTo: i))
        let right = Array(copy.suffix(count-i))
        
        return left + right.reversed()
    }
    
    func nextPermutation2() -> [Int] {
        
        if count <= 2 {
            return self.reversed()
        }
        
        var permutationLeftElementIndex = 0
        var permutationRightElementIndex = 0
        
        for index in stride(from: count-1, to: 0, by: -1) {
            if index == 0 {
                return self.reversed()
            }
            
            if self[index] > self[index-1] {
                permutationLeftElementIndex = index-1
                permutationRightElementIndex = index
                break
            }
        }
        
        for index in stride(from: permutationRightElementIndex, to: count-1, by: +1) {
            if self[index] > self[permutationRightElementIndex] {
                permutationRightElementIndex = index
            }
        }
        
        var copy = self
        copy[permutationLeftElementIndex] = self[permutationRightElementIndex]
        copy[permutationRightElementIndex] = self[permutationLeftElementIndex]
        
        let left = Array(copy.prefix(upTo: permutationRightElementIndex))
        let right = Array(copy.suffix(count-permutationRightElementIndex))
        
        print("left: \(left)")
        print("right: \(right)")
        
        return left + right.reversed()
    }
}

```

## Test

```swift
class Problem_95Tests: XCTestCase {

    func test_example() {
        let input = [1,2,3]
        XCTAssert(input.nextPermutation() == [1, 3, 2])
    }

}
```