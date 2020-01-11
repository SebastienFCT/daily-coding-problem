## Description

This problem was asked by Google.

Implement an LFU (Least Frequently Used) cache. It should be able to be initialized with a cache size n, and contain the following methods:

- `set(key, value)`: sets `key` to `value`. If there are already n items in the cache and we are adding a new item, then it should also remove the least frequently used item. If there is a tie, then the least recently used key should be removed.
- `get(key)`: gets the value at `key`. If no such key exists, return null.

Each operation should run in O(1) time.

## Solution

```swift
class Node {
    var key: String
    var value: String
    var previous: Node?
    var next: Node?
    
    init(key: String, value: String, previous: Node?, next: Node?) {
        self.key = key
        self.value = value
        self.previous = previous
        self.next = next
    }
}

struct Cache {
    var size: Int
    var existing: [String : Node]
    var leastUsed: Node?
    
    mutating func set(key: String, node: Node) {
        if existing.keys.contains(node.key) {
            remove(node: node)
            add(node: node)
            return
        }
        
        if existing.count >= size {
            removeLast()
            add(node: node)
            return
        }
        
        add(node: node)
        return
    }
    
    mutating func remove(node: Node) {
        if let previous = node.previous, let next = previous.next {
            previous.next = next
            next.previous = previous
            
            existing.removeValue(forKey: node.key)
        }
    }
    
    mutating func add(node: Node) {
        if let first = leastUsed, let last = first.previous {
            last.next = node
            first.previous = node
            
            node.previous = last
            node.next = leastUsed
        } else {
            // First node wasn't set yet
            leastUsed = node
        }
        
        existing[node.key] = node
    }
    
    mutating func removeLast() {
        if let first = leastUsed, let last = first.previous {
            // There are few cases here:
            // - If only 1 element, it gets removed
            if first.key == last.key {
                leastUsed = nil
            }
            // - If two elements, the last one gets removed
            else if last.previous?.key == first.key {
                first.next = nil
                first.previous = nil
            }
            // - Else, usual swapping...
            else {
                guard let beforeLast = last.previous else {
                    fatalError("This should never happen, we just checked for it")
                }
                
                beforeLast.next = first
                first.previous = beforeLast
            }
            
            existing.removeValue(forKey: last.key)
        }
    }
}

extension Cache {
    mutating func get(key: String) -> Node? {
        
        if existing.keys.contains(key) {
            guard let node = existing[key] else {
                fatalError("This should never happen")
            }
            
            remove(node: node)
            add(node: node)
            return node
        }
        
        return nil
    }
}
```

## Test

```swift
class Problem_67Tests: XCTestCase {

    func test_cache() {
        var cache = Cache(size: 3, existing: [:], leastUsed: nil)
        
        XCTAssert(cache.get(key: "first") == nil)
        
        let firstNode = Node(key: "first", value: "first_value", previous: nil, next: nil)
        cache.add(node: firstNode)
        XCTAssert(cache.get(key: "first")!.value == firstNode.value)
        
        let secondNode = Node(key: "second", value: "second_value", previous: nil, next: nil)
        cache.add(node: secondNode)
        XCTAssert(cache.get(key: "second")!.value == secondNode.value)
        
        // Because we just checked the second node, it becomes the more recently used
        XCTAssert(cache.leastUsed!.value == secondNode.value)
        
        // Because we just checked the first node, it becomes the more recently used
        cache.get(key: "first")
        XCTAssert(cache.leastUsed!.value == firstNode.value)
    }

}
```