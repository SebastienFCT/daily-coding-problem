//
//  Solution.swift
//  Problem 167
//
//  Created by sebastien FOCK CHOW THO on 2019-11-08.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

extension Array where Element == String {
    
    func pairsThatBuildPalindrome() -> [(leftIndex: Int, rightIndex: Int)] {
        
        var result: [(leftIndex: Int, rightIndex: Int)] = []
        
        for i in 0..<count {
            
            let leftElement = self[i]
            
            for j in 0..<count {
                
                if i == j { continue }
                
                let rightElement = self[j]
                
                let compoundElement = "\(leftElement)\(rightElement)"
                
                if compoundElement.isPalindrome() {
                    result.append((i, j))
                }
            }
        }
        
        return result
    }
    
    
}

extension String {
    
    func isPalindrome() -> Bool {
        
        let left = self.prefix(count / 2)
        let right = self.suffix(count / 2)
        
        return Array(left) == right.reversed()
    }
}
