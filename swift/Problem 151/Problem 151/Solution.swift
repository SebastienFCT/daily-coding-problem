//
//  Solution.swift
//  Problem 151
//
//  Created by sebastien FOCK CHOW THO on 2019-10-23.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

extension Array where Element == Array<String> {
    
    typealias PixelLoc = (row: Int, column: Int)
    
    mutating func replace(location: PixelLoc, withValue value: String) {
        let adjacents = getAdjacents(location: location)
        
        for item in adjacents {
            self[item.row][item.column] = value
        }
    }
    
    func getAdjacents(location: PixelLoc) -> [PixelLoc] {
        
        var result: [PixelLoc] = []
        
        let value = self[location.row][location.column]
        result.append(location)
        
        var index = 0
        
        while index < result.count {
            let surrounding = surroundingLocations(location: result[index])
            
            for item in surrounding {
                if item.value == value && !result.contains(where: { (elem) -> Bool in
                    return elem.row == item.location.row && elem.column == item.location.column
                }) {
                    result.append(item.location)
                }
            }
            
            index += 1
        }
        
        return result
    }
    
    private func surroundingLocations(location: PixelLoc) -> [(location: PixelLoc, value: String)] {
        var result: [(location: PixelLoc, value: String)] = []
        
        if let left = takeIfExist(location: (location.row, location.column-1)) {
            result.append(((location.row, location.column-1), left))
        }
        
        if let right = takeIfExist(location: (location.row, location.column+1)) {
            result.append(((location.row, location.column+1), right))
        }
        
        if let top = takeIfExist(location: (location.row-1, location.column)) {
            result.append(((location.row-1, location.column), top))
        }
        
        if let bottom = takeIfExist(location: (location.row+1, location.column)) {
            result.append(((location.row+1, location.column), bottom))
        }
        
        return result
    }
    
    private func takeIfExist(location: PixelLoc) -> String? {
        if location.row < 0 || location.column < 0 || location.row > self.count-1 || location.column > self[0].count-1 {
            // Index out of bound
            return nil
        }
        
        return self[location.row][location.column]
    }
}
