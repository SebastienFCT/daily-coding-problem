## Description

This problem was asked by Microsoft.

Given a dictionary of words and a string made up of those words (no spaces), return the original sentence in a list. If there is more than one possible reconstruction, return any of them. If there is no possible reconstruction, then return null.

For example, given the set of words `quick`, `brown`, `the`, `fox`, and the string `thequickbrownfox`, you should return `['the', 'quick', 'brown', 'fox']`.

Given the set of words `bed`, `bath`, `bedbath`, `and`, `beyond`, and the string `bedbathandbeyond`, return either `['bed', 'bath', 'and', 'beyond]` or `['bedbath', 'and', 'beyond']`.

## Solution

First thought is: it's simple, since I can return any combination, I just have to loop through the array of work and stop every time I catch a word

But this won't work for something like this:

- Possibilities: ["ab", "a", "b", "bc"]
- Input: "abc", as the algorithm would find "ab" and then would stuck on the "c" (while ["a", "bc"] is possible)

So then I'm thinking sorting my array of possibilities per length:

- Possibilities: ["ab", "a", "b", "bc"]
- Transformed = ["a", "b", "ab", "bc"]
- Input: "abc"

But the same problem happens: it would return ["a", "b"] and then get stuck.

So then, I'm thinking brute force:

I create a recursive function that will progressively build my output and everytime it get stucks, it tries a different path

But here, I feel like it would be way too agresive: it works fine when I just need to change the path of the last node, but what if all path for the node N aren't working? I should loop back to the previous node and check if there is any alternative and if not I keep looping back

Rather than looping back indefinitively (and keeping track of it to avoid duplicate paths), I should probably try to build all possible paths

I will basically build a function that takes a string as input and return a list of (a: string, b: string) where a is a possibility pulled and b the "rest" of the input

```swift
extension String {
    func possibilities(from possiblities: [String]) -> [(String, String)] {
        var result: [(String, String)] = []
        
        for possiblitiy in possiblities {
            if self.prefix(possiblitiy.count) == possiblitiy {
                result.append((possiblitiy, String(self.suffix(self.count - possiblitiy.count))))
            }
        }
        
        return result
    }
}
```

Let's build a structure that can holds it's children possibilities with their rest

```swift
class Node {
    var possibilities: [String]
    var values: [String]
    var rest: String
    var children: [Node]
    
    init(possibilities: [String], values: [String], rest: String) {
        self.possibilities = possibilities
        self.values = values
        self.rest = rest
        self.children = []
    }
    
    func buildChildren() {
        children = []
        
        for possibility in rest.possibilities(from: possibilities) {
            let child = Node(possibilities: possibilities, values: values + [possibility.0], rest: possibility.1)
            children.append(child)
        }
        
        for child in children {
            child.buildChildren()
        }
    }
}
```

Now we should be close to the end: we need to write a function that search for a given node if there is a path where the rest is empty (we only need one possibility)

```swift
extension Node {
    func findPath() -> [String]? {
        if rest.isEmpty {
            return values
        }
        
        if !children.isEmpty {
            for child in children {
                if let path = child.findPath() {
                    return path
                }
            }
        }
        
        return nil
    }
}
```

## Test

```swift
Ok, let's put this all together:
 
We create an node with an empty string as initial value, we set its possibilities

class Problem_22Tests: XCTestCase {
    
    func testExample() {
        let root = Node(possibilities: ["quick", "brown", "the", "fox"], values: [], rest: "thequickbrownfox")
        root.buildChildren()
        
        XCTAssert(root.findPath()! == ["the", "quick", "brown", "fox"])
    }
    
    func testExample2() {
        let root = Node(possibilities: ["bed", "bath", "bedbath", "and", "beyond"], values: [], rest: "bedbathandbeyond")
        root.buildChildren()
        
        XCTAssert((root.findPath()! == ["bed", "bath", "and", "beyond"]) || (root.findPath()! == ["bedbath", "and", "beyond"]))
    }

}
```