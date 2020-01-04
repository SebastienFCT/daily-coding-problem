//
//  Solution.swift
//  Problem 223
//
//  Created by sebastien FOCK CHOW THO on 2020-01-03.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

// Solution from https://www.geeksforgeeks.org/inorder-tree-traversal-without-recursion-and-without-stack/

class Node {
    var value: Int
    var left: Node?
    var right: Node?
    var parent: Node?
    
    init(value: Int) {
        self.value = value
        self.left = nil
        self.right = nil
    }
    
    func MorrisTraversal() {
        
        var current: Node? = self
        var previous: Node? = nil
        
        while current != nil {
            
            if current?.left == nil {
                print(current?.value)
                current = current?.right
            } else {
                previous = current?.left
                
                while (previous?.right != nil && previous?.right?.value != current?.value) {
                    previous = previous?.right
                }
                
                if previous?.right == nil {
                    previous?.right = current
                    current = current?.left
                } else {
                    previous?.right = nil
                    print(current?.value)
                    current = current?.right
                }
            }
        }
    }
}
