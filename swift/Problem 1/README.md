## Description

This problem was recently asked by Google.

Given a list of numbers and a number `k`, return whether any two numbers from the list add up to `k`.

For example, given `[10, 15, 3, 7]` and `k` of `17`, return true since `10 + 7` is `17`.

Bonus: Can you do this in one pass?

## Solution

Since we're only looking for a pair, the simplest way to implement this to me is to loop through the elements and progressively add them to a set.
 
For each element, we check if (expected value) - element = (any value in my set)

```swift
extension Array where Element == Int {
    func hasPairForSum(sum k: Int) -> Bool {
        
        var set: Set<Int> = Set()
        
        for element in self {
            if set.contains(where: { (value) -> Bool in
                k - element == value
            }) {
                return true
            }
            
            set.insert(element)
        }
        
        return false
    }
}
```
 
Now let's say that the requirements change. We want to be able to determine if for a given array of integers, there is any combination of N elements which sum return K

Since we're doing a sum, the order doesn't really matters, so we're going to build all the possible combinations as we're drawing our elements

Imagine that you have the input [0, 1, 2, 3] and you're looking for a combination of 3 elements, the possibilities are:

- [0, 1, 2]
- [0, 1, 3]
- [0, 2, 3]
- [1, 2, 3]

Another way to visualize it is to imagine trees:

```
- 0
  | - 1
      | - 2
      | - 3
  | - 2
      | - 3
- 1
  | - 2
      | - 3
```

Since the order doesn't matter, we can build the branches of a tree based on the "rest" of the sub-array (the initial array minus all elements before the current node element). We also stop the process when there is n = k-1 elements in the array

Let's build a branch structure that can hold other branches:

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
```
 
Now we need a function that build children branches. Basically we need to tell a branch:

"grow more branches up to level X"

Let's build a trunk structure that can tell the branches "how far" they can extend
EDIT: I realized that a trunk is actually just a branch (with the exception that it was holding a "maxValue") so I decided to refactor my code

```swift 
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
```

Now we need to build a function that determine if any of the last branches (and their extension) in the tree correspond to our expected sum

```swift
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

Here we decided the build the "Tree" and then check reduce its branches to the sum, we could instead build the branches progressively and stop as soon as we get a valid result (since we're not expecting all the results)

## Tests

```swift
class Problem_1Tests: XCTestCase {

    func testExample() {
        let input = [10, 15, 3, 7]
        
        XCTAssertTrue(input.hasPairForSum(sum: 17))
    }

    func testFailure() {
        let input = [1, 2, 3, 4]
        
        XCTAssertFalse(input.hasPairForSum(sum: 100))
    }
    
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