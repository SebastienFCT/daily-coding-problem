## Description

This problem was asked by Google.

The edit distance between two strings refers to the minimum number of character `insertions`, `deletions`, and `substitutions` required to change one string to the other. For example, the edit distance between `kitten` and `sitting` is `three`: substitute the `k` for `s`, substitute the `e` for `i`, and append a `g`.

Given two strings, compute the edit distance between them.

## Solution


```swift
extension String {
    func closestSubString(toExpectedOutput output: String) -> (result: String, startingAtIndex: Int, withEditDist: Int) {
        guard self.count >= output.count else {
            fatalError("self must be > than the input")
        }
        
        var result = ("", 0, Int.max)
        
        for i in 0..<(self.count - output.count + 1) {
            let start = self.index(self.startIndex, offsetBy: i)
            let end = self.index(self.endIndex, offsetBy: -(self.count-output.count-i))
            let range = start..<end
            
            let subSelf = self[range]
            let subSelfEditDist = String(subSelf).differencesWith(output)
            
            if subSelfEditDist < result.2 {
                result = (String(subSelf), i, subSelfEditDist)
            }
        }
        
        return result
    }
    
    func differencesWith(_ value: String) -> Int {
        var result = 0
        for i in 0..<self.count {
            if self[self.index(self.startIndex, offsetBy: i)] != value[value.index(value.startIndex, offsetBy: i)] {
                result += 1
            }
        }
        
        return result
    }
    
    func editDistance(toOutput output: String) -> Int {
        
        if self.count < output.count {
            return output.editDistance(toOutput: self)
        }
        
        if self.count > output.count {
            let closest = closestSubString(toExpectedOutput: output)
            
            return closest.withEditDist + (self.count - closest.result.count)
        }
        
        var result = 0
        
        for i in 0..<self.count {
            if self[self.index(self.startIndex, offsetBy: i)] != output[output.index(output.startIndex, offsetBy: i)] {
                result += 1
            }
        }
        
        return result
    }
}
```

## Tests

```swift
class Problem_31Tests: XCTestCase {

    func test_1() {
        let input = "hello world"
        print(input.closestSubString(toExpectedOutput: "ld"))
    }
    
    func test_2() {
        let input = "kitten"
        print(input.editDistance(toOutput: "sitting"))
    }
}
```