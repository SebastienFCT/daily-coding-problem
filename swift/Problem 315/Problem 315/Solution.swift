//
//  Solution.swift
//  Problem 315
//
//  Created by sebastien FOCK CHOW THO on 2020-04-04.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

typealias Position = (row: Int, column: Int)

extension Array where Element == Array<Int> {
    
    
    func isToeplitz() -> Bool {
        
        for i in stride(from: count-1, through: 0, by: -1) {
            
            var row = i
            var column = 0
            var nextVal: (value: Int, pos: Position)? = (self[row][column], (row, column))
            
            guard let value = nextVal?.value else {
                fatalError("logic failed")
            }
            
            while nextVal != nil {
                if nextVal?.value != value {
                    return false
                }
                
                row = nextVal!.pos.row
                column = nextVal!.pos.column
                nextVal = next(current: nextVal!.pos)
            }
        }
        
        for i in 1..<count {
            
            var row = 0
            var column = i
            
            var nextVal: (value: Int, pos: Position)? = (self[row][column], (row, column))
            
            guard let value = nextVal?.value else {
                fatalError("logic failed")
            }
            
            while nextVal != nil {
                if nextVal?.value != value {
                    return false
                }
                
                row = nextVal!.pos.row
                column = nextVal!.pos.column
                nextVal = next(current: nextVal!.pos)
            }
        }
        
        return true
    }
    
    private func next(current: Position) -> (value: Int, pos: Position)? {
        
        guard current.row < count-1 && current.column < count-1 else {
            return nil
        }
        
        return (self[current.row+1][current.column+1], (current.row+1, current.column+1))
    }
}
