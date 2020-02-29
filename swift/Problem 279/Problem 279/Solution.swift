//
//  Solution.swift
//  Problem 279
//
//  Created by sebastien FOCK CHOW THO on 2020-02-28.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

typealias Friendlist = (person: Int, friends: [Int])

extension Array where Element == Friendlist {
    
    func friendGroups() -> [Set<Int>] {
        
        var result: [Set<Int>] = []
        
        for item in self {
            
            var exist = false
            
            for i in 0..<result.count {
                let row = result[i]
                
                if row.contains(item.person) {
                    exist = true
                    
                    var copy = row
                    
                    for friend in item.friends {
                        copy.insert(friend)
                    }
                    
                    result.remove(at: i)
                    result.append(copy)
                    
                    break
                }
            }
            
            if !exist {
                var newRow = Set<Int>()
                
                newRow.insert(item.person)
                
                for friend in item.friends {
                    newRow.insert(friend)
                }
                
                result.append(newRow)
            }
        }
        
        return result
    }
}
