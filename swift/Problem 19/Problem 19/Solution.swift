//
//  Solution.swift
//  Problem 19
//
//  Created by sebastien FOCK CHOW THO on 2019-06-17.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

extension Array where Element == Array<Int> {
    //      k1  k2  k3
    // n0   0   1   2
    // n1   3   2   1
    // n2   0   9   1
    
    // Reading:
    // To build house n1 with color k2 would cost me 2
    
    func optimum() -> [String] {
        var result: [String] = []
        
        for i in 0...self.count-1 {
            let pricing = self[i]
            
            result.append("color \(pricing.min() ?? 0)")
        }
        
        return result
    }
}
