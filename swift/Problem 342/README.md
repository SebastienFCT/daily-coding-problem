## Description

This problem was asked by Stripe.

`reduce` (also known as `fold`) is a function that takes in an array, a combining function, and an initial value and builds up a result by calling the combining function on each element of the array, left to right. For example, we can write `sum()` in terms of reduce:

```
def add(a, b):
    return a + b
```

```
def sum(lst):
    return reduce(lst, add, 0)
```

This should call add on the initial value with the first element of the array, and then the result of that with the second element of the array, and so on until we reach the end, when we return the sum of the array.

Implement your own version of `reduce`.

## Solution

```swift
typealias IntOperation = (Int, Int) -> Int

func fold(list: [Int], operation: IntOperation, initial: Int) -> Int {
    
    var result = initial
    
    for i in 0..<list.count {
        result = operation(result, list[i])
    }
    
    return result
    
}
```

## Tests

```swift
class Problem_342Tests: XCTestCase {

    func test_fold() {
        
        let input = [1, 2, 3, 4, 5]
        
        func add(left: Int, right: Int) -> Int {
            return left + right
        }
        
        let actual = fold(list: input, operation: add(left:right:), initial: 0)
        let expected = 15
        
        XCTAssert(actual == expected)
    }
}
```