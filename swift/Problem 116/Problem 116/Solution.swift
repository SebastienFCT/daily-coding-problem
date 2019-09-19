//
//  Solution.swift
//  Problem 116
//
//  Created by sebastien FOCK CHOW THO on 2019-09-18.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

class Node {
    var value: String
    var left: Node?
    var right: Node?
    
    init?(value: String, random: Bool = true) {
        if random && !Bool.random() {
            return nil
        } else {
            self.value = value
            self.left = Node(value: "")
            self.right = Node(value: "")
        }
    }
    
    func countNodes() -> Int {
        var result = 1
        
        if let left = left {
            result += left.countNodes()
        }
        
        if let right = right {
            result += right.countNodes()
        }
        
        return result
    }
}
