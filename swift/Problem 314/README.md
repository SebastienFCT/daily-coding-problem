## Description

This problem was asked by Spotify.

You are the technical director of WSPT radio, serving listeners nationwide. For simplicity's sake we can consider each listener to live along a horizontal line stretching from `0` (west) to `1000` (east).

Given a list of `N` listeners, and a list of `M` radio towers, each placed at various locations along this line, determine what the minimum broadcast range would have to be in order for each listener's home to be covered.

For example, suppose listeners = `[1, 5, 11, 20]`, and towers = `[4, 8, 15]`. In this case the minimum range would be `5`, since that would be required for the tower at position `15` to reach the listener at position `20`.

## Solution

```swift
struct Radio {
    
    var listeners: [Int]
    var towers: [Int]
    
    
    func minimumBoradcast() -> Int {
        
        var distances: [Int] = []
        
        for listener in listeners {
            
            var minDistance: Int? = nil
            
            for tower in towers {
                
                if minDistance == nil || abs(tower-listener) < minDistance! {
                    minDistance = abs(tower-listener)
                }
            }
                
            distances.append(minDistance!)
        }
        
        let sorted = distances.sorted{ $0 > $1 }
        
        return sorted.first!
    }
}
```

## Tests

```swift
class Problem_314Tests: XCTestCase {

    func test_example() {
        
        let input = Radio(listeners: [1, 5, 11, 20], towers: [4, 8, 15])
        
        print(input.minimumBoradcast())
    }

}
```