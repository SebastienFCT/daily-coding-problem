## Description

This problem was asked by Dropbox.

Given a list of words, determine whether the words can be chained to form a circle. A word X can be placed in front of another word Y in a circle if the last character of X is same as the first character of Y.

For example, the words `['chair', 'height', 'racket', touch', 'tunic']` can form the following circle: `chair --> racket --> touch --> height --> tunic --> chair`.

## Solution

```swift
extension Array where Element == String {
    
    func canCircle() -> Bool {
        
        guard count > 0 else {
            return true
        }
        
        guard count > 1 else {
            let first = self.first!
            
            return first.suffix(1) == first.prefix(1)
        }
        
        var copy = self
        let current = copy.remove(at: 0)
        
        return copy.canCircle(current: current, target: current)
    }
    
    func canCircle(current: String, target: String) -> Bool {
        
        if count == 1 {
            return self[0].suffix(1) == target.prefix(1)
        }
        
        for i in 0..<count {
            
            var copy = self
            
            if copy[i].prefix(1) == current.suffix(1) {
                let newCurrent = copy.remove(at: i)
                
                if (copy.canCircle(current: newCurrent, target: target)) {
                    return true
                }
            }
        }
        
        return false
    }
}
```

## Tests

```swift
class Problem_246Tests: XCTestCase {

    func test_example() {
        let input = ["chair", "height", "racket", "touch", "tunic"]
        
        XCTAssertTrue(input.canCircle())
    }

}
```