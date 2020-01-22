//
//  Solution.swift
//  Problem 242
//
//  Created by sebastien FOCK CHOW THO on 2020-01-22.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

enum TwitterError: Swift.Error {
    case invalidInput(String)
    case invalidInterval
}

class DailyTwitter {
    
    var values: [Int]
    
    init() {
        self.values = Array(repeating: 0, count: 24)
    }
    
    init(value: [Int]) throws {
        guard value.count == 24 else {
            throw TwitterError.invalidInput("Length invalid")
        }
        
        self.values = value
    }
    
    func update(hour: Int, value: Int) {
        values[hour] += value
    }
    
    func query(start: Int, end: Int) throws -> Int {
        
        guard end-1 >= start else {
            throw TwitterError.invalidInterval
        }
        
        return values[start...end-1].reduce(0) { $0 + $1 }
        
    }
    
}
