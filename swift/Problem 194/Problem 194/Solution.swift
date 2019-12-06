//
//  Solution.swift
//  Problem 194
//
//  Created by sebastien FOCK CHOW THO on 2019-12-05.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

typealias Point = (x: Int, y: Int)
typealias Line = (start: Point, end: Point)

func intersectionsForLines(withStartingPoints: [Int], andEndingPoints: [Int]) -> Int {
    
    var lines: [Line] = []
    var result = 0
    
    for i in 0..<withStartingPoints.count {
        
        // All points are on the same y axis
        let newLine: Line = ((withStartingPoints[i], 0), (andEndingPoints[i], 1))
        
        for line in lines {
            let c1 = line.start.x > newLine.start.x && line.end.x < newLine.end.x
            let c2 = line.start.x < newLine.start.x && line.end.x > newLine.end.x
            
            if c1 || c2 {
                result += 1
            }
        }
        
        lines.append(newLine)
    }
    
    return result
}
