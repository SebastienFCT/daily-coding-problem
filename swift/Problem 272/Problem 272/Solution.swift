//
//  Solution.swift
//  Problem 272
//
//  Created by sebastien FOCK CHOW THO on 2020-02-21.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

func throw_dice(n: Int, faces: Int, total: Int, current: Int = 0) -> Int {
    
    var result = 0
    
    for i in 1...faces {
        if current + i == total {
            if n == 1 {
                result += 1
                break
            } else {
                break
            }
        } else if current + i > total {
            break
        } else {
            result += throw_dice(n: n-1, faces: faces, total: total, current: current + i)
        }
    }
    
    return result
}
