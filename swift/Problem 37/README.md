## Description

This problem was asked by Google.

The power set of a set is the set of all its subsets. Write a function that, given a set, generates its power set.

For example, given the set `{1, 2, 3}`, it should return `{{}, {1}, {2}, {3}, {1, 2}, {1, 3}, {2, 3}, {1, 2, 3}}`.

You may also use a list or array to represent a set.

## Solution

According to the example, we build a power set by creating a array of set and appending
 
- First all possible combination of 1 item
- All possible combination of 2 items
- ...
- All possible combinatino of N-1 items, N being the size of the original set
- The set itself

EDIT: after testing it out, I spent about an hour trying to apply the previous logic, I got stuck in my thoughts and tried a different approach:

- Create a power set variable (an array of set)
- Remove an element of the initial set and add it as a "set" in the power set variable, then loop
- For each of the next element, add a combination of each element in the power set variable with themselve and finally add themselves as their own "set"
- The end condition is when the initial set is empty

```swift
extension Set where Element == Int {
    // Powerset is a convenient methods that has an explicit name for the client. We could have used a single function instead.
    mutating func powerSet() -> [Set<Int>] {
        return self.allCombination(result: [])
    }
    
    mutating func allCombination(result: [Set<Int>]) -> [Set<Int>] {
        var result: [Set<Int>] = result
        
        // I get the first element of the set
        let next = self.removeFirst()
        
        // If the current result is empty, I add the first element to it and re-iterate, this prevents from having a first duplicate case
        if result.isEmpty {
            result.append(Set([next]))
            return self.allCombination(result: result)
        }
        
        // For each element in the current result, I create a combination of the element with my `next` value. I store them in a temporary array of set to avoid concurrent modification of the original variable
        var toAppend: [Set<Int>] = []
        
        for element in result {
            var copy = element
            copy.insert(next)
            toAppend.append(copy)
        }
        
        result.append(contentsOf: toAppend)
        // Don't forget to add the value itself
        result.append(Set([next]))
        
        // If you still have value in the set, keep running, otherwise return the result
        if !self.isEmpty {
            return self.allCombination(result: result)
        }
        
        return result
    }
}
```

## Tests

```swift
class Problem_37Tests: XCTestCase {

    func test_example() {
        var input = Set([1, 2, 3])
        print(input.powerSet())
    }

}
```