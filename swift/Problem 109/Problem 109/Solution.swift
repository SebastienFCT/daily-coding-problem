//
//  Solution.swift
//  Problem 109
//
//  Created by sebastien FOCK CHOW THO on 2019-09-11.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

// MARK: - Convenient method to convert UInt8 to [Bit]
// See https://stackoverflow.com/a/44808203/2641304

enum Bit: UInt8, CustomStringConvertible {
    case zero, one
    
    var description: String {
        switch self {
            case .zero: return "0"
            case .one: return "1"
        }
    }
}

extension UInt8 {
    mutating func toArrayOfBits() -> [Bit] {
        var copy = self
        var bits = [Bit](repeating: .zero, count: 8)
        
        for i in 0..<8 {
            let currentBit = copy & 0x01
            if currentBit != 0 {
                bits[i] = .one
            }
            
            copy >>= 1
        }
        
        return bits
    }
}

extension Array where Element == Int {
    func toBitArray() -> [Bit] {
        var result: [Bit] = []
        
        for item in self {
            result.append(Bit(rawValue: item == 0 ? 0 : 1)!)
        }
        
        return result
    }
}

extension Array where Element == Bit {
    func toIntArray() -> [Int] {
        var result: [Int] = []
        
        for item in self {
            result.append(item == Bit(rawValue: 1) ? 1 : 0)
        }
        
        return result
    }
}

extension Array where Element == Bit {
    func swapOddAndEven() -> [Bit] {
        var copy = self
        
        for i in 0..<count {
            if i % 2 == 1 {
                copy[i-1] = copy[i]
                copy[i] = self[i-1]
            }
        }
        
        return copy
    }
}
