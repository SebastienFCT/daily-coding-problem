//
//  Solution.swift
//  Problem 207
//
//  Created by sebastien FOCK CHOW THO on 2019-12-18.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

class Node: Equatable {
    
    static func == (lhs: Node, rhs: Node) -> Bool {
        return lhs.guid == rhs.guid
    }
    
    var value: String
    var connections: [Node]
    var guid: UUID
    
    init(value: String, connections: [Node]) {
        self.value = value
        self.connections = connections
        self.guid = UUID()
    }
    
    init(value: String) {
        self.value = value
        self.connections = []
        self.guid = UUID()
    }
    
    func isBipartite() -> Bool {
        
        var uList: [Node] = []
        var vList: [Node] = []
        var uListNext = true
        
        var next: [Node] = []
        next.append(self)
        
        while !next.isEmpty {
            var nextNext: [Node] = []
            
            for node in next {
                if uListNext {
                    if vList.contains(node) {
                        return false
                    }
                    
                    if !uList.contains(node) {
                        uList.append(node)
                        nextNext.append(contentsOf: node.connections)
                    }
                } else {
                    if uList.contains(node) {
                        return false
                    }
                    
                    if !vList.contains(node) {
                        vList.append(node)
                        nextNext.append(contentsOf: node.connections)
                    }
                }
            }
            
            next = nextNext
            uListNext.toggle()
        }
        
        return true
    }
}
