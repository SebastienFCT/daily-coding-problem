//
//  Solution.swift
//  Problem 111
//
//  Created by sebastien FOCK CHOW THO on 2019-09-13.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

extension String {
    func indexesForAnagrams(of value: String) -> [Int] {
        var result: [Int] = []
        
        for i in 0..<count {
            let current = String(self.suffix(count-i).prefix(value.count))
            
            if current.count != value.count {
                continue
            }
            
            if (current.sorted{ $0 < $1} == value.sorted{ $0 < $1 }) {
                result.append(i)
            }
        }
        
        return result
    }
}
