//
//  Solution.swift
//  Problem 134
//
//  Created by sebastien FOCK CHOW THO on 2019-10-06.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

class SparseArray {
    
    var size: Int
    var values: [Int: Int]
    
    init(array: [Int], size: Int) {
        self.size = size
        self.values = [:]
        
        for i in 0..<array.count {
            if array[i] != 0 {
                self.values[i] = array[i]
            }
        }
    }
    
    func set(i: Int, val: Int) {
        if i > size {
            size = i+1
        }
        
        values[i] = val
    }
    
    func get(i: Int) -> Int {
        guard i < size else {
            fatalError("Index out of bound")
        }
        
        if values.keys.contains(i) {
            return values[i]!
        }
        
        return 0
    }
}
