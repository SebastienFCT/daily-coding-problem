//
//  Solution.swift
//  Problem 38
//
//  Created by sebastien FOCK CHOW THO on 2019-07-02.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

/**
 
    In this problem, we're trying to distribute N element on a board of NxN cases
 
    The first idea that comes to mind is to build a function that get every possibilities for each element 1x1 based on the existing board (after previous distributions). For each of this possibilities, we keep trying all the possibilities until there is no more element. If we reach the "no more element" then it counts as one possibility.
 
    First, we should try to write our utility(ies) function(s) that will determine if an element can be added at the location (x,y)
 
    For this exercise, I will represent my board by an matrix (array of array) of booleans. False being "empty case" and True being "Queen" (or element).
 
 */
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
}
/**
 
    Ok now that it has been tested, it's time to write a recursive function that build our board progressively and counts all the possibilities
 
 */
extension Array where Element == Array<Bool> {
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
/**
 
    This seems to be working. I spent forever trying to understand why my test_3() would return 0.
 
    I didn't spend enough time visualizing the solution (like I usually do) and I totally missed the diagonal parts. It's been implemented correctly, but when visualizing in my mind, I forgot them, therefore I expected a 3x3 board to have solutions
 
 */
