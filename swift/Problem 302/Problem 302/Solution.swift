//
//  Solution.swift
//  Problem 302
//
//  Created by sebastien FOCK CHOW THO on 2020-03-22.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

extension Array where Element == Array<Character> {
    
    typealias Coordinate = (row: Int, column: Int, content: Character)
    
    func countRegion() -> Int {
        
        var coordinates = allCoordinates()
        var regions: [[Coordinate]] = []
        var limits: [Coordinate] = []
        
        while !coordinates.isEmpty {
                
            let next = coordinates.removeFirst()
            
            if next.content == "\\" || next.content == "/" {
                limits.append(next)
                continue
            }
            
            var regionIndexes: [Int] = []
            
            for i in 0..<regions.count {
                
                if regions[i].contains(where: { (aCoord) -> Bool in
                    (aCoord.row == next.row && abs(aCoord.column - next.column) == 1) || (aCoord.column == next.column && abs(aCoord.row - next.row) == 1)
                }) {
                    regionIndexes.append(i)
                }
            }
            
            if regionIndexes.isEmpty {
                regions.append([next])
            } else if regionIndexes.count == 1 {
                regions[regionIndexes.first!].append(next)
            } else {
                var copy: [[Coordinate]] = []
                var unified: [Coordinate] = []
                
                for i in 0..<regions.count {
                    
                    if regionIndexes.contains(i) {
                        unified.append(contentsOf: regions[i])
                    } else {
                        copy.append(regions[i])
                    }
                }
                
                copy.append(unified)
                
                regions = copy
            }
        }
        
        return regions.count
    }
    
    private func allCoordinates() -> [Coordinate] {
        
        var result: [Coordinate] = []
        
        for i in 0..<count {
            for j in 0..<self[i].count {
                result.append((i, j, self[i][j]))
            }
        }
        
        return result
    }
}
