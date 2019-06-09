//
//  Solution.swift
//  Problem 2
//
//  Created by sebastien FOCK CHOW THO on 2019-06-09.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

extension Array where Element == Int {
    
    func productOfOthers() -> Array<Int> {
        let product = self.reduce(1){ $0 * $1 }
        
        return self.map{ product / $0 }
    }
    
    func productOfOtherWithoutDivision() -> Array<Int> {
        var result: [Int] = []
        
        for i in 0...(self.count - 1) {
            var copy = self
            copy.remove(at: i)
            
            result.append(copy.reduce(1){ $0 * $1 })
        }
        
        return result
    }
}
