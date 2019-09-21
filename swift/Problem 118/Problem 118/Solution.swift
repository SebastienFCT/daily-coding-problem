//
//  Solution.swift
//  Problem 118
//
//  Created by sebastien FOCK CHOW THO on 2019-09-20.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

extension Array where Element == Int {
    func squareAndSort() -> [Int] {
        return self.map{ $0 * $0 }.sorted()
    }
}
