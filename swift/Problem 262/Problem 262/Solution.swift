//
//  Solution.swift
//  Problem 262
//
//  Created by sebastien FOCK CHOW THO on 2020-02-11.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

class Node: Equatable {
    
    // To make it simpler, we assume node values are unique
    static func == (lhs: Node, rhs: Node) -> Bool {
        return lhs.value == rhs.value
    }
    
    var value: Int
    
    init(value: Int) {
        self.value = value
    }
}

class Edge {
    var left: Node
    var right: Node
    
    init(left: Node, right: Node) {
        self.left = left
        self.right = right
    }
    
    func toString() -> String {
        return "\(left.value)--\(right.value)"
    }
}

struct Graph {
    var nodes: [Node]
    var edges: [Edge]
    
    func findBridges() -> [Edge] {
        
        var result: [Edge] = []
        
        for i in 0..<edges.count {
            
            var copy = edges
            let currentEdge = copy.remove(at: i)
            
            if !copy.isEmpty {
                let node = copy.first!.left
                let reachable = reachableNodes(fromEdges: copy, withNode: node)
                
                if reachable.count < nodes.count {
                    result.append(currentEdge)
                }
            }
        }
        
        return result
    }
    
    func reachableNodes(fromEdges: [Edge], withNode: Node) -> [Node] {
        
        var result: [Node] = []
        
        if fromEdges.isEmpty {
            return result
        }
        
        for i in 0..<fromEdges.count {
            
            var copy = fromEdges
            let currentEdge = copy.remove(at: i)
            
            if currentEdge.left == withNode {
                if !result.contains(currentEdge.right) {
                    result.append(currentEdge.right)
                }
                
                result.append(contentsOf: reachableNodes(fromEdges: copy, withNode: currentEdge.right))
            }
            
            if currentEdge.right == withNode {
                if !result.contains(currentEdge.left) {
                    result.append(currentEdge.left)
                }
                
                result.append(contentsOf: reachableNodes(fromEdges: copy, withNode: currentEdge.left))
            }
        }
        
        return result
    }
}
