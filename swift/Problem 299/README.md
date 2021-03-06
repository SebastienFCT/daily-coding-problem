## Description

This problem was asked by Samsung.

A group of houses is connected to the main water plant by means of a set of pipes. A house can either be connected by a set of pipes extending directly to the plant, or indirectly by a pipe to a nearby house which is otherwise connected.

For example, here is a possible configuration, where `A`, `B`, and `C` are houses, and arrows represent pipes:

```
A <--> B <--> C <--> plant
```

Each pipe has an associated cost, which the utility company would like to minimize. Given an undirected graph of pipe connections, return the lowest cost configuration of pipes such that each house has access to water.

In the following setup, for example, we can remove all but the pipes from plant to `A`, plant to `B`, and `B` to `C`, for a total cost of `16`.

```
pipes = {
    'plant': {'A': 1, 'B': 5, 'C': 20},
    'A': {'C': 15},
    'B': {'C': 10},
    'C': {}
}
```

## Solution

```swift
struct Hydro {
    
    var map: [(location: String, connections: [(location: String, cost: Int)])]
    
    func optimize() -> Int? {
        
        let candidates = optimize(currentLocations: ["plant"], currentCost: 0, remainingConnection: map)
        
        let sorted = candidates.sorted{ $0 < $1 }
        
        return sorted.first
    }
    
    private func optimize(currentLocations: [String], currentCost: Int, remainingConnection: [(location: String, connections: [(location: String, cost: Int)])]) -> [Int] {
        
        if remainingConnection.isEmpty {
            return [currentCost]
        }
        
        var allCosts: [Int] = []
        
        for i in 0..<remainingConnection.count {
            
            let next = remainingConnection[i]
            
            print("----------")
            print("currentLocations: \(currentLocations)")
            print("currentCost: \(currentCost)")
            print("next is \(next)")
            
            if !currentLocations.contains(next.location) {
                print("pass 1")
                continue
            }
            
            for j in 0..<next.connections.count {
                
                let candidate = next.connections[j]
                
                if currentLocations.contains(candidate.location) {
                    print("pass 2")
                    continue
                }
                
                var copy = remainingConnection
                var childCopy = next
                let removed = childCopy.connections.remove(at: j)
                
                var copyLocations = currentLocations
                copyLocations.append(removed.location)
                
                var copyCost = currentCost
                copyCost += removed.cost
                
                if childCopy.connections.isEmpty {
                    copy.remove(at: i)
                } else {
                    copy[i] = childCopy
                }
                
                allCosts.append(contentsOf: optimize(currentLocations: copyLocations, currentCost: copyCost, remainingConnection: copy))
            }
        }
        
        let filtered = allLocations.filter{ !currentLocations.contains($0) }
        if filtered.isEmpty {
            return [currentCost]
        }
        
        return allCosts
    }
    
    var allLocations: Set<String> {
        
        var set: Set<String> = Set()
        
        for location in map {
            
            if !set.contains(location.location) {
                set.insert(location.location)
            }
            
            for destination in location.connections {
                if !set.contains(destination.location) {
                    set.insert(destination.location)
                }
            }
        }
        
        return set
    }
}
```

## Tests

```swift
class Problem_299Tests: XCTestCase {

    func test_example() {
        
        let map = [
            ("plant", [("a", 1), ("b", 5), ("c", 20)]),
            ("a", [("c", 15)]),
            ("b", [("c", 10)]),
            ("c", []),
        ]
        
        let input = Hydro(map: map)
        let actual = input.optimize()
        
        XCTAssert(actual == 16)
    }

}
```