## Description

This problem was asked by Google.

Given an `iterator` with methods `next()` and `hasNext()`, create a wrapper iterator, `PeekableInterface`, which also implements `peek()`. `peek` shows the next element that would be returned on `next()`.

Here is the interface:

```
class PeekableInterface(object):
    def __init__(self, iterator):
        pass

    def peek(self):
        pass

    def next(self):
        pass

    def hasNext(self):
        pass
```

## Solution

```swift
protocol PeekableInterface {
    func peek() -> Any?
}

struct Iterator: PeekableInterface {
    var items: [Any] = []
    var currentIndex = 0

    func hasNext() -> Bool {
        return currentIndex < items.count-1
    }
    
    mutating func next() -> Any? {
        if currentIndex >= items.count {
            return nil
        }
        
        currentIndex += 1
        return items[currentIndex]
    }
    
    func peek() -> Any? {        
        if currentIndex >= items.count {
            return nil
        }
        
        return items[currentIndex+1]
    }
}
```

## Test

```swift
class Problem_139Tests: XCTestCase {

    func test_peekable_interface() {
        
        var input = Iterator(items: ["a", 2, 3, "4", 5], currentIndex: 0)
        
        XCTAssert(input.peek() as? Int == 2)
        XCTAssert(input.peek() as? Int == 2)
        input.next()
        input.next()
        XCTAssert(input.peek() as? String == "4")
    }

}
```