//
//  Solution.swift
//  Problem 43
//
//  Created by sebastien FOCK CHOW THO on 2019-07-08.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

class Stack {
    var values: [Int] = []
    var indexes: [Int] = []
    
    func push(value: Int) {
        values.append(value)
        
        if indexes.isEmpty {
            indexes.append(values.count-1)
        } else {
            if value > values[indexes.last ?? 0] {
                indexes.append(values.count-1)
            }
        }
    }
}

extension Stack {
    func pop() {
        if values.isEmpty || indexes.isEmpty {
            return
        }
        
        if values[indexes.last!] == values.last! {
            indexes.removeLast()
        }
        
        values.removeLast()
    }
}

extension Stack {
    func max() -> Int? {
        guard values.count > 0, indexes.count > 0 else {
            return nil
        }
        
        return values[indexes.last!]
    }
}
