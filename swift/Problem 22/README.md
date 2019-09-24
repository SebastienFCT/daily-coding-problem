## Description

This problem was asked by Microsoft.

Given a dictionary of words and a string made up of those words (no spaces), return the original sentence in a list. If there is more than one possible reconstruction, return any of them. If there is no possible reconstruction, then return null.

For example, given the set of words `quick`, `brown`, `the`, `fox`, and the string `thequickbrownfox`, you should return `['the', 'quick', 'brown', 'fox']`.

Given the set of words `bed`, `bath`, `bedbath`, `and`, `beyond`, and the string `bedbathandbeyond`, return either `['bed', 'bath', 'and', 'beyond]` or `['bedbath', 'and', 'beyond']`.

## Solution

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