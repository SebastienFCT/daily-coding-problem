//
//  Solution.swift
//  Problem 350
//
//  Created by sebastien FOCK CHOW THO on 2020-05-09.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

extension Int {
    
    func minimumTupleOrPerfectSquareWithMatchingSum() -> Int? {
        
        var index = 1
        var squares: [Int] = [1]
        
        while squares.last! <= self {
            index += 1
            squares.append(index*index)
        }
        
        squares.removeLast()
        
        let candidates = squares.tuples(current: [], total: self)
        let sorted = candidates.sorted{ $0.count < $1.count }
        
        return sorted.first?.count
    }
}

extension Array where Element == Int {
    
    func tuples(current: [Int], total: Int) -> [[Int]] {
        
        var result: [[Int]] = []
        
        for i in 0..<count {
            
            if self[i] < total {
                
                var newCurrent = current
                newCurrent.append(self[i])
                
                result.append(contentsOf: self.tuples(current: newCurrent, total: total-self[i]))
            }
            
            if self[i] == total {
                var newCurrent = current
                newCurrent.append(self[i])
                
                result.append(newCurrent)
            }
        }
        
        return result
    }
}
