//
//  Solution.swift
//  Problem 267
//
//  Created by sebastien FOCK CHOW THO on 2020-02-16.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

extension Array where Element == Array<Character> {
    
    func isKingInCheck() -> Bool {
        
        for i in 0..<count {
            
            for j in 0..<self[i].count {
                
                let character = self[i][j]
                
                if (character == "." || character == "K") {
                    continue
                }
                
                if character == "P" {
                    if (elementAt(row: i-1, column: j-1) == "K" || elementAt(row: i-1, column: j-1) == "K") {
                        return true
                    }
                }
                
                if character == "R" || character == "Q" {
                    
                    for k in 0..<count {
                        if elementAt(row: k, column: j) == "K" {
                            return true
                        }
                    }
                    
                    for k in 0..<self[i].count {
                        if elementAt(row: i, column: k) == "K" {
                            return true
                        }
                    }
                }
                
                if character == "B" || character == "Q" {
                    
                    var i2 = i > 0 ? i-1 : 0
                    var j2 = j > 0 ? j-1 : 0
                    
                    while i2 > 0 && j2 > 0 {
                        if elementAt(row: i2, column: j2) == "K" {
                            return true
                        }
                        
                        i2 -= 1
                        j2 -= 1
                    }
                    
                    i2 = i < count-1 ? i+1 : count-1
                    j2 = j < self[i].count-1 ? j+1 : self[i].count-1
                    
                    while i2 < count-1 && j2 < self[i2].count-1 {
                        if elementAt(row: i2, column: j2) == "K" {
                            return true
                        }
                        
                        i2 += 1
                        j2 += 1
                    }
                    
                    i2 = i < count-1 ? i+1 : count-1
                    j2 = j > 0 ? j-1 : 0
                    
                    while i2 < count && j2 < self[i2].count-1 {
                        if elementAt(row: i2, column: j2) == "K" {
                            return true
                        }
                        
                        i2 -= 1
                        j2 += 1
                    }
                    
                    i2 = i > 0 ? i-1 : 0
                    j2 = j < self[i].count-1 ? j+1 : self[i].count-1
                    
                    while i2 < count-1 && j2 > 0 {
                        if elementAt(row: i2, column: j2) == "K" {
                            return true
                        }
                        
                        i2 += 1
                        j2 -= 1
                    }
                }
                
                if character == "N" {
                    
                    if elementAt(row: i+2, column: j+3) == "K" || elementAt(row: i-2, column: j+3) == "K" || elementAt(row: i+2, column: j-3) == "K" || elementAt(row: i-2, column: j-3) == "K" {
                        return true
                    }
                }
            }
        }
        
        return false
    }
    
    func elementAt(row: Int, column: Int) -> Character? {
        
        if row < 0 || column < 0 || row > self.count-1 || column > self[row].count-1 {
            return nil
        }
        
        let result = self[row][column]
        
        return result == "." ? nil : result
    }
}
