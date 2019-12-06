//
//  Solution.swift
//  Problem 195
//
//  Created by sebastien FOCK CHOW THO on 2019-12-06.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

typealias Position = (row: Int, column: Int)

extension Array where Element == Array<Int> {
    
    func countWhereElement(smallerThanElementAt maxPos: Position, andGreaterThanElementAt minPos: Position) -> Int {
        
        guard maxPos.row >= 0, minPos.row >= 0, maxPos.column >= 0, minPos.row >= 0, let rowSize = self.first?.count, maxPos.row < count, maxPos.column < rowSize, minPos.row < count, minPos.column < rowSize else {
            return 0
        }
        
        var result = 0
        
        let maxValue = self[maxPos.row][maxPos.column]
        let minValue = self[minPos.row][minPos.column]
        
        for i in 0..<count {
            for j in 0..<rowSize {
                if self[i][j] < maxValue && self[i][j] > minValue {
                    result += 1
                }
            }
        }
        
        return result
    }
}
