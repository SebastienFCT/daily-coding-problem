//
//  Solution.swift
//  Problem 289
//
//  Created by sebastien FOCK CHOW THO on 2020-03-09.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

struct Nim {
    
    var heap1: Int
    var heap2: Int
    var heap3: Int
    
    func canWin() -> Bool {
        
        switch (heap1, heap2, heap3) {
            
        case (0, 0, _), (_, 0, 0), (0, _, 0):
            return true
        case (0, _, _):
            return heap2 != 1 && heap3 != 1
        case (_, 0, _):
            return heap1 != 1 && heap3 != 1
        case (_, _, 0):
            return heap1 != 1 && heap2 != 1
        case (1, 1, 1):
            return false
        case (1, 1, _), (1, _, 1), (_, 1, 1):
            return true
        case (1, _, _):
            return heap2 > 1 && heap3 > 1
        case (_, _, 1):
            return heap1 > 1 && heap2 > 1
        case (_, 1, _):
            return heap1 > 1 && heap3 > 1
        default:
            
            if heap1 > 1 {
                return !Nim(heap1: heap1-1, heap2: heap2, heap3: heap3).canWin()
            }
            if heap2 > 1 {
                return !Nim(heap1: heap1, heap2: heap2-1, heap3: heap3).canWin()
            }
            
            return !Nim(heap1: heap1, heap2: heap2, heap3: heap3-1).canWin()
        }
    }
}
