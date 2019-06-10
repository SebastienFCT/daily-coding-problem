//
//  Solution.swift
//  Problem 4
//
//  Created by sebastien FOCK CHOW THO on 2019-06-10.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

extension Array where Element == Int {
    func lowerMissingPositiveInteger() -> Int {
        let sortedAndPosition = self.sorted{ $0 < $1}.filter{ $0 > 0 }
        
        var index = 1
        
        while (true) {
            if !sortedAndPosition.contains(index) {
                return index
            }
            
            index += 1
        }
    }
}
