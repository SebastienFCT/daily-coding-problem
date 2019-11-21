//
//  Solution.swift
//  Problem 179
//
//  Created by sebastien FOCK CHOW THO on 2019-11-20.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

class Node {
    var value: Int
    var left: Node?
    var right: Node?
    
    init(value: Int, left: Node?, right: Node?) {
        self.value = value
        self.left = left
        self.right = right
    }
    
    init(value: Int) {
        self.value = value
        self.left = nil
        self.right = nil
    }
    
    static func buildTree(postorderedTraversedKeys: [Int]) -> Node? {
        if postorderedTraversedKeys.isEmpty {
            return nil
        }
        
        if postorderedTraversedKeys.count == 1 {
            return Node(value: postorderedTraversedKeys[0])
        }
        
        var copy = postorderedTraversedKeys
        let rootVal = copy.removeLast()
        let node = Node(value: rootVal)
        
        if copy.count == 1 {
            if copy[0] > rootVal {
                node.right = Node(value: copy[0])
            } else {
                node.left = Node(value: copy[0])
            }
            
            return node
        }
        
        var mid = 0
        
        for index in stride(from: copy.count-1, to: -1, by: -1) {
            if copy[index] < rootVal {
                mid = index
                break
            }
        }
        
        let leftValues = Array(copy.prefix(mid+1))
        let rightValues = Array(copy.suffix(copy.count-mid-1))
        
        node.left = buildTree(postorderedTraversedKeys: leftValues)
        node.right = buildTree(postorderedTraversedKeys: rightValues)
        
        return node
    }

}
