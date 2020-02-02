//
//  Solution.swift
//  Problem 252
//
//  Created by sebastien FOCK CHOW THO on 2020-02-01.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

typealias Fraction = (numerator: Int, denominator: Int)

struct EgyptianMaths {
    
    func convertFraction(fraction: Fraction) -> [Fraction] {
        
        if fraction.numerator == 1 {
            return [fraction]
        }
        
        var result: [Fraction] = []
        
        let newDenominator = Int(ceil(Double(fraction.denominator) / Double(fraction.numerator)))
        result.append((1, newDenominator))
        
        let newFractionNumerator = fraction.numerator * newDenominator - fraction.denominator
        let newFractionDenominator = newDenominator * fraction.denominator
        
        let gcd = greatestCommonDivisor(left: newFractionNumerator, right: newFractionDenominator)
        
        let newFraction: Fraction = (newFractionNumerator / gcd, newFractionDenominator / gcd)
        result.append(contentsOf: convertFraction(fraction: newFraction))
        
        return result
    }
    
    func reduceFraction(fraction: Fraction) -> Fraction {
        
        
        
        return fraction
    }
    
    func greatestCommonDivisor(left: Int, right: Int) -> Int {
        
        if left == 1 || right == 1 {
            return 1
        }
        
        if left == right {
            
            return left
        } else {
            if left > right {
                
                return greatestCommonDivisor(left: left-right, right: right)
            } else {
                
                return greatestCommonDivisor(left: left, right: right-left)
            }
        }
    }
}
