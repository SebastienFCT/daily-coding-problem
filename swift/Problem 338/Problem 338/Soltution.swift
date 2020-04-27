//
//  Soltution.swift
//  Problem 338
//
//  Created by sebastien FOCK CHOW THO on 2020-04-27.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

extension Int {
    
    func nextIntWithSameBitCount() -> Int {
    
        guard let uint = UInt64(exactly: NSNumber(value: self)) else {
            fatalError("input not supported (uint64 casting)")
        }
        
        let countBits = uint.bits().filter({ $0 == .one }).count
        var current = self + 1
        
        while true {
            
            guard let currentUint = UInt64(exactly: NSNumber(value: current)) else {
                fatalError("could not cast \(current)")
            }
            
            if currentUint.bits().filter({ $0 == .one }).count == countBits {
                return current
            }
            
            current += 1
        }
    
        fatalError("something went wrong")
    }
}

extension UInt64 {
    enum Bit: UInt8, CustomStringConvertible {
        case zero, one

        var description: String {
            switch self {
            case .one:
                return "1"
            case .zero:
                return "0"
            }
        }
    }
    
    func bits() -> [Bit] {
        var byte = self
        var bits = [Bit](repeating: .zero, count: 64)
        for i in 0..<8 {
            let currentBit = byte & 0x01
            if currentBit != 0 {
                bits[i] = .one
            }

            byte >>= 1
        }

        return bits
    }
}
