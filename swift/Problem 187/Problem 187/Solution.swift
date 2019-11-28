//
//  Solution.swift
//  Problem 187
//
//  Created by sebastien FOCK CHOW THO on 2019-11-28.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

struct Rectangle {
    var top_left: (row: Int, column: Int)
    var dimensions: (width: Int, height: Int)
    
    func intersectWith(rect: Rectangle) -> Bool {
        
        let minRow = max(self.top_left.row, rect.top_left.row)
        let maxRow = min(self.top_left.row + self.dimensions.width, rect.top_left.row + rect.dimensions.width)
        
        let minColumn = max(self.top_left.column, rect.top_left.column)
        let maxColumn = min(self.top_left.column + self.dimensions.height, rect.top_left.column + rect.dimensions.height)
        
        return (maxRow-minRow > 0) && (maxColumn-minColumn > 0)
    }

}

extension Array where Element == Rectangle {
    func intersect() -> Bool {
        
        for i in 0..<count-1 {
            for j in i+1..<count {                
                if self[i].intersectWith(rect: self[j]) {
                    return true
                }
            }
        }
        
        return false
    }
}
