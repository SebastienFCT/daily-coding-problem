## Description

This problem was asked by Spotify.

There are `N` couples sitting in a row of length `2 * N`. They are currently ordered randomly, but would like to rearrange themselves so that each couple's partners can sit side by side.

What is the minimum number of swaps necessary for this to happen?

## Solution

```swift
struct Couples {
    
    var people: [Int]
    
    func rearrange() -> (count: Int, result: [Int]) {
        
        var copy = people
        var current: Int? = nil
        var totalSwap = 0
        
        var i = 0
        
        while i < copy.count-1 {
            if current == nil {
                current = copy[i]
            }
            
            for j in i+1..<copy.count {
                if copy[j] == copy[i] {
                    if j == i+1 {
                        
                        i += 2
                        current = nil
                        
                        break
                    } else {
                        let tmp = copy[i+1]
                        copy[i+1] = current!
                        copy[j] = tmp
                        
                        totalSwap += 1
                        i += 2
                        current = nil
                        
                        break
                    }
                }
            }
        }
        
        return (totalSwap, copy)
    }
}
```

## Tests

```swift
class Problem_240Tests: XCTestCase {

    func test_rearranging_couples() {
        
        var people = [1,1,2,2,3,3,4,4,5,5,6,6,7,7,8,8,9,9,10,10,11,11,12,12,13,13,14,14,15,15,16,16,17,17,18,18,19,19,20,20]
        people.shuffle()
        
        print(people)
        
        let couples = Couples(people: people)
        
        print(couples.rearrange())
    }

}
```