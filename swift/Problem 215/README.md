## Description

This problem was asked by Yelp.

The horizontal distance of a binary tree node describes how far left or right the node will be when the tree is printed out.

More rigorously, we can define it as follows:

The horizontal distance of the root is 0.
The horizontal distance of a left child is `hd(parent) - 1`.
The horizontal distance of a right child is `hd(parent) + 1`.

For example, for the following tree, `hd(1) = -2`, and `hd(6) = 0`.

```
             5
          /     \
        3         7
      /  \      /   \
    1     4    6     9
   /                /
  0                8
```

The bottom view of a tree, then, consists of the lowest node at each horizontal distance. If there are two nodes at the same depth and horizontal distance, either is acceptable.

For this tree, for example, the bottom view could be `[0, 1, 3, 6, 8, 9]`.

Given the root to a binary tree, return its bottom view.

## Solution

```swift
class Node {
    var value: Int
    var left: Node?
    var right: Node?
    
    init(value: Int) {
        self.value = value
        self.left = nil
        self.right = nil
    }
    
    func bottomViews() -> [Int] {
        
        let candidates = bottomNodes(currentHd: 0)
        let sorted = candidates.sorted{ $0.hd < $1.hd }
        var filtered: [(value: Int, hd: Int)] = []
        
        for element in sorted {
            if !filtered.contains(where: { (item) -> Bool in
                item.hd == element.hd
            }) {
                filtered.append(element)
            }
        }
        
        let mapped = filtered.map{ $0.value }
        
        return mapped
    }
    
    func bottomNodes(currentHd: Int) -> [(value: Int, hd: Int)] {
        
        var result: [(value: Int, hd: Int)] = []
        
        if left == nil && right == nil {
            return [(value: value, hd: currentHd)]
        }
        
        if let left = left {
            result.append(contentsOf: left.bottomNodes(currentHd: currentHd-1))
        }
        
        if let right = right {
            result.append(contentsOf: right.bottomNodes(currentHd: currentHd+1))
        }
        
        if !result.contains(where: { (item) -> Bool in
            item.hd == currentHd
        }) {
            result.append((value: value, hd: currentHd))
        }
        
        return result
    }
}
```

## Test

```swift
class Problem_215Tests: XCTestCase {

    func test_example() {
        let root = Node(value: 5)
        
        let l = Node(value: 3)
        root.left = l
        
        let ll = Node(value: 1)
        l.left = ll
        let llr = Node(value: 4)
        ll.right = llr
        
        let lll = Node(value: 0)
        ll.left = lll
        
        let r = Node(value: 7)
        root.right = r
        
        let rl = Node(value: 6)
        r.left = rl
        
        let rr = Node(value: 9)
        r.right = rr
        
        let rrl = Node(value: 8)
        rr.left = rrl
        
        let actual = root.bottomViews()
        let expected1 = [0, 1, 3, 6, 8, 9]
        let expected2 = [0, 1, 4, 6, 8, 9]
        
        XCTAssert(actual == expected1 || actual == expected2)
    }

}
```