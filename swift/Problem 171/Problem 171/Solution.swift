//
//  Solution.swift
//  Problem 171
//
//  Created by sebastien FOCK CHOW THO on 2019-11-12.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

struct Presence {
    
    enum entryType: String {
        case enter = "enter"
        case exit = "exit"
    }

    typealias Entry = (timestamp: Double, count: Int, type: entryType)
    
    var entries: [Entry]
    
    func busiestPeriod() -> (Double, Double) {
        let sorted = entries.sorted{ $0.timestamp < $1.timestamp }
        
        var current = 0
        var max = 0
        
        var currentPeriod: (before: Double, after: Double) = (sorted.first!.timestamp, sorted.first!.timestamp)
        var maxPeriod = currentPeriod
        
        for entry in sorted {
            currentPeriod.before = currentPeriod.after
            currentPeriod.after = entry.timestamp
            
            switch entry.type {
            case .enter:
                current += entry.count
                if current > max {
                    max = current
                    maxPeriod = currentPeriod
                }
            case .exit:
                current -= entry.count
            }
        }
        
        return maxPeriod
    }
}
