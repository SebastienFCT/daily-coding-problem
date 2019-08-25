//
//  Solution.swift
//  Problem 92
//
//  Created by sebastien FOCK CHOW THO on 2019-08-25.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

class Node {
    var value: String
    var dependents: [Node]
    
    init(value: String, dependents: [Node]) {
        self.value = value
        self.dependents = dependents
    }
    
    func addChild(node: Node) {
        dependents.append(node)
    }
    
    func remove(dependent: Node) {
        for i in 0..<dependents.count {
            let node = dependents[i]
            
            if node.value == dependent.value {
                dependents.remove(at: i)
                return
            }
        }
    }
}

struct DependencyManager {
    var nodes: [Node]
    
    // Here we're building an array of nodes from the input. We make sure that each node references its children
    mutating func buildMap(input: [String : [String]]) {
        for entry in input {
            var currentNode = Node(value: entry.key, dependents: [])
            
            if let existing = nodes.contains(node: entry.key) {
                currentNode = existing
            } else {
                nodes.append(currentNode)
            }
            
            for child in entry.value {
                let newNode = Node(value: child, dependents: [])
                
                if nodes.contains(node: child) == nil {
                    nodes.append(newNode)
                }
                
                currentNode.addChild(node: newNode)
            }
            
        }
    }
    
    func buildOptimalPath() -> [String] {
        var copy = nodes.sorted{ $0.dependents.count < $1.dependents.count }
        var optimized: [Node] = []
        
        while !copy.isEmpty {
            for i in 0..<copy.count {
                let element = copy[i]
                
                if !element.dependents.isEmpty {
                    // Dependencies required and since we sorted copy, all following nodes have dependencies
                    return ["failed"]
                }
                
                optimized.append(element)
                copy.remove(at: i)
                copy.removeDependency(dependent: element)
                
                // And loop through the while...
                break
            }
        }
        
        return optimized.map{ $0.value }
    }
}

extension Array where Element == Node {
    func contains(node: String) -> Node? {
        for element in self {
            if element.value == node {
                return element
            }
        }
        
        return nil
    }
    
    mutating func remove(node: Node) {
        for i in 0..<self.count {
            let element = self[i]
            if element.value == node.value {
                self.remove(at: i)
                return
            }
        }
    }
    
    mutating func removeDependency(dependent: Node) {
        for element in self {
            element.remove(dependent: dependent)
        }
    }
}
