//
//  Solution.swift
//  Problem 170
//
//  Created by sebastien FOCK CHOW THO on 2019-11-11.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

extension Dictionary where Value == String {
    
    func transformation(from: String, to: String, previousTransformations: [String]) -> [String]? {
        
        if !self.values.contains(to) {
            return nil
        }
        
        var candidates: [[String]] = []
        
        for value in self.values {
            let fromToDiff = zip(from, to).filter{ $0 != $1 }
            let fromValueDiff = zip(from, value).filter{ $0 != $1 }
            let valueToDiff = zip(value, to).filter{ $0 != $1 }
            
            let rule1 = fromValueDiff.count == 1
            let rule2 = valueToDiff.count == fromToDiff.count-1
            
            if rule1 && rule2 {
                print("from: \(from), to: \(to), value: \(value)")
                var candidate = previousTransformations
                candidate.append(value)
                
                candidates.append(candidate)
            }
        }
        
        if candidates.isEmpty {
            return nil
        }
        
        if candidates.first!.last! == to {
            return candidates.first!
        }
        
        for candidate in candidates {
            if let possibility = transformation(from: candidate.last!, to: to, previousTransformations: candidate) {
                return possibility
            }
        }
        
        return nil
    }
    
    
}
