//
//  Solution.swift
//  Problem 131
//
//  Created by sebastien FOCK CHOW THO on 2019-10-03.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

class Node {
    var value: Int
    var next: Node?
    var rand: Node?
    
    init(value: Int, next: Node?, rand: Node?) {
        self.value = value
        self.next = next
        self.rand = rand
    }
    
    init(value: Int) {
        self.value = value
        self.next = nil
        self.rand = nil
    }
    
    func deepCopy(nodes: [Int: Node], rootKey: Int?) -> Node {
        var copyNodes = nodes
        
        let copy = self
        var rootKeyValue: Int!
        
        if let rootKey = rootKey {
            rootKeyValue = rootKey
        } else {
            rootKeyValue = copy.value
        }
        
        if let rand = copy.rand {
            copyNodes[rand.value] = rand
        }
        
        copyNodes[copy.value] = copy
        
        for key in copyNodes.keys {
            if copyNodes[key]!.rand!.value == copy.value {
                copyNodes[key]?.rand = copy
            }
        }
        
        if let next = next {
            return next.deepCopy(nodes: copyNodes, rootKey: rootKeyValue)
        } else {
            return copyNodes[rootKeyValue]!
        }
    }
    
    func values() -> String {
        var result = ""
        
        result += "\(self.value)"
        
        if let next = next {
            result += next.values()
        }
        
        return result
    }
}
