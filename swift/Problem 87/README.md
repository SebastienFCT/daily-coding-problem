## Description

This problem was asked by Uber.

A rule looks like this:

```
A NE B
```

This means this means point A is located northeast of point B.

```
A SW C
```

means that point A is southwest of C.

Given a list of rules, check if the sum of the rules validate. For example:

```
A N B
B NE C
C N A
```

does not validate, since A cannot be both north and south of C.

```
A NW B
A N B
```

is considered valid.

## Solution

```swift
enum PosOrientation: String {
    case N = "N"
    case NE = "NE"
    case E = "E"
    case SE = "SE"
    case S = "S"
    case SW = "SW"
    case W = "W"
    case NW = "NW"
    
    static func type(fromString: String) -> PosOrientation {
        switch fromString {
        case "N": return .N
        case "NE": return .NE
        case "E": return .E
        case "SE": return .SE
        case "S": return .S
        case "SW": return .SW
        case "W": return .W
        default: return .NW // We're skipping validation...
        }
    }
    
    func reverse() -> PosOrientation {
        switch self {
        case .N: return .S
        case .NE: return .SW
        case .E: return .W
        case .SE: return .NW
        case .S: return .N
        case .SW: return .NE
        case .W: return .E
        case .NW: return .SE
        }
    }
}

struct UberChallenge {
    var allPos: [Pos] = []
    
    mutating func addRule(rule: String) -> Bool {
        
        // First we add the new rule. This is tedious but not complicated... We just need to make sure to properly create convenient methods for adding elements
        let splitted = rule.split(separator: " ")
        
        guard splitted.count == 3 else {
            fatalError("Rules format are [element] [orientation] [element]")
        }
        
        let left = String(splitted[0])
        let orientation = PosOrientation.type(fromString: String(splitted[1]))
        let right = String(splitted[2])
        
        var leftAdded = false
        var rightAdded = false
        
        for pos in allPos {
            if pos.value == left {
                leftAdded = true
                if !pos.add(right, toType:  orientation) {
                    return false
                }
            }
            
            if pos.value == right {
                rightAdded = true
                if !pos.add(left, toType: orientation.reverse()) {
                    return false
                }
            }
        }
        
        if !leftAdded {
            switch orientation {
            case .N:
                allPos.append(Pos(value: left, north: [Pos(value: right)], south: [], east: [], west: []))
            case .NE:
                allPos.append(Pos(value: left, north: [Pos(value: right)], south: [], east: [Pos(value: right)], west: []))
            case .E:
                allPos.append(Pos(value: left, north: [], south: [], east: [Pos(value: right)], west: []))
            case .SE:
                allPos.append(Pos(value: left, north: [], south: [Pos(value: right)], east: [Pos(value: right)], west: []))
            case .S:
                allPos.append(Pos(value: left, north: [], south: [Pos(value: right)], east: [], west: []))
            case .SW:
                allPos.append(Pos(value: left, north: [], south: [Pos(value: right)], east: [], west: [Pos(value: right)]))
            case .W:
                allPos.append(Pos(value: left, north: [], south: [], east: [], west: [Pos(value: right)]))
            case .NW:
                allPos.append(Pos(value: left, north: [Pos(value: right)], south: [], east: [], west: [Pos(value: right)]))
            }
        }
        
        if !rightAdded {
            switch orientation {
            case .N:
                allPos.append(Pos(value: right, north: [], south: [Pos(value: left)], east: [], west: []))
            case .NE:
                allPos.append(Pos(value: right, north: [], south: [Pos(value: left)], east: [], west: [Pos(value: left)]))
            case .E:
                allPos.append(Pos(value: right, north: [], south: [], east: [], west: [Pos(value: left)]))
            case .SE:
                allPos.append(Pos(value: right, north: [Pos(value: left)], south: [], east: [], west: [Pos(value: left)]))
            case .S:
                allPos.append(Pos(value: right, north: [Pos(value: left)], south: [], east: [], west: []))
            case .SW:
                allPos.append(Pos(value: right, north: [Pos(value: left)], south: [], east: [Pos(value: left)], west: []))
            case .W:
                allPos.append(Pos(value: right, north: [], south: [], east: [Pos(value: left)], west: []))
            case .NW:
                allPos.append(Pos(value: right, north: [], south: [Pos(value: left)], east: [Pos(value: left)], west: []))
            }
        }
        
        // This second part is for handling chains. If you're adding the rule A N C and you have a rule B N A, then you should add B N C
        // Focus on this example while reading the following
        
        for pos in allPos {
            if right == pos.value {
                for element in pos.targets(forOrientation: orientation) {
                    if !element.add(right, toType: orientation) {
                        return false
                    }
                }
            }
            
            if left == pos.value {
                for element in pos.targets(forOrientation: orientation) {
                    if !element.add(left, toType: orientation.reverse()) {
                        return false
                    }
                }
            }
        }
        
        return true
    }
}

// A Pos holds references to other values in each direction

class Pos {
    var value: String
    var north: [Pos]
    var south: [Pos]
    var east: [Pos]
    var west: [Pos]
    
    // Useful for troubleshooting through logs
    
    func toString() -> String {
        return "value: \(value)\nnorth: \(north)\nease: \(east)\nsouth: \(south)\nwest:\(west)"
    }
    
    func targets(forOrientation: PosOrientation) -> [Pos] {
        switch forOrientation {
        case .N:
            return north
        case .NE:
            return north + east
        case .E:
            return east
        case .SE:
            return south + east
        case .S:
            return south
        case .SW:
            return south + west
        case .W:
            return west
        case .NW:
            return north + west
        }
    }
    
    init(value: String) {
        self.value = value
        self.north = []
        self.south = []
        self.east = []
        self.west = []
    }
    
    init(value: String, north: [Pos], south: [Pos], east: [Pos], west: [Pos]) {
        self.value = value
        self.north = north
        self.south = south
        self.east = east
        self.west = west
    }
    
    func add(_ posValue: String, toType type: PosOrientation) -> Bool {
        switch type {
        case .N:
            guard !existInSouth(posValue) else {
                return false
            }
            addToNorth(posValue)
        case .S:
            guard !existInNorth(posValue) else {
                return false
            }
            addToSouth(posValue)
        case .E:
            guard !existInWest(posValue) else {
                return false
            }
            addToEast(posValue)
        case .W:
            guard !existInEast(posValue) else {
                return false
            }
            addToWest(posValue)
        case .NE:
            guard !existInSouth(posValue), !existInWest(posValue) else {
                return false
            }
            addToNorth(posValue)
            addToEast(posValue)
        case .NW:
            guard !existInSouth(posValue), !existInEast(posValue) else {
                return false
            }
            addToNorth(posValue)
            addToWest(posValue)
        case .SE:
            guard !existInNorth(posValue), !existInWest(posValue) else {
                return false
            }
            addToSouth(posValue)
            addToEast(posValue)
        case .SW:
            guard !existInNorth(posValue), !existInEast(posValue) else {
                return false
            }
            addToSouth(posValue)
            addToWest(posValue)
        }
        
        return true
    }
}

// These are all the convenient methods

extension Pos {
    
    private func existInNorth(_ posValue: String) -> Bool {
        for pos in north {
            if pos.value == posValue {
                return true
            }
        }
        
        return false
    }
    
    private func addToNorth(_ posValue: String) {
        for pos in north {
            if pos.value == posValue {
                return
            }
        }
        
        north.append(Pos(value: posValue))
    }
    
    private func existInSouth(_ posValue: String) -> Bool {
        for pos in south {
            if pos.value == posValue {
                return true
            }
        }
        
        return false
    }
    
    private func addToSouth(_ posValue: String) {
        for pos in south {
            if pos.value == posValue {
                return
            }
        }
        
        south.append(Pos(value: posValue))
    }
    
    private func existInEast(_ posValue: String) -> Bool {
        for pos in east {
            if pos.value == posValue {
                return true
            }
        }
        
        return false
    }
    
    private func addToEast(_ posValue: String) {
        for pos in east {
            if pos.value == posValue {
                return
            }
        }
        
        east.append(Pos(value: posValue))
    }
    
    private func existInWest(_ posValue: String) -> Bool {
        for pos in west {
            if pos.value == posValue {
                return true
            }
        }
        
        return false
    }
    
    private func addToWest(_ posValue: String) {
        for pos in west {
            if pos.value == posValue {
                return
            }
        }
        
        west.append(Pos(value: posValue))
    }
}
```

## Test

```swift
class Problem_87Tests: XCTestCase {

    func test_example() {
        var ds = UberChallenge(allPos: [])
        print(ds.addRule(rule: "A N B"))
        print(ds.addRule(rule: "B NE C"))
        print(ds.addRule(rule: "C N A"))
    }

}
```