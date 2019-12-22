//
//  Solution.swift
//  Problem 211
//
//  Created by sebastien FOCK CHOW THO on 2019-12-22.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

extension String {
    
    func indexes(forSubstring substring: String) -> [Int] {
        
        var result: [Int] = []
        
        for i in 0..<count {
            let copy = suffix(count-i)
            
            if copy.prefix(substring.count) == substring {
                result.append(i)
            }
        }
        
        return result
    }
}
