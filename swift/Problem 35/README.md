## Description

This problem was asked by Google.

Given an array of strictly the characters `R`, `G`, and `B`, segregate the values of the array so that all the Rs come first, the Gs come second, and the Bs come last. You can only swap elements of the array.

Do this in linear time and in-place.

For example, given the array `['G', 'B', 'R', 'R', 'B', 'R', 'G']`, it should become `['R', 'R', 'R', 'G', 'G', 'B', 'B']`.

## Solution

```swift
extension Array where Element == Character {
    
    mutating func RGB() -> [Character] {
        var leftIndex = 0
        var rightIndex = self.count-1
        
        for i in 0..<self.count {
            if i > rightIndex {
                break
            }
            
            let element = self[i]
            
            switch element {
            case "R":
                self[i] = Character("\(self[leftIndex])")
                self[leftIndex] = "R"
                leftIndex += 1
            case "B":
                self[i] = Character("\(self[leftIndex])")
                self[rightIndex] = "B"
                rightIndex -= 1
            default:
                break
            }
        }
        
        return self
    }
}
```

## Tests

```swift
class Problem_35Tests: XCTestCase {

    func testExample() {
        var input: [Character] =  ["G", "B", "R", "R", "B", "R", "G"]
        _ = input.RGB()
        XCTAssert(input == ["R", "R", "G", "G", "G", "B", "B"])
    }

}
```