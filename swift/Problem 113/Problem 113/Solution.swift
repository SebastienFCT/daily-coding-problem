//
//  Solution.swift
//  Problem 113
//
//  Created by sebastien FOCK CHOW THO on 2019-09-15.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

extension String {
    func reverseWords() -> String {
        
        let words = self.components(separatedBy: .whitespacesAndNewlines).reversed()
        
        return words.joined(separator: " ")
    }
}
