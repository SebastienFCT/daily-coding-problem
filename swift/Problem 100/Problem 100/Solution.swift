//
//  Solution.swift
//  Problem 100
//
//  Created by sebastien FOCK CHOW THO on 2019-09-02.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

typealias Point = (row: Int, column: Int)

func distanceBetween(a: Point, b: Point) -> Int {
    let width = abs(b.column - a.column)
    let height = abs(b.row - a.row)
    
    return max(width, height)
}

extension Array where Element == Point {
    func minimumSteps() -> Int {
        var result = 0
        var copy = self
        var current = copy.removeFirst()
        
        while !copy.isEmpty {
            let next = copy.removeFirst()
            
            result += distanceBetween(a: current, b: next)
            current = next
        }
        
        return result
    }
}
