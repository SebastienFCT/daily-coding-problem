## Description

This problem was asked by Yelp.

Given a mapping of digits to letters (as in a phone number), and a digit string, return all possible letters the number could represent. You can assume each valid number in the mapping is a single digit.

For example if `{"2": ["a", "b", "c"], 3: ["d", "e", "f"], …}` then `23` should return `["ad", "ae", "af", "bd", "be", "bf", "cd", "ce", "cf"]`.

## Solution

We can alias a dictionary of characters and array of character and it will represent our maps
 
I will simply create a function that expects a current result and a string to decode and will render the possibilities when decoding the next character

Calling recursively will do the job

```swift
typealias YelpMapping = [Character : [Character]]

struct YelpDecoder {
    var map: YelpMapping
    
    func decode(message: String) -> [String] {
        return next(current: "", rest: message)
    }
    
    func next(current: String, rest: String) -> [String] {
        var candidates: [String] = []
        
        var copy = rest
        
        guard let nextChar = copy.first else {
            return []
        }
        
        copy.removeFirst()
        
        if copy.isEmpty {
            if let mapped = map[nextChar] {
                for character in mapped {
                    candidates.append("\(current)\(character)")
                }
            }
        } else {
            if let mapped = map[nextChar] {
                for character in mapped {
                    candidates.append(contentsOf: next(current: "\(current)\(character)", rest: copy))
                }
            }
        }
        
        
        return candidates
    }
}
```

## Test

```swift
class Problem_81Tests: XCTestCase {

    func test_example() {
        let map: YelpMapping = [
            "2":["a", "b", "c"],
            "3":["d", "e", "f"],
            "4":["h", "i", "j"],
            "5":["k", "l", "m"],
            "6":["n", "o", "p"],
            "7":["q", "r", "s"],
            "8":["t", "u", "v"],
            "9":["w", "x", "y"],
            "0":["z"]
        ]
        
        let decoder = YelpDecoder(map: map)
        XCTAssert(decoder.decode(message: "23") == ["ad", "ae", "af", "bd", "be", "bf", "cd", "ce", "cf"])
    }

}
```