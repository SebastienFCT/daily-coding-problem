//
//  Solution.swift
//  Problem 248
//
//  Created by sebastien FOCK CHOW THO on 2020-01-28.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

func max(left: Int, right: Int) -> Int {
    
    return (left + right + abs(left - right)) / 2
}
