//
//  Solution.swift
//  Problem 161
//
//  Created by sebastien FOCK CHOW THO on 2019-11-02.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

extension UInt32 {
    // Solution from wty21cn at https://github.com/wty21cn/leetcode-swift/blob/master/leetcode-swift/Easy/q190-reverse-bits.swift
    func reverseBits() -> UInt32 {
        var copy = self
        
        var result: UInt32 = 0
        var i: UInt32 = 32
        
        while i > 0 && copy != 0 {
            result = result << 1 + copy & 0b1
            copy = copy >> 1
            i -= 1
        }
        
        result = result << i
        
        return result
    }
}
