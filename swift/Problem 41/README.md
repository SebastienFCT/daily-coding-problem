## Description

This problem was asked by Facebook.

Given an unordered list of flights taken by someone, each represented as (origin, destination) pairs, and a starting airport, compute the person's itinerary. If no such itinerary exists, return null. If there are multiple possible itineraries, return the lexicographically smallest one. All flights must be used in the itinerary.

For example, given the list of flights `[('SFO', 'HKO'), ('YYZ', 'SFO'), ('YUL', 'YYZ'), ('HKO', 'ORD')]` and starting airport `YUL`, you should return the list `['YUL', 'YYZ', 'SFO', 'HKO', 'ORD']`.

Given the list of flights `[('SFO', 'COM'), ('COM', 'YYZ')]` and starting airport `COM`, you should return null.

Given the list of flights `[('A', 'B'), ('A', 'C'), ('B', 'C'), ('C', 'A')]` and starting airport `A`, you should return the list `['A', 'B', 'C', 'A', 'C']` even though `['A', 'C', 'A', 'B', 'C']` is also a valid itinerary. However, the first one is lexicographically smaller.

## Solution

```swift
class Itinerary {
    var value: String
    var destinations: [Itinerary]
    var isFinalDestination: Bool
    var finalArrival: String?

    init(value: String, destinations: [Itinerary], isFinalDestination: Bool = false, finalArrival: String? = nil) {
        self.value = value
        self.destinations = destinations
        self.isFinalDestination = isFinalDestination
        self.finalArrival = finalArrival
    }
    
    func buildFullPath(roots: [[String]] = []) -> [[String]] {
        var result: [[String]] = []
        
        if roots.isEmpty {
            result.append([value])
        } else {
            for root in roots {
                if let finalArrival = finalArrival {
                    result.append(root + [value, finalArrival])
                } else {
                    result.append(root + [value])
                }
            }
        }
        
        if isFinalDestination {
            return result
        }
        
        var newResult: [[String]] = []
        
        for destination in destinations {
            let next = destination.buildFullPath(roots: result)
            
            if !next.isEmpty {
                for element in next {
                    newResult.append(element)
                }
            }
        }
        
        return newResult
    }

}

extension Array where Element == (depart: String, arrival: String) {
    
    func buildItineraries(start: String) -> [Itinerary] {
        var result: [Itinerary] = []
        let didReachfinalDestination = self.count == 1
        
        let possibilities = getPossibilities(element: start)
        for possibility in possibilities {
            let itinerary = Itinerary(value: possibility.choice.depart, destinations: possibility.diff.buildItineraries(start: possibility.choice.arrival))
            itinerary.isFinalDestination = didReachfinalDestination
            if didReachfinalDestination {
                itinerary.finalArrival = possibility.choice.arrival
            }
            result.append(itinerary)
        }
        
        return result
    }
    
    func getPossibilities(element: String) -> [(choice: (depart: String, arrival: String), diff: [(depart: String, arrival: String)])] {
        
        var possibilities: [(choice: (depart: String, arrival: String), diff: [(depart: String, arrival: String)])] = []
        
        for i in 0..<self.count {
            let item = self[i]
            
            if item.depart == element {
                var copy = self
                copy.remove(at: i)
                
                possibilities.append((item, copy))
            }
        }
        
        return possibilities
    }
}

extension Array where Element == Array<String> {
    func lexicographicallySmallestPath() -> [String]? {
        if self.isEmpty {
            return nil
        }
        
        var flattened: [String] = []
        
        for element in self {
            flattened.append(element.joined(separator: ""))
        }
        
        var index = 0
        var value = flattened.first!
        
        for i in 0..<flattened.count {
            let item = flattened[i]
            
            if item < value {
                value = item
                index = i
            }
        }
        
        return self[index]
    }
}
```

## Tests

```swift
class Problem_41Tests: XCTestCase {

    func test_1() {
        let input: [(depart: String, arrival: String)] =  [("SFO", "HKO"), ("YYZ", "SFO"), ("YUL", "YYZ"), ("HKO", "ORD")]
        let itineraries = input.buildItineraries(start: "YUL")
        
        var result: [[String]] = []
        
        for itinerary in itineraries {
            result += itinerary.buildFullPath()
        }
        
        XCTAssert(result.lexicographicallySmallestPath()! == ["YUL", "YYZ", "SFO", "HKO", "ORD"])
    }
    
    func test_2() {
        let input: [(depart: String, arrival: String)] = [("SFO", "COM"), ("COM", "YYZ")]
        let itineraries = input.buildItineraries(start: "COM")
        
        var result: [[String]] = []
        
        for itinerary in itineraries {
            result += itinerary.buildFullPath()
        }
        
        XCTAssert(result.lexicographicallySmallestPath() == nil)
    }
    
    func test_3() {
        let input: [(depart: String, arrival: String)] = [("A", "B"), ("A", "C"), ("B", "C"), ("C", "A")]
        let itineraries = input.buildItineraries(start: "A")
        
        var result: [[String]] = []
        
        for itinerary in itineraries {
            result += itinerary.buildFullPath()
        }
        
        XCTAssert(result.lexicographicallySmallestPath()! == ["A", "B", "C", "A", "C"])
    }

}
```
