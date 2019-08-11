//
//  Solution.swift
//  Problem 78
//
//  Created by sebastien FOCK CHOW THO on 2019-08-11.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

/**
 
    To create a singly linked list structure, I'll start with a node that keeps a reference to its next element
 
    The singly linked list will hold a reference of its root
 
 */
class Node<T> {
    var value: T
    var next: Node?
    
    init(value: T, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}

class SortedLinkedList<T> where T: Comparable {
    
    var root: Node<T>?
    
    init(root: Node<T>?) {
        self.root = root
    }
    
    func insert(node: Node<T>) {
        if var current = root {
            while current.next != nil {
                // Sorted singly linked list: we're adding the node between a smaller and greater value
                if current.value <= node.value && current.next!.value >= node.value {
                    let next = current.next!
                    current.next = node
                    node.next = next
                    return
                }
                
                current = current.next!
            }
            
            current.next = node
        } else {
            root = node
        }
    }
    
    func merge(list: SortedLinkedList<T>) {
        guard var targetCurrent = list.root else {
            return
        }
        
        if var current = root {
            while current.next != nil {
                if current.value <= targetCurrent.value && current.next!.value >= targetCurrent.value {
                    let next = current.next!
                    let copy = targetCurrent
                    
                    // If that's the last node, then we're done
                    if copy.next == nil {
                        copy.next = next
                        current.next = copy
                        return
                    }
                    
                    // Otherwise, we swap the target with its next element and update the main list
                    targetCurrent = targetCurrent.next!
                    copy.next = next
                    current.next = copy
                    current = copy
                }
                
                current = current.next!
            }
        } else {
            root = targetCurrent
        }
        
    }
    
    // In a real situation, conforming to CustomStringConvertible would be idea
    func toString() -> String {
        var result = ""
        
        if var current = root {
            result.append("(\(current.value))")
            
            while current.next != nil {
                current = current.next!
                result.append("->(\(current.value))")
            }
        } else {
            result = "Empty list"
        }
        
        return result
    }
}
