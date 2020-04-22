## Description

This problem was asked by Pinterest.

At a party, there is a single person who everyone knows, but who does not know anyone in return (the "celebrity"). To help figure out who this is, you have access to an O(1) method called knows(a, b), which returns True if person a knows person b, else False.

Given a list of N people and the above operation, find a way to identify the celebrity in O(N) time.

## Solution

```swift
struct Party {
    
    var relation: [String : [String]]
    
    private func knows(a: String, b: String) -> Bool {
        
        return relation[a]?.contains(b) ?? false
    }
    
    func findCelebrity() -> String? {
        
        var startIndex = 0
        var endIndex = relation.count-1
        
        let people: [String] = Array(relation.keys)
        
        while startIndex != endIndex {
            if knows(a: people[startIndex], b: people[endIndex]) {
                startIndex += 1
            } else {
                endIndex -= 1
            }
        }
        
        return people[startIndex]
    }
    
}
```

## Tests

```swift
class Problem_333Tests: XCTestCase {

    func test_find_celebrity() {
        
        let input = Party(relation: [
            "seb": ["john", "jane"],
            "john": ["jane"],
            "jane": []
        ])
        
        let actual = input.findCelebrity()
        let expected = "jane"
        
        XCTAssert(actual == expected)
    }

}
```