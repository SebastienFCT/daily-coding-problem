//
//  Solution.swift
//  Problem 97
//
//  Created by sebastien FOCK CHOW THO on 2019-08-30.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

struct TimedDictionary {
    var map: [String : [(value: Int, time: Int)]]
    
    func get(key: String, time: Int) -> Int? {
        if let values = map[key] {
            let filtered = values.filter{ $0.time <= time }
            
            if filtered.isEmpty {
                return nil
            }
            
            return filtered.last!.value
        }
        
        return nil
    }
    
    mutating func set(key: String, value: Int, time: Int) {
        if let values = map[key] {
            
            for i in 0..<values.count {
                let current = values[i]
                
                if current.time == time {
                    var copy = values
                    copy[i].value = value
                    
                    map[key] = copy
                    return
                }
            }
            
            map[key]?.append((value: value, time: time))
            
        } else {
            map[key] = [(value: value, time: time)]
        }
    }
}
