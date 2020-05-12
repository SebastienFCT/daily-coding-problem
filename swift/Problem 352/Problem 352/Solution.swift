//
//  Solution.swift
//  Problem 352
//
//  Created by sebastien FOCK CHOW THO on 2020-05-11.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

extension Array where Element == [Character] {
    
    // Let's assume a black square is represented by '_'
    func isValidCrosswordGrid() -> Bool {
        
        guard count >= 3 else {
            print("No word can be fewer than three letters long.")
            return false
        }
        
        guard count == self[0].count else {
            print("invalid input")
            return false
        }
        
        for i in 0..<count {
            for j in 0..<self[i].count {
                if self[i][j] == "_" {
                    guard isValidBlackSquare(row: i, column: j) else {
                        print("No word can be fewer than three letters long.")
                        print("Every white square must be reachable from every other white square.")
                        print("i = \(i), j = \(j)")
                        return false
                    }
                }
            }
        }

        var topLeft: [[Character]] = []
        var topRight: [[Character]] = []
        var bottomRight: [[Character]] = []
        var bottomLeft: [[Character]] = []
        
        var limit = count / 2
        
        if count % 2 != 0 {
            limit += 1
        }
        
        for i in 0..<limit {
            var topLeftRow: [Character] = []
            var topRightRow: [Character] = []
            
            for j in 0..<limit {
                topLeftRow.append(self[i][j])
            }
            
            for j in count/2..<count {
                topRightRow.append(self[i][j])
            }
            
            topLeft.append(topLeftRow)
            topRight.append(topRightRow)
        }
        
        for i in count/2..<count {
            var bottomLeftRow: [Character] = []
            var bottomRightRow: [Character] = []
            
            for j in 0..<limit {
                bottomLeftRow.append(self[i][j])
            }
            
            for j in count/2..<count {
                bottomRightRow.append(self[i][j])
            }
            
            bottomLeft.append(bottomLeftRow)
            bottomRight.append(bottomRightRow)
        }
        
        guard bottomLeft.rotate().rotate() == topRight else {
            print("a")
            return false
        }
        
        guard bottomRight.rotate().rotate() == topLeft else {
            print("b")
            return false
        }
        
        return true
    }
    
    func isValidBlackSquare(row: Int, column: Int) -> Bool {
        
        if row != count-1 && row > count-4 {
            if self[row+1][column] != "_" {
                return false
            }
        }
        
        if column != count-1 && column > count-4 {
            if self[row][column+1] != "_" {
                return false
            }
        }
        
        if row != count-1 {
            if self[row+1][column] != "_" {
                if (self[row+1][column] == "_" || self[row+2][column] == "_" || self[row+3][column] == "_") {
                    return false
                }
            }
        }
        
        if column != count-1 {
            if self[row][column+1] != "_" {
                if (self[row][column+1] == "_" || self[row][column+2] == "_" || self[row][column+3] == "_") {
                    return false
                }
            }
        }
        
        return true
    }
    
    func forPrinting() -> String {
        
        var result = ""
        
        for i in 0..<count {
            result += "\(self[i])\n"
        }
        
        return result
    }
    
    func rotate() -> [[Character]] {
        
        var result = self
        
        let x = count/2
        let y = count-1
        
        for i in 0..<x {
            for j in i..<count-1-i {
                result[i][j] = self[y-j][i]
                result[y-j][i] = self[y-i][y-j]
                result[y-i][y-j] = self[j][y-i]
                result[j][y-i] = self[i][j]
            }
        }
        
        return result
        
    }
}
