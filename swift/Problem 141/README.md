## Description

This problem was asked by Microsoft.

Implement 3 stacks using a single list:

```
class Stack:
    def __init__(self):
        self.list = []

    def pop(self, stack_number):
        pass

    def push(self, item, stack_number):
        pass
```

## Solution

```swift
struct Stack {
    var list: [[Any]] = []
    
    mutating func pop(stack_number: Int) {
        guard stack_number < list.count else {
            return
        }
        
        guard !list[stack_number].isEmpty else {
            return
        }
        
        list[stack_number].removeLast()
    }
    
    mutating func push(item: Any, stack_number: Int) {
        if stack_number < list.count {
            list[stack_number].append(item)
            return
        }
        
        if list.count == stack_number {
            list.append([item])
            return
        }
        
        for _ in 1...stack_number-list.count {
            list.append([])
        }
        
        list.append([item])
    }
}
```

## Test

```swift
class Problem_141Tests: XCTestCase {

    func test_stack() {
        var stack = Stack(list: [])
        
        stack.push(item: "Test", stack_number: 0)
        XCTAssert(stack.list[0][0] as? String == "Test")
        
        stack.push(item: 1, stack_number: 2)
        XCTAssert(stack.list[1].isEmpty)
        XCTAssert(!stack.list[2].isEmpty)
        XCTAssert(stack.list[2][0] as? Int == 1)
        
        stack.push(item: 5, stack_number: 2)
        XCTAssert(stack.list[2][1] as? Int == 5)
        
        stack.pop(stack_number: 2)
        XCTAssert(stack.list[2].count == 1)
    }

}
```