//
//  Solution.swift
//  Problem 288
//
//  Created by sebastien FOCK CHOW THO on 2020-03-08.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

struct Kaprekar {
    
    func countStepsTo6174(from: Int) -> Int {
        
        var count = 0
        var copy = from
        
        while copy != 6174 {
            copy = next(from: copy)
            count += 1
        }
        
        return count
    }
    
    private func next(from: Int) -> Int {
        
        let digits = String(from).compactMap{ $0.wholeNumberValue }
        
        guard let ascending = Int(digits.sorted{ $0 > $1 }.reduce("") { "\($0)\($1)" }), let descending = Int(digits.sorted{ $0 < $1 }.reduce("") { "\($0)\($1)" }) else {
            fatalError("Could not map digits for \(from)")
        }
        
        return ascending > descending ? (ascending - descending) : (descending - ascending)
    }
}
