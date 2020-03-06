## Description

This problem was asked by VMware.

The skyline of a city is composed of several buildings of various widths and heights, possibly overlapping one another when viewed from a distance. We can represent the buildings using an array of (left, right, height) tuples, which tell us where on an imaginary x-axis a building begins and ends, and how tall it is. The skyline itself can be described by a list of (x, height) tuples, giving the locations at which the height visible to a distant observer changes, and each new height.

Given an array of buildings as described above, create a function that returns the skyline.

For example, suppose the input consists of the buildings `[(0, 15, 3), (4, 11, 5), (19, 23, 4)]`. In aggregate, these buildings would create a skyline that looks like the one below.

```
     ______  
    |      |        ___
 ___|      |___    |   | 
|   |   B  |   |   | C |
| A |      | A |   |   |
|   |      |   |   |   |
------------------------
```

As a result, your function should return `[(0, 3), (4, 5), (11, 3), (15, 0), (19, 4), (23, 0)]`.

## Solution

```swift
typealias Building = (left: Int, right: Int, height: Int)
typealias Skyline = (location: Int, height: Int)

struct City {
    
    var buildings: [Building]
    
    func skyline() -> [Skyline] {
        
        var result: [Skyline] = []
        
        guard buildings.count > 0 else {
            return result
        }
        
        let min = buildings.map{ $0.left }.sorted{ $0 < $1 }.first!
        let max = buildings.map{ $0.right }.sorted{ $0 > $1 }.first!
        
        var heights: [Int] = []
        
        for i in min...max {
            
            let filtered = buildings.filter{ $0.left <= i && $0.right >= i }
            let sorted = filtered.sorted{ $0.height > $1.height }
            
            heights.append(sorted.first?.height ?? 0)
        }
        
        var currentSkyline = (0, heights.first!)
        
        result.append(currentSkyline)
        
        for i in 1..<heights.count {
            if heights[i] != currentSkyline.1 {
                
                if heights[i] < currentSkyline.1 {
                    currentSkyline = (i-1, heights[i])
                } else {
                    currentSkyline = (i, heights[i])
                }
                
                result.append(currentSkyline)
            }
        }
        
        result.append((heights.count-1, 0))
        
        return result
    }
    
}
```

## Tests

```swift
class Problem_286Tests: XCTestCase {

    func test_example() {
        
        let input = City(buildings: [(0, 15, 3), (4, 11, 5), (19, 23, 4)])
        
        let actual = input.skyline()
        let expected = [(0, 3), (4, 5), (11, 3), (15, 0), (19, 4), (23, 0)]
        
        print(actual)
        
        for i in 0..<actual.count {
            XCTAssert(actual.map{ ($0.location, $0.height) }[i] == expected[i])
        }
        
    }

}
```