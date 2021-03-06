## Description

This problem was asked by Amazon.

Given a N by M matrix of numbers, print out the matrix in a clockwise spiral.

For example, given the following matrix:

```
[[1,  2,  3,  4,  5],
 [6,  7,  8,  9,  10],
 [11, 12, 13, 14, 15],
 [16, 17, 18, 19, 20]]
```

You should print out the following:

```
1
2
3
4
5
10
15
20
19
18
17
16
11
6
7
8
9
14
13
12
```

## Solution

```swift
extension Array where Element == Array<Int> {
    enum MatrixEdge {
        case top
        case right
        case bottom
        case left
        
        func next() -> MatrixEdge {
            switch self {
            case .top:
                return .right
            case .right:
                return .bottom
            case .bottom:
                return .left
            case .left:
                return .top
            }
        }
    }
    
    mutating func clockWiseList() -> [Int] {
        var result: [Int] = []
        var edge: MatrixEdge = .top
        
        while !self.isEmpty {
            switch edge {
            case .top:
                result.append(contentsOf: self.removeFirst())
            case .right:
                for i in 0..<self.count {
                    result.append(self[i].removeLast())
                }
            case .bottom:
                result.append(contentsOf: self.removeLast().reversed())
            case .left:
                for i in 0..<self.count {
                    result.append(self[self.count-1-i].removeFirst())
                }
            }
            
            edge = edge.next()
        }
        
        return result
    }
}
```

## Test

```swift
class Problem_65Tests: XCTestCase {

    func test_example() {
        var input = [
            [1,  2,  3,  4,  5],
            [6,  7,  8,  9,  10],
            [11, 12, 13, 14, 15],
            [16, 17, 18, 19, 20]
        ]
        
        XCTAssert(input.clockWiseList() == [1,2,3,4,5,10,15,20,19,18,17,16,11,6,7,8,9,14,13,12])
    }

}
```