//
//  Solution.swift
//  Problem 153
//
//  Created by sebastien FOCK CHOW THO on 2019-10-25.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

extension String {
    
    func distance(between first: String, and second: String) -> Int {
        let splitted = self.split(separator: " ").map{ String($0) }

        guard splitted.contains(first), splitted.contains(second) else {
            return 0
        }
        
        var index = 0
        var current = ""
        var distance = Int.max
        
        for i in 0..<splitted.count {
            
            if splitted[i] == first {
                if current == second {
                    if distance > i - index {
                        distance = i - index
                    }
                }
                
                current = splitted[i]
                index = i
            }
            
            if splitted[i] == second {
                if current == first {
                    if distance > i - index {
                        distance = i - index
                    }
                }
                
                current = splitted[i]
                index = i
            }
        }
        
        return distance-1
    }
}
