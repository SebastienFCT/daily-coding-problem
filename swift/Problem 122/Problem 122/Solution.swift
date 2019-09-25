//
//  Solution.swift
//  Problem 122
//
//  Created by sebastien FOCK CHOW THO on 2019-09-24.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

extension Array where Element == Array<Int> {
    
    typealias Position = (row: Int, column: Int)
    
    func findMaximumPath() -> PathResult? {
        
        let initialPosition: PathResult = ([(row: 0, column: 0)], self[0][0])
        let candidates = next(path: initialPosition)
        
        return candidates.sorted{ $0.sum > $1.sum }.first
    }
    
    typealias PathResult = (positions: [Position], sum: Int)
    
    func next(path: PathResult) -> [PathResult] {
        var candidates: [PathResult] = []
        
        
        if let current = path.positions.last {
            
            if current.row == self.count-1 && current.column == self[0].count-1 {
                return [path]
            }
            
            if current.row < self.count-1 {
                let newPos = (row: current.row+1, column: current.column)
                
                var candidate = path
                candidate.positions.append(newPos)
                candidate.sum += self[newPos.row][newPos.column]
                
                candidates.append(contentsOf: next(path: candidate))
            }
            
            if current.column < self[0].count-1 {
                let newPos = (row: current.row, column: current.column+1)
                
                var candidate = path
                candidate.positions.append(newPos)
                candidate.sum += self[newPos.row][newPos.column]
                
                candidates.append(contentsOf: next(path: candidate))
            }
        }
        
        return candidates
    }
}
