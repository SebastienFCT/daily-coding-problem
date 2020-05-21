//
//  Solution.swift
//  Problem 362
//
//  Created by sebastien FOCK CHOW THO on 2020-05-21.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

extension Int {
    
    func isStrobogrammatic() -> Bool {
        
        let array = String(self).compactMap { Int(String($0)) }
        
        return array.isStrobogrammatic()
    }
}

extension Array where Element == Int {
    
    func isStrobogrammatic() -> Bool {
        
        var filtered = filter{ $0 != 6 && $0 != 9 }
        filtered = filtered.filter{ $0 != 0 && $0 != 8 && $0 != 1 }
        
        guard filtered.isEmpty else {
            return false
        }
        
        let pre = prefix(count/2)
        let suf = Array(suffix(count/2).reversed())
        
        for i in 0..<pre.count {
            
            if pre[i] != suf[i] {
                
                if !(pre[i] == 6 && suf[i] == 9) || (pre[i] == 9 && suf[i] == 6) {
                    return false
                }
            }
        }
        
        if count % 2 != 0 {
            return self[count/2] == 1 || self[count/2] == 0 || self[count/2] == 8
        }
        
        return true
    }
}
