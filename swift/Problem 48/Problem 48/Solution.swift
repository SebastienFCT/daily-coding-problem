//
//  Solution.swift
//  Problem 48
//
//  Created by sebastien FOCK CHOW THO on 2019-07-12.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

/**
 
    Node class
 
    We can create a node with just a value or the custom init uses an array of 3 nodes and set the two last ones as children of the first
 
 */
class Node {
    var value: String
    var parent: Node?
    var left: Node?
    var right: Node?
    
    init(triple: [Node]) {
        guard triple.count == 3 else {
            fatalError("init requires 3 elements")
        }
        
        value = triple[0].value
        left = triple[1]
        right = triple[2]
    }
    
    init(value: String) {
        self.value = value
        self.parent = nil
        self.left = nil
        self.right = nil
    }
}
/**
 
    This is a convenient method to convert our inputs (array of string) to arrays of nodes
 
 */
extension Array where Element == String {
    func toNodes() -> [Node] {
        var result: [Node] = []
        
        for element in self {
            result.append(Node(value: element))
        }
        
        return result
    }
}
/**
 
    Attempt to solve the problem differently
 
    It's a binary tree, we can decompose it into sub-tree made of a parent and 2 children
 
    Paying attention to the preorder array, we notice that taking each group of 3 elements from the right gives us these sub-trees
 
    There are 2 obstacles in doing this:
 
    First we must know how many levels there are, this way we can deduce how many group we have at each level. Example:
 
    - for 1 level, we would have a single group [a,b,c]
    - for 2 levels, we would have 2 groups ([b,d,e][c,f,g]) and then 1 group [a,b,c], notice that the children of a are the parent of the previous groups
    - for 3 levels, we would have 4 groups ([d,h,i][e,j,k][f,l,m][g,n,o]) and then the previous ones
 
    Based on these observations, we should be able to build a node based on an array of integers
 
 */
struct GoogleChallenge {
    var preorder: [String]
    var inorder: [String]
    var root: Node? = nil

    
    func treeLength() -> Int {
        var result = 0
        
        for element in preorder {
            if element == inorder[0] {
                return result
            }
            
            result += 1
        }
        
        return result
    }
}

/**
 
    Now with the length we can determine how many group are at the bottom of the tree:
 
    - for length = 1, there is 1 group of 3
    - for length = 2, there is 2 groups of 3
    - for length = 3, there is 4 group of 3
    - ...
    - for length = N, N>1, there is 2*(N-1) groups of 3

 */
extension GoogleChallenge {
    func buildChildren(children: [Node], preorder: [Node]) -> [Node] {
        var result: [Node] = []
        
        var childrenCopy = children
        var preorderCopy = preorder
        
        if children.isEmpty {
            let groupCount = 2*(treeLength()-1)
            
            for _ in 0..<groupCount {
                let suffix = Array(preorderCopy.suffix(3))
                let node = Node(triple: suffix)
                result.insert(node, at: 0)
                
                preorderCopy.removeLast()
                preorderCopy.removeLast()
                preorderCopy.removeLast()
            }
        } else {
            for _ in 0..<children.count/2 {
                let node = preorderCopy.suffix(1)[0]
                
                let leftAndRight = childrenCopy.suffix(2)
                node.left = leftAndRight[0]
                node.right = leftAndRight[1]
                
                preorderCopy.removeLast()
                childrenCopy.removeLast()
                childrenCopy.removeLast()
                
                result.insert(node, at: 0)
            }
        }
        
        if result.count == 1 {
            return result
        } else {
            return buildChildren(children: result, preorder: preorderCopy)
        }
    }
}
