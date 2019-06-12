//
//  Solution.swift
//  Problem 7
//
//  Created by sebastien FOCK CHOW THO on 2019-06-11.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

extension String {
    func decypher() -> Int {
        let substring = String(self.prefix(2))
        
        if substring == "00" || substring == "0" {
            return 0
        }
        
        if self.count == 0 {
            return 1
        }
        
        if self.count == 1 {
            return 1
        }
        
        if let val = Int(substring) {
            if val <= 26 {
                return String(self.suffix(self.count - 1)).decypher() + String(self.suffix(self.count - 2)).decypher()
            }
        }
    
        return 0
    }
}
