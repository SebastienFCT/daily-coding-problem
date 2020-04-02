//
//  Solution.swift
//  Problem 313
//
//  Created by sebastien FOCK CHOW THO on 2020-04-02.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

typealias LockCombination = (first: Int, second: Int, third: Int)

struct Lock {
    
    var code: LockCombination
    var deadEnds: [LockCombination]
    
    func minMoves() -> Int? {
        
        if deadEnds.contains(where: { (value) -> Bool in
            value.first == 0 && value.second == 0 && value.third == 0
        }) {
            return nil
        }
        
        var candidates: [Int] = []
        
        for firstAscending in [true, false] {
         
            for secondAscending in [true, false] {
                
                for thirdAscending in [true, false] {
                    
                    var values: [[Int]] = [[], [], []]
                    
                    var count = 0
                    
                    if firstAscending {
                        count += code.first
                        
                        for i in 0...code.first {
                            values[0].append(i)
                        }
                    } else {
                        count += (10 - code.first)
                        
                        values[0].append(0)
                        for i in stride(from: 9, through: (10 - code.first), by: -1) {
                            values[0].append(i)
                        }
                    }
                    
                    if secondAscending {
                        count += code.second
                        
                        for i in 0...code.second {
                            values[1].append(i)
                        }
                    } else {
                        count += (10 - code.second)
                        
                        values[1].append(0)
                        for i in stride(from: 9, through: (10 - code.second), by: -1) {
                            values[1].append(i)
                        }
                    }
                    
                    if thirdAscending {
                        count += code.third
                        
                        for i in 0...code.third {
                            values[2].append(i)
                        }
                    } else {
                        count += (10 - code.third)
                        
                        values[2].append(0)
                        for i in stride(from: 9, through: (10 - code.third), by: -1) {
                            values[2].append(i)
                        }
                    }
                    
                    if deadEnds.count > 0 {
                        let deFirstValues = deadEnds.map{ $0.first }
                        
                        guard (deFirstValues.filter{ values[0].contains($0) }.count > 0) else {
                            continue
                        }
                        
                        let deSecondValues = deadEnds.map{ $0.second }
                        
                        guard (deSecondValues.filter{ values[1].contains($0) }.count > 0) else {
                            continue
                        }
                        
                        let deThirdValues = deadEnds.map{ $0.third }
                        
                        guard (deThirdValues.filter{ values[2].contains($0) }.count > 0) else {
                            continue
                        }
                    }
                    
                    candidates.append(count)
                }
            }
        }
        
        let sorted = candidates.sorted{ $0 < $1 }
        
        return sorted.first
    }
}
