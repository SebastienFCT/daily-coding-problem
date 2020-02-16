//
//  Solution.swift
//  Problem 266
//
//  Created by sebastien FOCK CHOW THO on 2020-02-15.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

extension Array where Element == String {
    
    func stepWords(from input: String) -> [String] {
        
        var result: [String] = []
        
        for word in self {
            
            let difference = word.sorted().difference(from: input.sorted())
            
            if (difference.count == 1) {
                result.append(word)
            }
        }
        
        return result
    }
}
