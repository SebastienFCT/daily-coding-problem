//
//  Solution.swift
//  Problem 54
//
//  Created by sebastien FOCK CHOW THO on 2019-07-18.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

extension Array where Element == Array<Int?> {
    
    func isValid(value: Int, position: (row: Int, column: Int)) -> Bool {
        // First check if the row is valid
        if self[position.row].contains(value) {
            return false
        }
        
        // Then check the column
        let column = self.map{ $0[position.column] }
        if column.contains(value) {
            return false
        }
        
        // Finally, determine the sub-grid the value is in
        if grid(position: position).contains(value: value) {
            return false
        }
        
        return true
    }
    
    func contains(value: Int) -> Bool {
        for row in self {
            if row.contains(value) {
                return true
            }
        }
        
        return false
    }
    
    func grid(position: (row: Int, column: Int)) -> [[Int?]] {
        var result: [[Int?]] = []
        
        switch (position.row, position.column) {
        case (0...2, 0...2):
            for i in 0...2 {
                let newRow = Swift.Array(self[i][0...2])
                result.append(newRow)
            }
        case (0...2, 3...5):
            for i in 0...2 {
                let newRow = Swift.Array(self[i][3...5])
                result.append(newRow)
            }
        case (0...2, 6...8):
            for i in 0...2 {
                let newRow = Swift.Array(self[i][6...8])
                result.append(newRow)
            }
        case (3...5, 0...2):
            for i in 3...5 {
                let newRow = Swift.Array(self[i][0...2])
                result.append(newRow)
            }
        case (3...5, 3...5):
            for i in 3...5 {
                let newRow = Swift.Array(self[i][3...5])
                result.append(newRow)
            }
        case (3...5, 6...8):
            for i in 3...5 {
                let newRow = Swift.Array(self[i][6...8])
                result.append(newRow)
            }
        case (6...8, 0...2):
            for i in 6...8 {
                let newRow = Swift.Array(self[i][0...2])
                result.append(newRow)
            }
        case (6...8, 3...5):
            for i in 6...8 {
                let newRow = Swift.Array(self[i][3...5])
                result.append(newRow)
            }
        case (6...8, 6...8):
            for i in 6...8 {
                let newRow = Swift.Array(self[i][6...8])
                result.append(newRow)
            }
        default:
            break
        }
        
        return result
    }
    
    func getGridPositions(position: (row: Int, column: Int)) -> [(row: Int, column: Int)] {
        var result: [(row: Int, column: Int)] = []
        
        switch (position.row, position.column) {
        case (0...2, 0...2):
            for i in 0...2 {
                for j in 0...2 {
                    result.append((i, j))
                }
            }
        case (0...2, 3...5):
            for i in 0...2 {
                for j in 3...5 {
                    result.append((i, j))
                }
            }
        case (0...2, 6...8):
            for i in 0...2 {
                for j in 6...8 {
                    result.append((i, j))
                }
            }
        case (3...5, 0...2):
            for i in 3...5 {
                for j in 0...2 {
                    result.append((i, j))
                }
            }
        case (3...5, 3...5):
            for i in 3...5 {
                for j in 3...5 {
                    result.append((i, j))
                }
            }
        case (3...5, 6...8):
            for i in 3...5 {
                for j in 6...8 {
                    result.append((i, j))
                }
            }
        case (6...8, 0...2):
            for i in 6...8 {
                for j in 0...2 {
                    result.append((i, j))
                }
            }
        case (6...8, 3...5):
            for i in 6...8 {
                for j in 3...5 {
                    result.append((i, j))
                }
            }
        case (6...8, 6...8):
            for i in 6...8 {
                for j in 6...8 {
                    result.append((i, j))
                }
            }
        default:
            break
        }
        
        return result
    }
}

extension Array where Element == Array<Int?> {
    
    func possibilities(position: (row: Int, column: Int)) -> [Int] {
        var result: [Int] = []
        
        for value in 1...9 {
            if isValid(value: value, position: position) {
                result.append(value)
            }
        }
        
        return result
    }
}

struct Sudoku {
    var board: [[Int?]]
    var possibilitiesBoard: [[[Int]]]
    
    mutating func refreshPossibilityBoard() {        
        for i in 0..<board.count {
            let row = board[i]
            for j in 0..<row.count {
                if board[i][j] == nil {
                    let possibilities = board.possibilities(position: (i, j))
                    possibilitiesBoard[i][j] = possibilities
                } else {
                    possibilitiesBoard[i][j] = []
                }
            }
        }
    }
    
    func getPossibilitiesToUpdate(updatedElement: (row: Int, column: Int)) -> [(row: Int, column: Int)] {
        var result: [(row: Int, column: Int)] = []
        
        result.append(updatedElement)
        
        for index in 0...8 {
            if (index != updatedElement.row) {
                result.append((index, updatedElement.column))
            }
            
            if (index != updatedElement.column) {
                result.append((updatedElement.row, index))
            }
        }
        
        for position in board.getGridPositions(position: updatedElement) {
            if !(position.row == updatedElement.row && position.column == updatedElement.column) {
                result.append(position)
            }
        }
        
        return result
    }
    
    mutating func set(value: Int, position: (row: Int, column: Int)) {
        board[position.row][position.column] = value
        
        refreshPossibilityBoard()
    }
    
    func findNextElementToFill() -> (row: Int, column: Int)? {
        var resultValue: Int? = nil
        var result: (row: Int, column: Int)? = nil
        
        for i in 0..<possibilitiesBoard.count {
            let row = possibilitiesBoard[i]
            for j in 0..<row.count {
                if (!possibilitiesBoard[i][j].isEmpty) {
                    if resultValue != nil {
                        if possibilitiesBoard[i][j].count > 0 && possibilitiesBoard[i][j].count < resultValue! {
                            resultValue = possibilitiesBoard[i][j].count
                            result = (i, j)
                            
                            if resultValue == 1 {
                                return result!
                            }
                        }
                    } else {
                        resultValue = possibilitiesBoard[i][j].count
                        result = (i, j)
                        
                        if resultValue == 1 {
                            return result!
                        }
                    }
                }
            }
        }
        
        return result
    }
}

extension Sudoku {
    mutating func proceed() {
        // We build the rankboard
        refreshPossibilityBoard()
        
        while true {
            guard let next = findNextElementToFill() else {
                print(board)
                return
            }
            
            let possibilities = board.possibilities(position: next)
            if let possibility = possibilities.first {
                set(value: possibility, position: next)
                print(board)
                print(possibilitiesBoard)
            }
        }
    }
}
