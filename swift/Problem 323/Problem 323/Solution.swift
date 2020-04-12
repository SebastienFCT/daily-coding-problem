//
//  Solution.swift
//  Problem 323
//
//  Created by sebastien FOCK CHOW THO on 2020-04-12.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

extension Array where Element == Int {
    
    func median() -> Int {
        
        return sorted()[count/2]
    }
}
