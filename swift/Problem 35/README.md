## Description

This problem was asked by Google.

Given an array of strictly the characters `R`, `G`, and `B`, segregate the values of the array so that all the Rs come first, the Gs come second, and the Bs come last. You can only swap elements of the array.

Do this in linear time and in-place.

For example, given the array `['G', 'B', 'R', 'R', 'B', 'R', 'G']`, it should become `['R', 'R', 'R', 'G', 'G', 'B', 'B']`.

## Solution

From a randomly distributed array of character 'R', 'G' and 'B', we want to get an ordered array with all the 'Rs' first, then the 'Gs' and finally the 'Bs'
 
The challenge here is that we cannot simply loop through the array and build a new one. Instead we're supposed to swap elements and do it in one pass.

If you think about it, technically we only need to move Rs and Bs: let's say that we start with ['G','R', 'B', 'G'], as we're looping through the elements, we ignores Gs, if we find an R we store it at the begining of the array (swapping it with whatever is at the begining) and if we find a G we swap it with the last element

One thing that comes into mind is that we need somehow to track how many elements have been swapped already, otherwise we would be stuck swapping Rs with the first R and Bs with the last Bs after the first swap of each side.

So our algo needs the following informations:

- Loop through the array
- If you are a G, continue
- If you are a R, swap with the last "un-swapped" element of the left side
- If you are a B, swap with the last "un-swapped" element of the right side

OR

- Store a variable `lastLeftIndex` = 0, and a variable `lastRightIndex` = array lenght - 1
- Loop through the array
- If you are a G, continue
- If you are a R, swap with element at index `lastLeftIndex`, increment `lastLeftIndex`
- If you are a B, swap with element at index `lastRightIndex`, decrement `lastRightIndex`

I thing we have most of the logic, let's try it.

```swift
extension Array where Element == Character {

    mutating func RGB() -> [Character] {
        var leftIndex = 0
        var rightIndex = self.count-1

        for i in 0..<self.count {
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

There is an issue with this algo:
 
Once we reach the end of the array, we're swapping Bs with previous elements. To prevent this, we should make sure that the current index is lower that the right index (the logic is that if you have reach an element that is > that the right index then it's already a correctly placed element)

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