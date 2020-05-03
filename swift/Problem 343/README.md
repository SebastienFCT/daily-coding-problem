## Description

This problem was asked by Google.

Given a binary search tree and a range `[a, b]` (inclusive), return the sum of the elements of the binary search tree within the range.

For example, given the following tree:

```
    5
   / \
  3   8
 / \ / \
2  4 6  10
```

and the range `[4, 9]`, return `23` (5 + 4 + 6 + 8).

## Solution

```swift
class Node {
    var value: Int
    var left: Node?
    var right: Node?
    
    init(value: Int, left: Node?, right: Node?) {
        self.value = value
        self.left = left
        self.right = right
    }
    
    func sum(forRange range: ClosedRange<Int>) -> Int {
        
        if range.contains(value) {
            return value + (left?.sum(forRange: range) ?? 0) + (right?.sum(forRange: range) ?? 0)
        }
        
        if value > range.max()! {
            return left?.sum(forRange: range) ?? 0
        }
        
        if value < range.min()! {
            return right?.sum(forRange: range) ?? 0
        }
        
        return 0
    }
}
```

## Tests

```swift
class Problem_343Tests: XCTestCase {

    func test_example() {
        
        let input = Node(value: 5
            , left: Node(value: 3
                , left: Node(value: 2, left: nil, right: nil)
                , right: Node(value: 4, left: nil, right: nil))
            , right: Node(value: 8
                , left: Node(value: 6, left: nil, right: nil)
                , right: Node(value: 10, left: nil, right: nil)))
        
        let actual = input.sum(forRange: 4...9)
        let expected = 23
        
        XCTAssert(actual == expected)
    }

}
```