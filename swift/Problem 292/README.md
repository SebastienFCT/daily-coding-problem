## Description

This problem was asked by Twitter.

A teacher must divide a class of students into two teams to play dodgeball. Unfortunately, not all the kids get along, and several refuse to be put on the same team as that of their enemies.

Given an adjacency list of students and their enemies, write an algorithm that finds a satisfactory pair of teams, or returns False if none exists.

For example, given the following enemy graph you should return the teams `{0, 1, 4, 5}` and `{2, 3}`.

```
students = {
    0: [3],
    1: [2],
    2: [1, 4],
    3: [0, 4, 5],
    4: [2, 3],
    5: [3]
}
```

On the other hand, given the input below, you should return False.

```
students = {
    0: [3],
    1: [2],
    2: [1, 3, 4],
    3: [0, 2, 4, 5],
    4: [2, 3],
    5: [3]
}
```

## Solution

```swift
struct Class {
    
    var students: [(key: Int, value: [Int])]
    
    func divide(currentLeft: [Int]? = nil, currentRight: [Int]? = nil, studentLeft: [(key: Int, value: [Int])]? = nil) -> (left: [Int], right: [Int])? {
        
        if let studentLeft = studentLeft,  studentLeft.isEmpty {
            return (left: currentLeft!, right: currentRight!)
        }
        
        let leftStudent = studentLeft ?? students
        var sortedLeftStudent = leftStudent.sorted{ $0.value.count > $1.value.count }
        var left = currentLeft ?? []
        var right = currentRight ?? []
        
        let pair = sortedLeftStudent.removeFirst()
        
        if !left.contains(pair.key) {
            
            if !right.contains(pair.key) {
                right.append(pair.key)
            }
            
            for ennemy in pair.value {
                if right.contains(ennemy) {
                    return nil
                } else {
                    if !left.contains(ennemy) {
                        left.append(ennemy)
                    }
                }
            }
            
            if let candidate = divide(currentLeft: left, currentRight: right, studentLeft: sortedLeftStudent) {
                return candidate
            }
        }
        
        left = currentLeft ?? []
        right = currentRight ?? []
        
        if !right.contains(pair.key) {
            
            if !left.contains(pair.key) {
                left.append(pair.key)
            }
            
            for ennemy in pair.value {
                if left.contains(ennemy) {
                    return nil
                } else {
                    if !right.contains(ennemy) {
                        right.append(ennemy)
                    }
                }
            }
            
            if let candidate = divide(currentLeft: left, currentRight: right, studentLeft: sortedLeftStudent) {
                return candidate
            }
        }
        
        return nil
    }
}
```

## Tests

```swift
class Problem_292Tests: XCTestCase {

    func test_example() {
        
        let input = Class(students: [
            (key: 0, value: [3]),
            (key: 1, value: [2]),
            (key: 2, value: [1, 4]),
            (key: 3, value: [0, 4, 5]),
            (key: 4, value: [2, 3]),
            (key: 5, value: [3])
        ])
        
        let actual = input.divide()
        print(actual)
    }

}
```