## Description

This problem was asked by IBM.

Given a string with repeated characters, rearrange the string so that no two adjacent characters are the same. If this is not possible, return `None`.

For example, given "aaabbc", you could return "ababac". Given "aaab", return `None`.

## Solution

```swift
extension String {
    
    func rearrangeWithoutAdjacentDuplicates() -> Any {
        
        let arrayOfCharacters = Array(self)
        let distribution = arrayOfCharacters.repartition()
        
        do {
            let result = try distribution.distributeWithoutAdjacentDuplicates()
            
            return String(result)
        } catch {
            return false
        }
    }
}

extension Array where Element == Character {
    
    func repartition() -> [Character: Int] {
        
        var result: [Character: Int] = [:]
        
        for character in self {
            if result.keys.contains(character) {
                result[character]! += 1
            } else {
                result[character] = 1
            }
        }
        
        return result
    }
}

enum CustomError: Swift.Error {
    case InvalidInput
}

extension Dictionary where Key == Character, Value == Int {
    
    func distributeWithoutAdjacentDuplicates() throws -> [Character] {
        
        var result: [Character] = []
        var repartition = self
        
        while !repartition.isEmpty {
            
            let sorted = repartition.sorted{ $0.value > $1.value }
            let sortedkeys = sorted.map{ $0.key }
            
            if result.isEmpty || sortedkeys.first! != result.last! {
                let current = sortedkeys.first!
                result.append(current)
                
                if repartition[current]! > 1 {
                    repartition[current]! -= 1
                } else {
                    repartition.removeValue(forKey: current)
                }
            } else {
                if sortedkeys.count == 1 {
                    throw CustomError.InvalidInput
                } else {
                    let current = sortedkeys[1]
                    result.append(current)
                    
                    if repartition[current]! > 1 {
                        repartition[current]! -= 1
                    } else {
                        repartition.removeValue(forKey: current)
                    }
                }
            }
            
        }
        
        return result
    }
}
```

## Tests

```swift
class Problem_231Tests: XCTestCase {

    func test_example_1() {
        
        let input = "aaabbc"
        let expected = ["ababca", "ababac", "abacba", "abacab"]
        
        if let output = input.rearrangeWithoutAdjacentDuplicates() as? String {
            print(output)
            XCTAssert(expected.contains(output))
        } else {
            XCTFail("output wasn't a string")
        }
    }
    
    func test_example_2() {
        
        let input = "aaab"
        
        if let output = input.rearrangeWithoutAdjacentDuplicates() as? Bool {
            XCTAssertFalse(output)
        } else {
            XCTFail("output wasn't False")
        }
    }

}
```