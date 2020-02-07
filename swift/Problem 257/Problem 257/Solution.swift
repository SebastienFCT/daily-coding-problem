//
//  Solution.swift
//  Problem 257
//
//  Created by sebastien FOCK CHOW THO on 2020-02-06.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

extension Array where Element == Int {

    typealias Boundary = (start: Int, end: Int)

    func boundForSmallestWindowToSort() -> Boundary {
        
        var boundary: Boundary  = (0, count-1)
        let copy = self.sorted{ $0 < $1 }
        
        for i in 0..<count {
            if copy[i] != self[i] {
                boundary.start = i
                break
            }
        }
        
        for i in stride(from: count-1, through: 0, by: -1) {
            if copy[i] != self[i] {
                boundary.end = i
                break
            }
        }
        
        return boundary
    }
}
