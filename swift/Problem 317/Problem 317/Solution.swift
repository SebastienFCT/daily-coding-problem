//
//  Solution.swift
//  Problem 317
//
//  Created by sebastien FOCK CHOW THO on 2020-04-06.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

func andBitwise(from: Int, to: Int) -> UInt {
    
    var result = from.toUInt()
    
    for i in from+1...to {
        result = result & i.toUInt()
    }
    
    return result
}

extension Int {
    func toUInt() -> UInt {
        return self >= 0 ? UInt(self) : UInt(self  - Int.min) + UInt(Int.max) + 1
    }
}

extension UInt {
    func toInt() -> Int {
        return (self <= UInt(Int.max)) ? Int(self) : Int(self - UInt(Int.max) - 1) + Int.min
    }
}
