//
//  Solution.swift
//  Problem 11
//
//  Created by sebastien FOCK CHOW THO on 2019-06-12.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

extension Array where Element == String {
    
    func autocomplete(_ prefix: String) -> [String] {
        return self.filter{ String($0.prefix(prefix.count)) == prefix }
    }
}
