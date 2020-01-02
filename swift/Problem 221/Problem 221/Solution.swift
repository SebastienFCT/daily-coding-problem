//
//  Solution.swift
//  Problem 221
//
//  Created by sebastien FOCK CHOW THO on 2020-01-01.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

struct Sevenish {
    
    func getValue(atIndex index: Int) -> Int {
        
        var list: [Int] = []
        
        var count = 0
        while list.count < index+1 {
            
            let newValue = Int(pow(7, Double(count)))
            var copy = list
            copy.append(newValue)
            for item in list {
                if item % 7 == 0 || item == 1 {
                    copy.append(newValue + item)
                }
            }
            
            list = copy
            count += 1
        }
        
        return list[index]
    }
}
