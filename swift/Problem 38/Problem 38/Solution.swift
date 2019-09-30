//
//  Solution.swift
//  Problem 38
//
//  Created by sebastien FOCK CHOW THO on 2019-07-02.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

extension Array where Element == Array<Bool> {
    
    func hasElementOnRow(_ row: Int) -> Bool {
        return self[row].contains(true)
    }
    
    func hasElementOnColumn(_ column: Int) -> Bool {
        return self.map{ $0[column] }.contains(true)
    }
    
    func hasElementOnDiagonalsOf(row: Int, column: Int) -> Bool {
        // Check all elements to the top left of the selected one
        var rowIndex = row-1
        var columnIndex = column-1
        
        while (rowIndex >= 0 && columnIndex >= 0) {
            if self[rowIndex][columnIndex] == true {
                return true
            }
            rowIndex -= 1
            columnIndex -= 1
        }
        
        // All elements to the bottom right
        rowIndex = row+1
        columnIndex = column+1
        
        while (rowIndex < self[0].count && columnIndex < self.count) {
            if self[rowIndex][columnIndex] == true {
                return true
            }
            
            rowIndex += 1
            columnIndex += 1
        }
        
        // All elements to the bottom left
        rowIndex = row+1
        columnIndex = column-1
        
        while (rowIndex < self[0].count && columnIndex >= 0) {
            if self[rowIndex][columnIndex] == true {
                return true
            }
            
            rowIndex += 1
            columnIndex -= 1
        }
        
        // All elements to the top right
        rowIndex = row-1
        columnIndex = column+1
        
        while (rowIndex > 0 && columnIndex < self.count) {
            if self[rowIndex][columnIndex] == true {
                return true
            }
            
            rowIndex -= 1
            columnIndex += 1
        }
        
        return false
    }
    
    func findHowManyArrangement() -> Int {
        return findHowManyArrangements(atColumn: 0)
    }
    
    private func findHowManyArrangements(atColumn column: Int) -> Int {
        var result = 0
        
        for i in 0..<self.count {
            if !self.hasElementOnColumn(column) && !self.hasElementOnRow(i) && !self.hasElementOnDiagonalsOf(row: i, column: column) {
                if column == self[0].count-1 {
                    result += 1
                } else {
                    var newArray = self
                    newArray[i][column] = true
                    
                    let next = newArray.findHowManyArrangements(atColumn: column+1)
                    result += next
                }
            }
        }
        
        return result
    }
}
