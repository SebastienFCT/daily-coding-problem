//
//  Solution.swift
//  Problem 365
//
//  Created by sebastien FOCK CHOW THO on 2020-05-24.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation


class Node<T> {
    var value: T
    var previous: Node?
    var next: Node?
    
    init(value: T) {
        self.value = value
        self.previous = nil
        self.next = nil
    }
}

struct Quack<T: Equatable> {
    var root: Node<T>?
    var queue: Node<T>?
    
    mutating func push(value: T) {
        
        if queue == nil {
            if root == nil {
                root = Node(value: value)
                queue = nil
            } else {
                queue = Node(value: value)
                
                root?.next = queue
                root?.previous = queue
                
                queue?.next = root
                queue?.previous = root
            }
        } else {
            if queue!.previous?.value != root?.value {
                let prev = queue!.previous!
                
                let node = Node(value: value)
                prev.next = node
                
                node.previous = prev
                node.next = queue
                
                queue?.previous = node
            } else {
                
                let node = Node(value: value)
                node.previous = root
                node.next = queue
                
                root?.next = node
                queue?.previous = node
            }
        }
    }
    
    mutating func pop() -> Node<T>? {
        
        guard root != nil else {
            return nil
        }
        
        if queue != nil {
            let next = root!.next
            next?.previous = queue!
            
            let tmp = root
            root = next
            
            return tmp
        } else {
            let tmp = root
            root = nil
            
            return tmp
        }
    }
    
    mutating func pull() -> Node<T>? {
        
        guard queue != nil else {
            return nil
        }
        
        if root != nil {
            let previous = queue!.previous
            previous?.next = root
            
            let tmp = queue
            queue = previous
            
            return tmp
        } else {
            let tmp = queue
            queue = nil
            
            return tmp
        }
    }
}
