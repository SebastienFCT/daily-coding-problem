//
//  Solution.swift
//  Problem 333
//
//  Created by sebastien FOCK CHOW THO on 2020-04-22.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

struct Party {
    
    var relation: [String : [String]]
    
    private func knows(a: String, b: String) -> Bool {
        
        return relation[a]?.contains(b) ?? false
    }
    
    func findCelebrity() -> String? {
        
        var startIndex = 0
        var endIndex = relation.count-1
        
        let people: [String] = Array(relation.keys)
        
        while startIndex != endIndex {
            if knows(a: people[startIndex], b: people[endIndex]) {
                startIndex += 1
            } else {
                endIndex -= 1
            }
        }
        
        return people[startIndex]
    }
    
}
