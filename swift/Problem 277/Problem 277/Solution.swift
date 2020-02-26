//
//  Solution.swift
//  Problem 277
//
//  Created by sebastien FOCK CHOW THO on 2020-02-26.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

extension Array where Element == Int {
    
    func isValidUtf8() -> Bool {
        
        guard count == 32 || count == 24 || count == 16 || count == 8 else {
            return false
        }
        
        guard (filter{ $0 != 0 && $0 != 1 }.count == 0) else {
            return false
        }
        
        if self[0] == 0 {
            return true
        }
        
        if self[0...2] == [1, 1, 0] {
            return self[8...9] == [1, 0]
        }
        
        if self[0...3] == [1,1,1,0] {
            return self[8...9] == [1, 0] && self[16...17] == [1, 0]
        }
        
        if self[0...4] == [1, 1, 1, 1, 0] {
            return self[8...9] == [1, 0] && self[16...17] == [1, 0] && self[24...25] == [1, 0]
        }
        
        return false
    }
}
