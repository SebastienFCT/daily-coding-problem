## Description

This problem was asked by Google.

A cryptarithmetic puzzle is a mathematical game where the digits of some numbers are represented by letters. Each letter represents a unique digit.

For example, a puzzle of the form:

```
  SEND
+ MORE
--------
 MONEY
```

may have the solution:

```
{'S': 9, 'E': 5, 'N': 6, 'D': 7, 'M': 1, 'O', 0, 'R': 8, 'Y': 2}
```

Given a three-word puzzle like the one above, create an algorithm that finds a solution.

## Solution

```swift
struct Cryptarithmetic {
    
    func solve3words(word1: String, word2: String, word3: String) -> [Character : Int]? {
        
        let set = [word1, word2, word3].toCharacterSet()
        let array = Array(set)
        
        if array.count > 10 {
            fatalError("too many characters")
        }
        
        let digits = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
        
        for i in 0...9 {
            var copy = digits
            var map: [Int] = []
            
            map.append(copy.remove(at: i))
            
            for j in 0...8 {
                map.append(copy.remove(at: j))
                
                for k in 0...7 {
                    map.append(copy.remove(at: k))
                    
                    for l in 0...6 {
                        map.append(copy.remove(at: l))
                        
                        for m in 0...5 {
                            map.append(copy.remove(at: m))
                            
                            for n in 0...4 {
                                map.append(copy.remove(at: n))
                                
                                for o in 0...3 {
                                    map.append(copy.remove(at: o))
                                    
                                    for p in 0...2 {
                                        map.append(copy.remove(at: p))
                                        
                                        for q in 0...1 {
                                            map.append(copy.remove(at: q))
                                            map.append(copy.remove(at: 0))
                                            
                                            let dictionary = mapsToDictionary(characters: array, digits: map)
                                            if test(dictionary: dictionary, word1: word1, word2: word2, word3: word3) {
                                                return dictionary
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        
        return nil
    }
    
    func mapsToDictionary(characters: [Character], digits: [Int]) -> [Character: Int] {
        var result: [Character : Int] = [:]
        
        for i in 0..<characters.count {
            result[characters[i]] = digits[i]
        }
        
        return result
    }
    
    func test(dictionary: [Character : Int], word1: String, word2: String, word3: String) -> Bool {
        let word1Val = word1.wordToInt(dictionary: dictionary)
        let word2Val = word2.wordToInt(dictionary: dictionary)
        let word3Val = word3.wordToInt(dictionary: dictionary)
        
        return word1Val + word2Val == word3Val
    }
}

extension Array where Element == String {
    
    func toCharacterSet() -> Set<Character> {
        
        var result: Set<Character> = Set()
        
        for word in self {
            for character in word {
                result.insert(character)
            }
        }
        
        return result
    }
}

extension String {
    func wordToInt(dictionary: [Character : Int]) -> Int {
        
        var result = 0
        
        for i in stride(from: count-1, through: 0, by: -1) {
            let character = self[i]
            
            result += (dictionary[character]! * (count - i))
        }
        
        return 0
    }
}
```

## Tests

```swift
class Problem_250Tests: XCTestCase {

    func test_example() {
        
        let module = Cryptarithmetic()
        
        print(module.solve3words(word1: "send", word2: "more", word3: "money"))
    }

}
```