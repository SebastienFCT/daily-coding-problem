## Description

Given array of integers, there is any combination of N elements which sum return K

## Solution

```swift
class Branch {
    var value: Int
    var maxLevel: Int
    var level: Int
    var rest: [Int]
    var branches: [Branch]
    
    init(value: Int, maxLevel: Int, level: Int, rest: [Int]) {
        self.value = value
        self.maxLevel = maxLevel
        self.level = level
        self.rest = rest
        self.branches = []
    }
}

extension Branch {
    func growBranches() {
        // If we reached the last level, we stop
        if level == maxLevel {
            return
        }
        
        // If there isn't enough element just stop
        if rest.count < maxLevel - level {
            return
        }
        
        branches = []
        
        for i in 0...(rest.count - maxLevel + level) {
            let branch = Branch(value: (value - rest[i]), maxLevel: maxLevel, level: level+1, rest: rest.enumerated().filter{ $0.offset != i }.map{ $0.element })
            branches.append(branch)
        }
        
        for branch in branches {
            branch.growBranches()
        }
    }
}

extension Branch {
    func anyPathForValue() -> Bool {
        let newValue = value - self.value
        
        if level == maxLevel && newValue > 0 {
            return false
        }
        
        if level == maxLevel && newValue == 0 {
            return true
        }
        
        for branch in branches {
            if branch.anyPathForValue() {
                return true
            }
        }
        
        return false
    }
}
```

## Tests

```swift
class Problem_1bTests: XCTestCase {

    func testGeneric() {
        let trunk = Branch(value: 17, maxLevel: 2, level: 0, rest: [10, 15, 3, 7])
        trunk.growBranches()
        
        XCTAssert(trunk.anyPathForValue())
    }
    
    func testGeneric2() {
        let trunk = Branch(value: 100, maxLevel: 5, level: 0, rest: [10, 6, 12, 890, 10, 10, 20, 5, 10, 90, 12, 22, 9, 10])
        trunk.growBranches()
        
        XCTAssert(trunk.anyPathForValue())
    }

}
```