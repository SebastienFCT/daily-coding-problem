## Description

This problem was asked by Spotify.

You have access to ranked lists of songs for various users. Each song is represented as an integer, and more preferred songs appear earlier in each list. For example, the list `[4, 1, 7]` indicates that a user likes song `4` the best, followed by songs `1` and `7`.

Given a set of these ranked lists, interleave them to create a playlist that satisfies everyone's priorities.

For example, suppose your input is `{[1, 7, 3], [2, 1, 6, 7, 9], [3, 9, 5]}`. In this case a satisfactory playlist could be `[2, 1, 6, 7, 3, 9, 5]`.

## Solution

```swift
extension Array where Element == Array<Int> {
    
    func spotifySorting() -> [Int] {
        
        var result: [Int] = []
        
        var copy = self
        
        var stop = false
        
        while !stop {
            
            var next: Int? = nil
            
            for i in 0..<copy.count {
                next = copy[i].first!
                
                for j in 0..<copy.count {
                    if j == i { continue }
                    
                    if copy[j].contains(next!) && copy[j].first != next! {
                        next = nil
                        break
                    }
                }
                
                if next != nil { break }
            }
            
            result.append(next!)
            
            copy = copy.map({ $0.filter{ $0 != next! } })
            copy = copy.filter{ !$0.isEmpty }
            
            next = nil
            
            if copy.isEmpty {
                stop = true
            }
        }
        
        return result
    }
}
```

## Tests

```swift
class Problem_360Tests: XCTestCase {

    func test_example() {
        let input: [[Int]] = [[1, 7, 3], [2, 1, 6, 7, 9], [3, 9, 5]]
        
        let actual = input.spotifySorting()
        let expected = [2, 1, 6, 7, 3, 9, 5]
        
        XCTAssert(expected == actual)
    }

}
```