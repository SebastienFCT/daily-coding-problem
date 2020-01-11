//
//  Solution.swift
//  Problem 48
//
//  Created by sebastien FOCK CHOW THO on 2019-07-12.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

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

extension Array where Element == String {
    func toNodes() -> [Node] {
        var result: [Node] = []
        
        for element in self {
            result.append(Node(value: element))
        }
        
        return result
    }
}

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
