//
//  Solution.swift
//  Problem 26
//
//  Created by sebastien FOCK CHOW THO on 2019-06-22.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

/**
 
    There are two things to do here:
 
    - Design a Node class that can hold a reference to another node
    - Add a method to this class that remove its kth element, we will get back to this
 
 */
//class Node {
//    var node: Node?
//
//    init() {
//        self.node = nil
//    }
//}
/**
 
    To remove the kth element, we will loop through the children nodes until we reached the (k-1)th
 
    We will update the child node reference of (k-1).Node from k.Node to (k+1).Node
 
    We will then remove the k.Node
 
    If our structure is A -> B -> C -> D,
    We're trying to delete node at index k = 2
    Then we must loop up to 1 (index 1), update the reference and delete the old reference
 
    While building the function, there an obvious edge case: when k is greater than the length of the linked list. This should never happened as per the instruciton but the optionals of Swift help us easily handling the case
 
 */
extension Node {
    
    func removeElementAt(_ index: Int) {
        var currentNode = self
        
        for _ in 0...index-2 {
            if let child = currentNode.node {
                currentNode = child
            } else {
                fatalError("index cannot be greater than the length of your list")
            }
        }
        
        guard let childNode = currentNode.node else  {
            fatalError("index cannot be greater than the length of your list")
        }
        
        if let grandChildNode = childNode.node {
            // if k < list length
            currentNode.node = grandChildNode
        } else {
            // if k == list length
            currentNode.node = nil
        }
    }
}
/**
 
    Let's add a property to each node to easily identify them and create a function that finds the kth node
 
 */
class Node {
    var value: String
    var node: Node?
    
    init(value: String) {
        self.value = value
        self.node = nil
    }
    
    init(value: String, node: Node?) {
        self.value = value
        self.node = node
    }
    
    func getElementAt(_ index: Int) -> Node {
        var currentNode = self
        
        for _ in 0...index-1 {
            if let child = currentNode.node {
                currentNode = child
            } else {
                fatalError("index cannot be greater than the length of your list")
            }
        }
        
        return currentNode
    }
}
