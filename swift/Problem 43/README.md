## Description

This problem was asked by Amazon.

Implement a stack that has the following methods:

- `push(val)`, which pushes an element onto the stack
- `pop()`, which pops off and returns the topmost element of the stack. If there are no elements in the stack, then it should throw an error or return null.
- `max()`, which returns the maximum value in the stack currently. If there are no elements in the stack, then it should throw an error or return null.

Each method should run in constant time.

## Solution

```swift
class Stack {
    var values: [Int] = []
    var indexes: [Int] = []
    
    func push(value: Int) {
        values.append(value)
        
        if indexes.isEmpty {
            indexes.append(values.count-1)
        } else {
            if value > values[indexes.last ?? 0] {
                indexes.append(values.count-1)
            }
        }
    }
}

extension Stack {
    func pop() {
        if values.isEmpty || indexes.isEmpty {
            return
        }
        
        if values[indexes.last!] == values.last! {
            indexes.removeLast()
        }
        
        values.removeLast()
    }
}

extension Stack {
    func max() -> Int? {
        guard values.count > 0, indexes.count > 0 else {
            return nil
        }
        
        return values[indexes.last!]
    }
}
```

## Test

```swift
class Problem_43Tests: XCTestCase {

    func test_1() {
        let stack = Stack()
        
        stack.push(value: 1)
        XCTAssert(stack.max() == 1)
        stack.pop()
        stack.push(value: 5)
        XCTAssert(stack.max() == 5)
        stack.push(value: 3)
        XCTAssert(stack.max() == 5)
        stack.push(value: 10)
        XCTAssert(stack.max() == 10)
        stack.push(value: 11)
        XCTAssert(stack.max() == 11)
        stack.push(value: 2)
        XCTAssert(stack.max() == 11)
        stack.pop()
        XCTAssert(stack.max() == 11)
        stack.pop()
        XCTAssert(stack.max() == 10)
        stack.pop()
        XCTAssert(stack.max() == 5)
        stack.pop()
        XCTAssert(stack.max() == 5)
        stack.pop()
        XCTAssert(stack.max() == nil)
    }

}
```