## Description

This problem was asked by YouTube.

Write a program that computes the length of the longest common subsequence of three given strings. For example, given "epidemiologist", "refrigeration", and "supercalifragilisticexpialodocious", it should return `5`, since the longest common subsequence is "eieio".

## Solution

```swift
extension Array where Element == String {
    
    func longestCommonSubsequence() -> String {
        
        let candidates = nextCommon(current: "")
        let sorted = candidates.sorted{ $0.commonChars.count > $1.commonChars.count }
        
        return sorted.first?.commonChars ?? ""
    }
    
    func cleanNonCommon() -> [String] {
        
        var result: [String] = []
        
        for i in 0..<count {
            let word = self[i]
            var newWord = ""
            
            for character in word {
                for j in 0..<count {
                    if j != i && self[j].contains(character) {
                        newWord += "\(character)"
                        break
                    }
                }
            }
            
            result.append(newWord)
        }
        
        return result
    }
    
    func nextCommon(current: String) -> [(commonChars: String, rest: [String])] {
        
        var candidates: [(commonChars: String, rest: [String])] = []
        
        let first = self[0]
        
        for i in 0..<first.count {
            let character = first[i]
            let commonChars = "\(current)\(character)"
            var rest: [String] = []
            rest.append(first[(i+1)...].string)
            
            for j in 1..<count {
                let other = self[j]
                if !other.contains(character) {
                    break
                } else {
                    for k in 0..<other.count {
                        if other[k] == character {
                            rest.append(other[(k+1)...].string)
                            break
                        }
                    }
                }
                
                candidates.append(contentsOf: rest.nextCommon(current: commonChars))
            }
        }
        
        if candidates.isEmpty {
            return [(current, [])]
        }
        
        return candidates
    }
}

extension StringProtocol {
    subscript(_ offset: Int)                     -> Element     { self[index(startIndex, offsetBy: offset)] }
    subscript(_ range: Range<Int>)               -> SubSequence { prefix(range.lowerBound+range.count).suffix(range.count) }
    subscript(_ range: ClosedRange<Int>)         -> SubSequence { prefix(range.lowerBound+range.count).suffix(range.count) }
    subscript(_ range: PartialRangeThrough<Int>) -> SubSequence { prefix(range.upperBound.advanced(by: 1)) }
    subscript(_ range: PartialRangeUpTo<Int>)    -> SubSequence { prefix(range.upperBound) }
    subscript(_ range: PartialRangeFrom<Int>)    -> SubSequence { suffix(Swift.max(0, count-range.lowerBound)) }
}

extension LosslessStringConvertible {
    var string: String { .init(self) }
}

extension BidirectionalCollection {
    subscript(safe offset: Int) -> Element? {
        guard !isEmpty, let i = index(startIndex, offsetBy: offset, limitedBy: index(before: endIndex)) else { return nil }
        return self[i]
    }
}

```

## Test

```swift
class Problem_209Tests: XCTestCase {

    func test_example() {
        XCTAssert(["epidemiologist", "refrigeration", "supercalifragilisticexpialodocious"].longestCommonSubsequence() == "eieio")
    }

}
```