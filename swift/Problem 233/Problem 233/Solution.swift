//
//  Solution.swift
//  Problem 233
//
//  Created by sebastien FOCK CHOW THO on 2020-01-13.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

func fib(n: Int) -> Int {
    
    // According to http://www.maths.surrey.ac.uk/hosted-sites/R.Knott/Fibonacci/fibFormula.html
    // Fibonacci sequence can be approximated using the golden number 1.618...
    
    let phi = (sqrt(5) + 1) / 2
    let rPhi = 1 / phi
    
    let numerator = pow(phi, Double(n)) - pow(-rPhi, Double(n))
    let denumerator = phi - (-rPhi)
    
    return Int(numerator / denumerator)
}
