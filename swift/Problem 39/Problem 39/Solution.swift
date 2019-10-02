//
//  Solution.swift
//  Problem 39
//
//  Created by sebastien FOCK CHOW THO on 2019-07-03.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

extension Array where Element == Array<Character> {
    
    func neighbourCount(row: Int, column: Int) -> (live: Int, dead: Int) {
        var liveCellCount = 0
        var deadCellCount = 0
        
        for i in row-1...row+1 {
            for j in column-1...column+1 {
                if let isNeighbourAlive = isCellAlive(row: i, column: j) {
                    if i == row && j == row { continue }
                    
                    if isNeighbourAlive {
                        liveCellCount += 1
                    } else {
                        deadCellCount += 1
                    }
                }
            }
        }
        
        return (liveCellCount, deadCellCount)
    }
    
    // This convenient function avoid us to check if the neighbour cell exists (out of bound exceptions)
    func isCellAlive(row: Int, column: Int) -> Bool? {
        guard row >= 0 && column >= 0 else {
            return nil
        }
        
        if row == self.count || column == self[0].count {
            return nil
        }
        
        return self[row][column] == "*"
    }
    
    mutating func gameOfLive(iterations: Int) {
        for _ in 0..<iterations {
            
            for i in 0..<self.count {
                self[i].insert(" ", at: 0)
                self[i].append(" ")
            }
            
            var emptyRow: [Character] = []
            for _ in 0..<self[0].count {
                emptyRow.append(" ")
            }
            
            self.insert(emptyRow, at: 0)
            self.append(emptyRow)
            
            var copy = self
            
            for i in 0..<self.count {
                for j in 0..<self[0].count {
                    switch self[i][j] {
                    case "*":
                        if self.neighbourCount(row: i, column: j).live != 2 && self.neighbourCount(row: i, column: j).live != 3 {
                            copy[i][j] = "."
                        }
                    case ".":
                        if self.neighbourCount(row: i, column: j).live == 3 {
                            copy[i][j] = "*"
                        }
                    default:
                        break
                    }
                }
            }
            
            self = copy
            self.minimize()
            print(self)
        }
    }
    
    mutating func minimize() {
        while true {
            if (self.map{ $0.first ?? "." }.filter{ $0 != " " }.count == 0) {
                for i in 0..<self.count {
                    self[i].removeFirst()
                }
            } else {
                break
            }
        }
        
        while true {
            if (self.map{ $0.last ?? "." }.filter{ $0 != " " }.count == 0) {
                for i in 0..<self.count {
                    self[i].removeLast()
                }
            } else {
                break
            }
        }
        
        while true {
            if (self[0].filter{ $0 != " " }.count == 0) {
                self.removeFirst()
            } else {
                break
            }
        }
        
        while true {
            if let last = self.last {
                if (last.filter{ $0 != " " }.count == 0) {
                    self.removeLast()
                } else {
                    break
                }
            } else {
                break
            }
        }
    }
}
