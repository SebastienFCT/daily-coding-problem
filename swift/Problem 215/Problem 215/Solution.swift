//
//  Solution.swift
//  Problem 215
//
//  Created by sebastien FOCK CHOW THO on 2019-12-26.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

class Node {
    var value: Int
    var left: Node?
    var right: Node?
    
    init(value: Int) {
        self.value = value
        self.left = nil
        self.right = nil
    }
    
    func bottomViews() -> [Int] {
        
        let candidates = bottomNodes(currentHd: 0)
        let sorted = candidates.sorted{ $0.hd < $1.hd }
        var filtered: [(value: Int, hd: Int)] = []
        
        for element in sorted {
            if !filtered.contains(where: { (item) -> Bool in
                item.hd == element.hd
            }) {
                filtered.append(element)
            }
        }
        
        let mapped = filtered.map{ $0.value }
        
        return mapped
    }
    
    func bottomNodes(currentHd: Int) -> [(value: Int, hd: Int)] {
        
        var result: [(value: Int, hd: Int)] = []
        
        if left == nil && right == nil {
            return [(value: value, hd: currentHd)]
        }
        
        if let left = left {
            result.append(contentsOf: left.bottomNodes(currentHd: currentHd-1))
        }
        
        if let right = right {
            result.append(contentsOf: right.bottomNodes(currentHd: currentHd+1))
        }
        
        if !result.contains(where: { (item) -> Bool in
            item.hd == currentHd
        }) {
            result.append((value: value, hd: currentHd))
        }
        
        return result
    }
}
