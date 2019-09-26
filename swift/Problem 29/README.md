## Description

This problem was asked by Amazon.

Run-length encoding is a fast and simple method of encoding strings. The basic idea is to represent repeated successive characters as a single count and character. For example, the string `AAAABBBCCDAA` would be encoded as `4A3B2C1D2A`.

Implement run-length encoding and decoding. You can assume the string to be encoded have no digits and consists solely of alphabetic characters. You can assume the string to be decoded is valid.

## Solution


```swift
extension String {
    mutating func serialize() -> String {
        var result = ""
        
        var memory: (character: Character, count: Int) = (self.removeFirst(), 1)
        
        while !self.isEmpty {
            let current = self.removeFirst()
            
            if current == memory.character {
                memory.count += 1
            } else {
                result += "\(memory.count)\(memory.character)"
                memory = (current, 1)
            }
        }
        
        result += "\(memory.count)\(memory.character)"
        
        return result
    }
    
    mutating func toInt() -> Int {
        let values: [Character : Int] = [
            "1" : 1,
            "2" : 2,
            "3" : 3,
            "4" : 4,
            "5" : 5,
            "6" : 6,
            "7" : 7,
            "8" : 8,
            "9" : 9,
            "0" : 0
        ]
        
        var result = 0
        
        let array = Array(self)
        let reversed = array.reversed()
        
        var factor = 1
        
        for element in reversed {
            result += factor * (values[element] ?? 0)
            factor += 1
        }
        
        return result
    }
    
    // Updated `deserialize`
    
    mutating func deserialize() -> String {
        let set = CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ")
        var result = ""
        
        var countString = ""
        
        while !self.isEmpty {
            let current = self.removeFirst()
            
            if String(current).rangeOfCharacter(from: set) != nil {
                result.append(String(repeating: current, count: countString.toInt()))
                countString = ""
            } else {
                countString += String(current)
            }
        }
        
        return result
    }
}
```

## Tests

```swift
class Problem_29Tests: XCTestCase {

    func test_example() {
        var input = "AAAABBBCCDAA"
        var serialized = input.serialize()
        
        XCTAssert(serialized == "4A3B2C1D2A")
        XCTAssert(serialized.deserialize() == "AAAABBBCCDAA")
    }

}
```