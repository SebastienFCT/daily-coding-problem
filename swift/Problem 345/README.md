## Description

This problem was asked by Google.

You are given a set of synonyms, such as `(big, large)` and `(eat, consume)`. Using this set, determine if two sentences with the same number of words are equivalent.

For example, the following two sentences are equivalent:

- "He wants to eat food."
- "He wants to consume food."

Note that the synonyms `(a, b)` and `(a, c)` do not necessarily imply `(b, c)`: consider the case of `(coach, bus)` and `(coach, teacher)`.

Follow-up: what if we can assume that `(a, b)` and `(a, c)` do in fact imply `(b, c)`?

## Solution

```swift
typealias Synonym = (String, String)

func areTheSame(left: String, right: String, synonyms: [Synonym], connectSynonyms: Bool) -> Bool {
    
    let leftWords = left.trimmingCharacters(in: CharacterSet.punctuationCharacters).split(separator: " ")
    let rightWords = right.trimmingCharacters(in: CharacterSet.punctuationCharacters).split(separator: " ")
    
    guard leftWords.count == rightWords.count else {
        return false
    }
    
    for i in 0..<leftWords.count {
        
        if leftWords[i] == rightWords[i] { continue }
    
        if !connectSynonyms {
            guard synonyms.contains(where: { (element) -> Bool in
                (element.0 == leftWords[i] && element.1 == rightWords[i]) || (element.1 == leftWords[i] && element.0 == rightWords[i])
            }) else {
                return false
            }
        } else {
            guard areSynonyms(left: String(leftWords[i]), right: String(rightWords[i]), withConnectedSynonyms: synonyms, seen: []) else {
                return false
            }
        }
    }
    
    return true
}

func areSynonyms(left: String, right: String, withConnectedSynonyms synonyms: [Synonym], seen: [String]) -> Bool {
    
    var candidates: [String] = []
    
    if synonyms.contains(where: { (element) -> Bool in
        (element.0 == left && element.1 == right) || (element.1 == left && element.0 == right)
    }) {
        return true
    }
    
    var newSeens = seen
    
    for synonym in synonyms {
        if (synonym.0 == left && synonym.1 == right) || (synonym.1 == left && synonym.0 == right) {
            return true
        }
        
        if synonym.0 == left && !seen.contains(where: { (item) -> Bool in
            item == synonym.1
        }) {
            newSeens.append(synonym.1)
            candidates.append(synonym.1)
        }
        
        if synonym.1 == left && !seen.contains(where: { (item) -> Bool in
            item == synonym.0
        }) {
            newSeens.append(synonym.0)
            candidates.append(synonym.0)
        }
    }
    
    for candidate in candidates {
        
        if areSynonyms(left: candidate, right: right, withConnectedSynonyms: synonyms, seen: newSeens) {
            return true
        }
    }
    
    return false
}
```

## Tests

```swift
class Problem_345Tests: XCTestCase {

    func test_example() {
        
        let synonyms: [Synonym] = [
            ("eat", "consume"),
            ("consume", "absorb")
        ]
        
        XCTAssertTrue(areTheSame(left: "He wants to eat food.", right: "He wants to consume food.", synonyms: synonyms, connectSynonyms: false))
        
        XCTAssertFalse(areTheSame(left: "He wants to eat food.", right: "He wants to absorb food.", synonyms: synonyms, connectSynonyms: false))
        XCTAssertTrue(areTheSame(left: "He wants to eat food.", right: "He wants to absorb food.", synonyms: synonyms, connectSynonyms: true))
    }

}
```