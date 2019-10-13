//
//  Solution.swift
//  Problem 141
//
//  Created by sebastien FOCK CHOW THO on 2019-10-13.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

struct Stack {
    var list: [[Any]] = []
    
    mutating func pop(stack_number: Int) {
        guard stack_number < list.count else {
            return
        }
        
        guard !list[stack_number].isEmpty else {
            return
        }
        
        list[stack_number].removeLast()
    }
    
    mutating func push(item: Any, stack_number: Int) {
        if stack_number < list.count {
            list[stack_number].append(item)
            return
        }
        
        if list.count == stack_number {
            list.append([item])
            return
        }
        
        for _ in 1...stack_number-list.count {
            list.append([])
        }
        
        list.append([item])
    }
}
