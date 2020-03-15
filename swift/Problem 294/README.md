## Description

This problem was asked by Square.

A competitive runner would like to create a route that starts and ends at his house, with the condition that the route goes entirely uphill at first, and then entirely downhill.

Given a dictionary of places of the form {location: elevation}, and a dictionary mapping paths between some of these locations to their corresponding distances, find the length of the shortest route satisfying the condition above. Assume the runner's home is location 0.

For example, suppose you are given the following input:

```
elevations = {0: 5, 1: 25, 2: 15, 3: 20, 4: 10}
paths = {
    (0, 1): 10,
    (0, 2): 8,
    (0, 3): 15,
    (1, 3): 12,
    (2, 4): 10,
    (3, 4): 5,
    (3, 0): 17,
    (4, 0): 10
}
```

In this case, the shortest valid path would be `0 -> 2 -> 4 -> 0`, with a distance of `28`.

## Solution

```swift
struct Runner {
    
    var elevations: [Int : Int]
    var paths: [(itinerary: (from: Int, to: Int), distance: Int)]
    
    func shortestPathAscendingAndThenDescending() ->  (locations: [Int], distance: Int)? {
        
        let candidates = allPaths(currentLocations: ([0], 0), ascending: true)
        let sorted = candidates.sorted{ $0.distance < $1.distance }
        
        return sorted.first
    }
    
    private func allPaths(currentLocations: (locations: [Int], distance: Int), ascending: Bool = true) -> [(locations: [Int], distance: Int)] {
        
        var result: [(locations: [Int], distance: Int)] = []
        
        var current = currentLocations
        
        // End condition
        
        if current.locations.count > 1 && current.locations.last! == 0 {
            return [currentLocations]
        }
        
        if current.locations.last == nil {
            current.locations.append(0)
            current.distance = 0
        }
        
        let currentLocation = current.locations.last!

        
        for path in paths {
            guard elevations.keys.contains(path.itinerary.from) else {
                fatalError("elevations are missing location \(path.itinerary.from)")
            }
            
            guard elevations.keys.contains(path.itinerary.to) else {
                fatalError("elevations are missing location \(path.itinerary.to)")
            }
            
            if path.itinerary.from == currentLocation {
                if elevations[path.itinerary.to]! > elevations[path.itinerary.from]! {
                    
                    if !ascending {
                        continue
                    }
                    
                    var copy = current
                    copy.locations.append(path.itinerary.to)
                    copy.distance += path.distance
                    
                    result.append(contentsOf: allPaths(currentLocations: copy, ascending: true))
                } else {
                    
                    var copy = current
                    copy.locations.append(path.itinerary.to)
                    copy.distance += path.distance
                    
                    result.append(contentsOf: allPaths(currentLocations: copy, ascending: false))
                }
            }
        }
        
        return result
    }
}
```

## Tests

```swift
class Problem_294Tests: XCTestCase {

    func test_example() {
        
        let elevations: [Int: Int] = [
            0: 5,
            1: 25,
            2: 15,
            3: 20,
            4: 10
        ]
        
        let paths: [(itinerary: (from: Int, to: Int), distance: Int)] = [
            (itinerary: (from: 0, to: 1), distance: 10),
            (itinerary: (from: 0, to: 2), distance: 8),
            (itinerary: (from: 0, to: 3), distance: 15),
            (itinerary: (from: 1, to: 3), distance: 12),
            (itinerary: (from: 2, to: 4), distance: 10),
            (itinerary: (from: 3, to: 4), distance: 5),
            (itinerary: (from: 3, to: 0), distance: 17),
            (itinerary: (from: 4, to: 0), distance: 10),
        ]
        
        let input = Runner(elevations: elevations, paths: paths)
        
        let actual = input.shortestPathAscendingAndThenDescending()
        
        XCTAssert(actual?.locations == [0, 2, 4, 0])
        XCTAssert(actual?.distance == 28)
        
    }

}
```