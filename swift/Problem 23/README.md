## Description

This problem was asked by Google.

You are given an `M` by `N` matrix consisting of booleans that represents a board. Each `True` boolean represents a wall. Each `False` boolean represents a tile you can walk on.

Given this matrix, a start coordinate, and an end coordinate, return the minimum number of steps required to reach the end coordinate from the start. If there is no possible path, then return null. You can move up, left, down, and right. You cannot move through walls. You cannot wrap around the edges of the board.

For example, given the following board:

```
[[f, f, f, f],
[t, t, f, t],
[f, f, f, f],
[f, f, f, f]]
```

and `start = (3, 0)` (bottom left) and `end = (0, 0)` (top left), the minimum number of steps required to reach the end is `7`, since we would need to go through `(1, 2)` because there is a wall everywhere else on the second row.

## Solution

```swift
extension Array where Element == Array<Bool> {
    func nextStep(position: (Int, Int), goal: (Int, Int)) -> (Int, Int)? {
        
        var nextStep = (0, 0)
        
        let yDif = abs(position.0 - goal.0)
        let xDif = abs(position.1 - goal.1)
        
        if xDif == 0 && yDif == 0 {
            return nil
        }
        
        if xDif == 0 {
            if position.0 < goal.0 {
                nextStep.0 = position.0 + 1
                nextStep.1 = position.1
            } else {
                nextStep.0 = position.0 - 1
                nextStep.1 = position.1
            }
            
            return nextStep
        }
        
        if yDif == 0 {
            if position.1 < goal.1 {
                nextStep.1 = position.1 + 1
                nextStep.0 = position.0
            } else {
                nextStep.1 = position.1 - 1
                nextStep.0 = position.0
            }
            
            return nextStep
        }
        
        if yDif < xDif {
            if position.0 < goal.0 {
                nextStep.0 = position.0 + 1
                nextStep.1 = position.1
            } else {
                nextStep.0 = position.0 - 1
                nextStep.1 = position.1
            }
        } else {
            if position.1 < goal.1 {
                nextStep.1 = position.1 + 1
                nextStep.0 = position.0
            } else {
                nextStep.1 = position.1 - 1
                nextStep.0 = position.0
            }
        }
        
        return nextStep
    }
}

class Path {
    var map: [[Bool]]
    var currentPosition: (Int, Int)
    var goal: (Int, Int)
    var visited: [(Int, Int)]
    
    init(map: [[Bool]], currentPosition: (Int, Int), goal: (Int, Int), visited: [(Int, Int)]) {
        self.map = map
        self.currentPosition = currentPosition
        self.goal = goal
        self.visited = visited
    }
    
    func buildPaths() -> [[(Int, Int)]] {
        var result: [[(Int, Int)]] = []
        
        if currentPosition == goal {
            // We arrived!
            result.append(visited)
            return result
        }
        
        let top = (currentPosition.0 - 1, currentPosition.1)
        let bottom = (currentPosition.0 + 1, currentPosition.1)
        let left = (currentPosition.0, currentPosition.1 - 1)
        let right = (currentPosition.0, currentPosition.1 + 1)
        
        let possiblePaths = [top, bottom, left, right].filter{ $0.0 >= 0 && $0.0 <= map.count-1 && $0.1 >= 0 && $0.1 <= map[0].count-1 }    // Here we assume each row of the map are equal
        
        for possiblePath in possiblePaths {
            if map[possiblePath.0][possiblePath.1] == true {
                // This is a wall
                continue
            }
            
            if visited.contains(where: { (x, y) -> Bool in
                return x == possiblePath.0 && y == possiblePath.1
            }) {
                // We already visited this position
                continue
            }
            
            let path = Path(map: self.map, currentPosition: possiblePath, goal: self.goal, visited: self.visited + [possiblePath])
            result += path.buildPaths()
        }
        
        return result
    }
    
    func findOptimalPath() -> [(Int, Int)]? {
        return buildPaths().sorted{ $0.count < $1.count }.first
    }
    
    func findOptimalPathLength() -> Int? {
        let sorted = buildPaths().sorted{ $0.count < $1.count }
        if let result = sorted.first {
            return result.count - 1 // The initial position isn't considered a "step", however I still like being able to track the whole "path"
        } else {
            return nil
        }
    }
}
```

## Tests

```swift
class Problem_23Tests: XCTestCase {

    func testNextStep() {
        let input = [
              [true, true, true]
            , [true, true, true]
            , [true, true, true]
        ]
        
        var start = (2, 0)
        let end = (0, 2)
        
        while start != end {
            if let nextStep = input.nextStep(position: start, goal: end) {
                start = nextStep
                print("next step is : \(nextStep)")
            } else {
                return
            }
        }
    }
    
    func testPathBuilder() {
        let map = [
              [false, false, false]
            , [false, true, false]
            , [false, false, false]
        ]
        
        let currentPosition = (2, 0)
        let goal = (0, 2)
        
        let start = Path(map: map, currentPosition: currentPosition, goal: goal, visited: [currentPosition])
        let expectedSolution1 = [(2, 0), (1, 0), (0, 0), (0, 1), (0, 2)]
        let expectedSolution2 = [(2, 0), (2, 1), (2, 2), (1, 2), (0, 2)]
        
        if let optimalPath = start.findOptimalPath() {
            let condition1 = (optimalPath.map{ $0.0 } == expectedSolution1.map{ $0.0 }) && (optimalPath.map{ $0.1 } == expectedSolution1.map{ $0.1 })
            let condition2 = (optimalPath.map{ $0.0 } == expectedSolution2.map{ $0.0 }) && (optimalPath.map{ $0.1 } == expectedSolution2.map{ $0.1 })
            
            XCTAssert(condition1 || condition2, "Optimal path(s) didn't meet expectations")
        } else {
            XCTFail("No optimal path found")
        }
    }
    
    func testExample() {
        let map = [
              [false, false, false, false]
            , [true, true, false, true]
            , [false, false, false, false]
            , [false, false, false, false]
        ]
        
        let currentPosition = (3, 0)
        let goal = (0, 0)
        
        let start = Path(map: map, currentPosition: currentPosition, goal: goal, visited: [currentPosition])
        XCTAssert(start.findOptimalPathLength()! == 7)
    }

}
```