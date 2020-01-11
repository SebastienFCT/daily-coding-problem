//
//  Solution.swift
//  Problem 47
//
//  Created by sebastien FOCK CHOW THO on 2019-07-11.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

extension Array where Element == Int {
    func findLargestDifferenceFAILED() -> Int {
        guard self.count > 0 else {
            return 0
        }
        
        var min = self.first!
        var max = self.first!
        
        for element in self {
            if min > element {
                min = element
            }
            
            if max < element {
                max = element
            }
        }
        
        return (max - min > 0) ? max - min : 0
    }
    
    func maximumGap() -> Int {
        guard self.count > 2 else {
            return 0
        }
        
        var min = self.first!
        
        for i in 1..<self.count-1 {
            let element = self[i]
            
            if element < min {
                min = element
            }
        }
        
        return (last! - min) > 0 ? last! - min : 0
    }
    
    func findLargestDifference() -> Int {
        guard count > 2 else {
            return 0
        }
        
        var copy = self
        copy.removeLast()
        
        return Swift.max(maximumGap(), copy.maximumGap())
    }

}
