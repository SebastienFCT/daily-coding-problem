//
//  Solution.swift
//  Problem 67
//
//  Created by sebastien FOCK CHOW THO on 2019-07-31.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

/**
 
    I already worked on this problem in the past, the trick is to build a "linkedList" structure base on a node element that links to the previous and next element
 
    When we look for something, we check the cache first:
 
    - If it's in the cache, we remove it and re-add it (which put it back to the last used spot)
    - If it's not in the cache, we add it
        - Adding an element to the cache should make sure to remove the last element if required (if the cache max size has been reached)
 
    The Node class isn't really hard to implement:
 
 */
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
/**
 
    Finally, we also need to update the cache if we're retrieving an element that already exist in it
 
 */
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
