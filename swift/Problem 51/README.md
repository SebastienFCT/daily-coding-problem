## Description

This problem was asked by Facebook.

Given a function that generates perfectly random numbers between `1` and `k` (inclusive), where `k` is an input, write a function that shuffles a deck of cards represented as an array using only swaps.

It should run in `O(N)` time.

Hint: Make sure each one of the 52! permutations of the deck is equally likely.

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

struct LRU {
    var maxSize: Int
    var cache: [String : Node]
    var root: Node?
    
    mutating func set(key: String, node: Node) {
        if cache.keys.contains(node.value) {
            // The key exists, we just need to clear the linked list
            remove(node: node)
            add(node: node)
            return
        }
        
        if cache.count >= maxSize {
            removeLast()
            add(node: node)
            return
        }
        
        add(node: node)
        return
    }
    
    mutating func removeLast() {
        guard let root = root, let previous = root.previous else {
            return
        }
        
        remove(node: previous)
    }
    
    mutating func add(node: Node) {
        if let root = root {
            if let last = root.previous {
                last.next = node
                root.previous = node
                
                node.previous = last
                node.next = root
            }
        }
        
        if cache.keys.contains(node.key) {
            return
        }
        
        cache[node.key] = node
    }
    
    mutating func remove(node: Node) {
        if cache.keys.contains(node.key) {
            cache.removeValue(forKey: node.key)
        }
        
        let previous = node.previous
        let next = node.next
        
        previous?.next = next
        next?.previous = previous
    }
    
    mutating func get(key: String) -> Node? {
        
        if cache.keys.contains(key) {
            // we also need to refresh the linked list as getting the key refreshes the element
            guard let node = cache[key] else {
                fatalError("couldn't find node in cache")
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
class Problem_51Tests: XCTestCase {

    func test_shuffling() {
        var deck: [Int] = []
        for i in 1...52 {
            deck.append(i)
        }
        
        deck.shuffleDeck()
        print(deck)
    }

}
```