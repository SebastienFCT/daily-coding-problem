## Description

This problem was asked by Google.

Implement locking in a binary tree. A binary tree node can be locked or unlocked only if all of its descendants or ancestors are not locked.

Design a binary tree node class with the following methods:

- `is_locked`, which returns whether the node is locked
- `lock`, which attempts to lock the node. If it cannot be locked, then it should return false. Otherwise, it should lock it and return true.
- `unlock`, which unlocks the node. If it cannot be unlocked, then it should return false. Otherwise, it should unlock it and return true.

You may augment the node to add parent pointers or any other property you would like. You may assume the class is used in a single-threaded program, so there is no need for actual locks or mutexes. Each method should run in O(h), where h is the height of the tree.

## Solution

```swift
class Node {
    var parent: Node?
    var left: Node?
    var right: Node?
    var is_locked: Bool = false
    
    init(parent: Node?) {
        self.parent = parent
        self.left = nil
        self.right = nil
    }
    
    func isLoackableOrUnloackable() -> Bool {
        if anyParentLocked() {
            return false
        }
        
        if anyChildLocked() {
            return false
        }
        
        return true
    }
    
    func anyParentLocked() -> Bool {
        if let parent = parent {
            if parent.is_locked || parent.anyParentLocked() {
                return true
            }
        }
        
        return false
    }
    
    func anyChildLocked() -> Bool {
        if let left = left {
            if left.is_locked || left.anyChildLocked() {
                return true
            }
        }
        
        if let right = right {
            if right.is_locked || right.anyChildLocked() {
                return true
            }
        }
        
        return false
    }
    
    func lock() -> Bool {
        if isLoackableOrUnloackable() {
            is_locked = true
            return true
        }
        
        return false
    }
    
    func unlock() -> Bool {
        if isLoackableOrUnloackable() {
            is_locked = false
            return true
        }
        
        return false
    }
}

```

## Tests

```swift
class Problem_24Tests: XCTestCase {

    func testExample() {
        let root = Node(parent: nil)
        let left = Node(parent: root)
        let right = Node(parent: root)
        let leftleft = Node(parent: left)
        let leftleftleft = Node(parent: leftleft)
        
        root.left = left
        left.left = leftleft
        root.right = right
        leftleft.left = leftleftleft
        
        // I should be able to lock the root since nothing is locked yet
        XCTAssertTrue(root.lock())
        
        // Leftleft should not be lockable since the root is locked
        XCTAssertFalse(leftleft.lock())
        
        // Unlock root & Lock left
        _ = root.unlock()
        _ = left.lock()
        
        // Right should be lockable since no child nor parent are locked
        XCTAssertTrue(right.lock())
        
    }

}
```