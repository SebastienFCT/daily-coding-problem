//
//  Solution.swift
//  Problem 190
//
//  Created by sebastien FOCK CHOW THO on 2019-12-02.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

extension Array where Element == Int {
    
    func maxSubArraySum() -> Int {
        
        var result: [Int] = []
        var maximum = 0
        var current = 0
        
        for i in 0..<count*2 {
            
            let position = i % count
            
            while result.count >= count || (result.count > 0 && result.first! < 1) {
                current -= result.removeFirst()
            }
            
            result.append(self[position])
            current += self[position]
            
            maximum = Swift.max(current, maximum)
        }
        
        return maximum
    }
}
