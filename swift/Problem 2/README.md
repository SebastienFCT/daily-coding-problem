## Description

This problem was asked by Uber.

Given an array of integers, return a new array such that each element at index `i` of the new array is the product of all the numbers in the original array except the one at `i`.

For example, if our input was [1, 2, 3, 4, 5], the expected output would be `[120, 60, 40, 30, 24]`. If our input was `[3, 2, 1]`, the expected output would be `[2, 3, 6]`.

Follow-up: what if you can't use division?

## Solution

Since I read the `follow up` question from the beginning, I got the obvious answer for this challenge:
 
- Get the product of all elements and store it in a variable
- Map the initial array to a new one that corresponds to the calculated product divided by the the item in the initial array

Without this hint, I would have probably gone with a less efficient algorithm where I loop through each element and try to get a product of all element but the current one. This shows how valuable are the first "brain-storming" minutes for any challenge.

```swift
extension Array where Element == Int {
    
    func productOfOthers() -> [Int] {
        let product = self.reduce(1){ $0 * $1 }
        
        return self.map{ product / $0 }
    }
}
```

So now, how to do this without division?
 
Let's apply the solution mentioned before:

- Create a empty array (the result)
- Loop through your initial array and for each element
    - Create a copy of your initial array and remove the ith element
    - Store in your result array the product of the elements

```swift
extension Array where Element == Int {
    
    func productOfOtherWithoutDivision() -> [Int] {
        var result: [Int] = []
        
        for i in 0...(self.count - 1) {
            var copy = self
            copy.remove(at: i)
            
            result.append(copy.reduce(1){ $0 * $1 })
        }
        
        return result
    }
}
```

## Tests

```swift
class Problem_2Tests: XCTestCase {

    func testExample() {
        let input = [1, 2, 3, 4, 5]
        
        XCTAssert(input.productOfOthers() == [120, 60, 40, 30, 24])
        XCTAssert(input.productOfOtherWithoutDivision() == [120, 60, 40, 30, 24])
    }
    
    func testExample2() {
        let input = [3, 2, 1]
        
        XCTAssert(input.productOfOthers() == [2, 3, 6])
        XCTAssert(input.productOfOtherWithoutDivision() == [2, 3, 6])
    }

}
```