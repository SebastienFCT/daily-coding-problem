//
//  Solution.swift
//  Problem 331
//
//  Created by sebastien FOCK CHOW THO on 2020-04-20.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

extension String {
    
    func countMinFlips() -> Int {
        
        guard (self.filter({ $0 != "x" && $0 != "y" }).isEmpty) else {
            fatalError("input invalid")
        }
        
        var copy = self
        
        while copy.first == "x" {
            copy.removeFirst()
        }
        
        while copy.last == "y" {
            copy.removeLast()
        }
        
        if copy.isEmpty {
            return 0
        }
        
        let xCount = copy.filter({ $0 == "x" }).count
        let yCount = copy.filter({ $0 == "y" }).count
        
        return min(xCount, yCount)
    }
}
