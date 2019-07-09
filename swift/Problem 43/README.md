## Description

This problem was asked by Amazon.

Implement a stack that has the following methods:

- `push(val)`, which pushes an element onto the stack
- `pop()`, which pops off and returns the topmost element of the stack. If there are no elements in the stack, then it should throw an error or return null.
- `max()`, which returns the maximum value in the stack currently. If there are no elements in the stack, then it should throw an error or return null.

Each method should run in constant time.

## Solution

For this exercise, I will create a stack of Integers as otherwise I don't have much information as of how to compare elements of the stack (for the max function)
 
- For push(val), I understand "pushes an element onto the stack" by adding it on top of the stack ("onto")
- For pop, it removes the topmost element (so the last one pushed)
- Max returns the maximum value of the stack

First, I'm thinking of implementing a node structure that keeps reference of another node, this way when I pop an element, I can set the stack reference as being the reference of the node I'm poping. However this would make the max() function really tedious

Since we're always adding or removing on top, we can assume that the max() function will always be something that was set as a max before the last "pop".

For example, if we add 1,5,2,10 then our stack will be

- [1], [1,5], [1,5,2], [1,5,2,10]

and an "array" of max values

- [1], [1,5], [1,2,5], [1,2,5,10]

if I replace the maximum values by their indexes:

- [0], [0,1], [0,2,1], [0,2,1,3]

Keeping track of the index makes it easy to calculate the max() and poping elements, but push becomes harder

But If I were to keep track of only the largest elements, then it would work: a `pop` only pop my array of maximum values if it correspond to the index of the maximum value

- [0], [0,1], [0,1], [0,1,3]

Let's try this, our stack class will hold a reference to an array of values and an array of max indexes

The push function will:
- add the new value to the stack of values
- add the new index only if it's a larger value than the previous largest one

```swift
class Stack {
    var values: [Int] = []
    var indexes: [Int] = []
    
    func push(value: Int) {
        values.append(value)
        
        if indexes.isEmpty {
            // If the indexes are empty, then we set the max value as the index of the new value
            // (technically it's always 0, but values.count-1 makes it compatible with other language like coldfusion where array indexes start at 1)
            indexes.append(values.count-1)
        } else {
            // Otherwise, we add the new index to the stack of max value indexes only if the new value if bigger
            if value > values[indexes.last ?? 0] {
                indexes.append(values.count-1)
            }
        }
    }
}
```

Our pop function remove the last element of the values and remove the last element of our array of indexes if it corresponds to our value

```swift
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
```

Finally, the max value returns the value with the index matching the last index we saved

```swift
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