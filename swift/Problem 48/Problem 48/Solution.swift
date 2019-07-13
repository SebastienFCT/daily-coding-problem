//
//  Solution.swift
//  Problem 48
//
//  Created by sebastien FOCK CHOW THO on 2019-07-12.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

/**
 
     I'm not familiar with preorder and inorder of a binary tree, given the example, it seems that
 
     - preorder starts from the root and goes down from the left side of the tree, it has to finish all of a sub-tree before tackling the next branch of the parent tree
     - inorder starts from the last branch and gets back to its parents, it needs to scan all nodes of a subtree before going to the parent of the sub-tree
 
     Given those facts what kind of rules do I know from inorder and preorder arrays?
 
     Preoder trees
     - the first element of a preorder array is the root of my binary tree
     - the last element of a preorder array is a child of the last level of the tree
     - Two neighbours elements are either
     - parent/child
     - siblings (they cannot be grand-parent/grand-child)
 
     Inorder trees
     - the first element of an inorder array is a node of the last level of the tree
 
     Other
     - Looking at the example, it seems that all the elements between preorder[0] and preorder[x] where preorder[x] = inorder[0] are all the nodes from the root to the bottom left of the tree. This seems to be a good intuition and I want to see what else I can see once I remove these elements (based on the example)
 
     the tree is
 
     ```
         a
        / \
       b   c
      / \ / \
     d  e f  g
     ```
 
     * preorder: `[a, b, d, e, c, f, g]`
     * inorder: `[d, b, e, a, f, c, g]`
     * preorder[0] = a, inorder[0] = d = preorder[2] =>
 
     preorder[0] -> preorder[1] -> preorder[2] are the left branches, let's remove them and see we have
 
     * preorder: `[e, c, f, g]`
     * inorder: `[b, e, a, f, c, g]`
 
     my inorder[0] corresponds to b which is one of the element of the previous preorders
 
     I feel like it's going somewhere but it would get really complicated in terms of if/else statements
 
     I can see another pattern where I observe each element and their neighbours from both arrays:
 
     * First I'm looking at a, it has only b as siblings, in the inorder it has e & f, since a is the root (first element of preorder) I'll will ignore its inorder siblings and I will assume that b is its direct left child
     * b has a and d, a being its parent, I know that d is either its sibling or its left child
        * b has d and e in inorders, so d is the direct left child
     * d has b & e, b being its parent, e can be its sibling or its left child
        * d has only b, so e is its sibling
 
     This looks good so far, let's try to build it
 
    First I will build a node class, it has a value, a reference to its parent, its left child and its right child. They can be nil
 
 */
class Node {
    var value: String
    var parent: Node?
    var left: Node?
    var right: Node?
    
    init(value: String) {
        self.value = value
        self.parent = nil
        self.left = nil
        self.right = nil
    }
}
/**
 
    Now, I want to convert my array of integers to arrays of node so that I can apply my previous logic directly to my elements
 
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
 
    I want to build a function that takes my two array of integers and changes them to array of Node, the small detail is that I want to have the same Node references in both array so I'll build the second array based on existing nodes and values
 
 */
extension Array where Element == String {
    func toNodes(withExistingNodes nodes: [Node]) -> [Node] {
        var result: [Node] = []
        
        for element in self {
            for node in nodes {
                if node.value == element {
                    result.append(node)
                    break
                }
            }
        }
        
        return result
    }
}
/**
 
    Let's create few convenient methods:
    - Finding neighbours of a node
    - Checking if a node has a left child
    - Checking if a node has a right child
    - Checking if a node has a parent
 
    This is straight forward but helps us making the final piece of code more readable (or at least easier to debug)
 
 */
extension Array where Element == Node {
    func findNeighbours(index: Int) -> [Node] {
        guard count > 1 else {
            return []
        }
        
        if index == 0 {
            return [self[1]]
        }
        
        if index == self.count-1 {
            return [self[self.count-2]]
        }
        
        return [self[index-1], self[index+1]]
    }
}

extension Node {
    func hasLeftChild() -> Bool {
        return left != nil
    }
    
    func hasRightChild() -> Bool {
        return right != nil
    }
    
    func hasParent() -> Bool {
        return parent != nil
    }
}
/**
 
    We also need to make the Node class comparable
 
 */
extension Node: Comparable {
    static func < (lhs: Node, rhs: Node) -> Bool {
        return lhs.value < rhs.value
    }
    
    static func == (lhs: Node, rhs: Node) -> Bool {
        return lhs.value == rhs.value
    }
    
    
}
/**
 
    Ok, now we should be able to run the logic described earlier
 
 */
struct GoogleChallenge {
    var preorder: [String]
    var inorder: [String]
    var root: Node? = nil
    
    mutating func buildTree() {
        var preoderToNodes = preorder.toNodes()
        let inorderToNodes = inorder.toNodes(withExistingNodes: preoderToNodes)
        
        // We skip the first preorder element, it's the root
        root = preoderToNodes[0]
        
        for i in 1..<preoderToNodes.count {
            let current = preoderToNodes[i]
            print("current is \(current.value)")
            let preorderNeighbours = preoderToNodes.findNeighbours(index: i)
            
            for preorderNeighbour in preorderNeighbours {
                print("preorder is \(preorderNeighbour.value)")
                if preorderNeighbour == root {
                    if !root!.hasLeftChild() {
                        root!.left = current
                        current.parent = root
                    } else {
                        print("\(current.value) (root) is a sibling of \(preorderNeighbour.value)")
                        
                    }
                } else {
                    // find the element in the inorder
                    var index = -1
                    for j in 0..<inorderToNodes.count {
                        let inorderElement = inorderToNodes[j]
                        
                        if inorderElement == current {
                            index = j
                            break
                        }
                    }
                    
                    if index < 0 {
                        fatalError("this should never happen!")
                    }
                    
                    let inorderNeighbours = inorderToNodes.findNeighbours(index: index)
                    
                    for inorderNeighbour in inorderNeighbours {
                        print("inorder is \(inorderNeighbour.value)")
                        if inorderNeighbour == current.parent {
                            continue
                        }
                        
                        if preorderNeighbour == inorderNeighbour {
                            if !current.hasLeftChild() {
                                current.left = preorderNeighbour
                                preorderNeighbour.parent = current
                            } else {
                                print("(preorder) \(preorderNeighbour.value) should be equal to (inorder) \(inorderNeighbour.value) and should be sibling of \(current.value)")
                            }
                        } else {
                            if inorderNeighbour.left?.value == preorderNeighbour.value {
                                print("---- preorder : \(preorderNeighbour.value), inorder : \(inorderNeighbour.value)")
                                preorderNeighbour.parent = inorderNeighbour.parent
                                inorderNeighbour.parent?.right = preorderNeighbour
                            } else {
                                if preorderNeighbour.parent != nil {
                                    inorderNeighbour.parent = preorderNeighbour.parent
                                    preorderNeighbour.right = inorderNeighbour
                                } else {
                                    if inorderNeighbour.left != nil && inorderNeighbour.parent != nil {
                                        inorderNeighbour.right = preorderNeighbour
                                        preorderNeighbour.parent = inorderNeighbour
                                    } else {
                                        print("preorder info: left - \(preorderNeighbour.left?.value), right \(preorderNeighbour.right?.value), parent: \(preorderNeighbour.parent?.value)")
                                        print("inorder info: left - \(inorderNeighbour.left?.value), right \(inorderNeighbour.right?.value), parent: \(inorderNeighbour.parent?.value)")
                                        print("(inorder) \(inorderNeighbour.value) should be parent of (preorder) \(preorderNeighbour.value)")
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
