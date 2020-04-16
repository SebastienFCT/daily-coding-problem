//
//  Solution.swift
//  Problem 327
//
//  Created by sebastien FOCK CHOW THO on 2020-04-16.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
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
    
    func merge(withTree tree: Node?) -> Node? {
        
        guard let tree = tree else {
            return self
        }
        
        let selfInLevels = toLevels(current: [[self]])
        let treeInLevels = toLevels(current: [[tree]])
        
        let maxCount = max(selfInLevels.count-1, treeInLevels.count-1)
        
        var newInLevels: [[Node?]] = []
        
        for i in 0...maxCount {
            
            var newRow: [Node?] = []
            
            for j in 0...(max(selfInLevels[i].count-1, treeInLevels[i].count-1)) {
                
                if j < selfInLevels[i].count && j < treeInLevels[i].count {
                    
                    if let sNode = selfInLevels[i][j], let tNode = treeInLevels[i][j] {
                        newRow.append(Node(value: sNode.value + tNode.value))
                        continue
                    }
                    
                    if let sNode = selfInLevels[i][j] {
                        newRow.append(Node(value: sNode.value))
                        continue
                    }
                    
                    if let tNode = treeInLevels[i][j] {
                        newRow.append(Node(value: tNode.value))
                        continue
                    }
                    
                    newRow.append(nil)
                    continue
                }
            }
            
            newInLevels.append(newRow)
        }
        
        for i in 0...newInLevels.count-2 {
            
            for j in 0...newInLevels[i].count-1 {
                
                if newInLevels[i][j] != nil {
                    newInLevels[i][j]?.left = newInLevels[i+1][j*2]
                    newInLevels[i][j]?.right = newInLevels[i+1][j*2+1]
                }
            }
        }
        
        return newInLevels[0][0]
    }
    
    private func toLevels(current: [[Node?]]) -> [[Node?]] {

        var copy = current
        var newRow: [Node?] = []
        
        let lastIndex = copy.count-1
        
        for node in copy[lastIndex] {
            
            if let node = node {
                newRow.append(node.left)
                newRow.append(node.right)
            } else {
                newRow.append(contentsOf: [nil, nil])
            }
        }
        
        if newRow.filter({ $0 != nil }).isEmpty {
            return current
        }
        
        copy.append(newRow)
        
        return toLevels(current: copy)
    }
}
