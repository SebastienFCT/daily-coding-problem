//
//  Solution.swift
//  Problem 298
//
//  Created by sebastien FOCK CHOW THO on 2020-03-18.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

extension Array where Element == Int {
    
    func longestPortionForAnyPair() -> (length: Int, pair: (Int, Int)) {
        
        var result: (length: Int, pair: (Int, Int)) = (0, (0, 0))
        
        var first: Int? = nil
        var last: Int? = nil
        
        var lastCount = 0
        var length = 0
        
        for element in self {
            
            if first == nil {
                first = element
                length += 1
                
                continue
            }
            
            if element == first {
                
                if last == nil {
                    lastCount += 1
                } else {
                    lastCount = 1
                    
                    let tmp = first
                    first = last
                    last = tmp
                }
                
                length += 1
                
                continue
            }
            
            if last == nil {
                last = element
                lastCount += 1
                length += 1
                
                continue
            }
            
            if element == last {
                lastCount += 1
                length += 1
                
                continue
            }
            
            if length > result.length {
                result.length = length
                result.pair.0 = first!
                result.pair.1 = last!
            }
            
            let tmp = last
            last = element
            first = tmp
            length = lastCount + 1
            lastCount = 1
        }
        
        return result
    }
}
