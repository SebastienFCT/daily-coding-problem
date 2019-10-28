//
//  Solution.swift
//  Problem 155
//
//  Created by sebastien FOCK CHOW THO on 2019-10-27.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

extension Array where Element == Int {
    func findElementThatAppearTheMost() -> Int? {
        
        let distribution = repartition()
        
        return distribution.max{ a, b in a.value < b.value }?.key
    }
    
    private func repartition() -> [Int: Int] {
        var result: [Int: Int] = [:]
        
        for element in self {
            if result.keys.contains(element) {
                result[element]! += 1
            } else {
                result[element] = 1
            }
        }
        
        return result
    }
}
