//
//  Solution.swift
//  Problem 137
//
//  Created by sebastien FOCK CHOW THO on 2019-10-09.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

class BitArray {
    var array: [Int]
    var size: Int
    
    init(size: Int) {
        self.size = size
        self.array = []
    }
    
    func set(i: Int, val: Bool) {
        if i >= size {
            return
        }
        
        if val && !array.contains(i) {
            array.append(i)
        } else {
            if array.contains(i) {
                array = array.filter{ $0 != i }
            }
        }
    }
    
    func get(i: Int) -> Int? {
        if i >= size {
            return nil
        }
        
        return array.contains(i) ? 1 : 0
    }
}
