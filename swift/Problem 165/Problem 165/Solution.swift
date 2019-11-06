//
//  Solution.swift
//  Problem 165
//
//  Created by sebastien FOCK CHOW THO on 2019-11-06.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

extension Array where Element == Int {
    
    func mapToTotalSmallerElementToTheRight() -> [Int] {
        
        var result: [Int] = []
        
        for i in 0..<count {
            let current = self[i]
            let rest = Array(self.suffix(count-i))
            
            result.append(rest.reduce(0, { $1 < current ? $0 + 1 : $0 }))
        }
        
        return result
    }
}
