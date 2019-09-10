//
//  Solution.swift
//  Problem 108
//
//  Created by sebastien FOCK CHOW THO on 2019-09-10.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

extension String {
    func canShiftTo(target: String) -> Bool {
        var shifted = self
        
        guard self.count == target.count else {
            return false
        }
        
        for _ in 0..<count {
            shifted = "\(shifted.suffix(1))\(shifted.prefix(count-1))"
            if shifted == target {
                return true
            }
        }
        
        return false
    }
}
