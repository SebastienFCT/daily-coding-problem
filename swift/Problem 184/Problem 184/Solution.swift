//
//  Solution.swift
//  Problem 184
//
//  Created by sebastien FOCK CHOW THO on 2019-11-25.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

extension Array where Element == Int {
    
    func greatestCommonDenominator() -> Int {
        
        if count == 1 {
            return self[0]
        }
        
        guard let max = self.sorted().first else {
            return 0
        }
        
        for value in stride(from: max, to: -1, by: -1) {
            let modulos = self.map{ $0 % value }
            let reduced = modulos.reduce(0, +)
            
            if reduced == 0 {
                return value
            }
        }
        
        return 0
    }
}
