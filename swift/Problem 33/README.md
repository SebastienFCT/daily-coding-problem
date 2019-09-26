## Description

This problem was asked by Microsoft.

Compute the running median of a sequence of numbers. That is, given a stream of numbers, print out the median of the list so far on each new element.

Recall that the median of an even-numbered list is the average of the two middle numbers.

For example, given the sequence `[2, 1, 5, 7, 2, 0, 5]`, your algorithm should print out:

```
2
1.5
2
3.5
2
2
2
```

## Solution

```swift
extension Array where Element == Int {

    func binarySearchInsertIndex(_ element: Int) -> Int {
        var leftBoundary = 0
        var rightBoundary = self.count-1
        
        while leftBoundary <= rightBoundary {
            let mid = (leftBoundary + rightBoundary) / 2
            
            if self[mid] > element {
                rightBoundary = mid - 1
            } else if self[mid] < element {
                leftBoundary = mid + 1
            } else {
                return mid
            }
        }
        
        return leftBoundary
    }
    
    func spawnProgressiveMedians() -> [Double] {
        var result: [Double] = []
        
        var orderedArray: [Int] = []
        
        for element in self {
            orderedArray.insert(element, at: orderedArray.binarySearchInsertIndex(element))
            
            if orderedArray.count % 2 == 0 {
                let median = Double(orderedArray[orderedArray.count/2-1] + orderedArray[orderedArray.count/2]) / 2
                result.append(median)
                print(median)
            } else {
                let median = Double(orderedArray[orderedArray.count/2])
                result.append(median)
                print(median)
            }
        }
        
        return result
    }
}
```

## Tests

```swift
class Problem_33Tests: XCTestCase {

    func testExample() {
        let input = [2, 1, 5, 7, 2, 0, 5]
        print(input.spawnProgressiveMedians())
    }
}
```