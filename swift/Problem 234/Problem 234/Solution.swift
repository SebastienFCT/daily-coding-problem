//
//  Solution.swift
//  Problem 234
//
//  Created by sebastien FOCK CHOW THO on 2020-01-14.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

typealias Edge = (nodes: [Node], weight: Int)

class Node {
    var value: Int
    var siblings: [(node: Node, weight: Int)]
    
    init(value: Int) {
        self.value = value
        self.siblings = []
    }
    
    func allEdges(current: [Edge]) -> [Edge] {
        
        var result: [Edge] = []
        
        for sibling in siblings {
            if !current.contains(where: { (edge) -> Bool in
                return (edge.nodes[0].value == self.value && edge.nodes[1].value == sibling.node.value) || (edge.nodes[1].value == self.value && edge.nodes[0].value == sibling.node.value)
            }) {
                result.append(([self,sibling.node], sibling.weight))
            }
        }
        
        if result.isEmpty {
            return []
        }
        
        result.append(contentsOf: current)
        
        for sibling in siblings {
            result.append(contentsOf: sibling.node.allEdges(current: result))
        }
        
        return result
    }
    
    func maximumSpanningTree() -> [Edge] {
        
        let edges = allEdges(current: []).sorted{ $0.weight > $1.weight }
        
        var result: [Edge] = []
        
        for edge in edges {
            if !result.contains(where: { (a_edge) -> Bool in
                return (a_edge.nodes[0].value == edge.nodes[0].value && a_edge.nodes[1].value == edge.nodes[1].value) || (a_edge.nodes[0].value == edge.nodes[1].value && a_edge.nodes[1].value == edge.nodes[0].value)
            }) {
                if !canLoop(from: edge.nodes[0], to: edge.nodes[1], with: result) {
                    result.append(edge)
                }
            }
        }
        
        return result
    }
    
    func canLoop(from: Node, to: Node, with edges: [Edge]) -> Bool {
        
        if edges.isEmpty {
            return false
        }
        
        for i in 0..<edges.count {
            
            if edges[i].nodes.contains(where: { (node) -> Bool in
                return node.value == from.value
            }) {
                if edges[i].nodes[0].value == to.value || edges[i].nodes[1].value == to.value {
                    return true
                }
                
                var copy = edges
                copy.remove(at: i)
                
                var nodes = edges[i].nodes
                nodes.removeAll { (node) -> Bool in
                    return node.value == from.value
                }
                
                if canLoop(from: nodes.first!, to: to, with: copy) {
                    return true
                }
            }
        }
        
        return false
    }
}
