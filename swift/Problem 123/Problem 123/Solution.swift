//
//  Solution.swift
//  Problem 123
//
//  Created by sebastien FOCK CHOW THO on 2019-09-25.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

extension String {
    
    func representNumber() -> Bool {
        
        if matchesRegex("^[+-]?([0-9]*\\.?[0-9]+|[0-9]+\\.?[0-9]*)([eE][+-]?[0-9]+)?$") {
            return true
        }
        
        return false
    }
    
    func matchesRegex(_ regexString: String) -> Bool {
        if let regex = try? NSRegularExpression(pattern: regexString), let _ = regex.firstMatch(in: self.trimmingCharacters(in: .whitespacesAndNewlines), options: [], range: NSRange(location: 0, length: self.count)) {
            return true
        }
        
        return false
    }
}
