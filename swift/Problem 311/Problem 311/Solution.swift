//
//  Solution.swift
//  Problem 311
//
//  Created by sebastien FOCK CHOW THO on 2020-03-31.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

extension Array where Element == Int {
    
    func anyPeak() -> Int {
        
        guard count > 0 else {
            fatalError("Invalid input")
        }
        
        if self[count/2] > self[(count/2)+1] && self[count/2] > self[(count/2)-1] {
            return self[count/2]
        }
        
        if self[count/2] > self[(count/2)+1] {
            return Array(suffix(count/2+1)).anyPeak()
        }
        
        return Array(prefix(count/2+1)).anyPeak()
    }
}
