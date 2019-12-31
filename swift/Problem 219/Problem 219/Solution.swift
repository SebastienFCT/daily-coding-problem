//
//  Solution.swift
//  Problem 219
//
//  Created by sebastien FOCK CHOW THO on 2019-12-30.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

struct Connect4 {
    
    enum Connect4Error: Error {
        case invalidColumn
        case columnFull
    }
    
    enum CellType: String {
        case empty = "_"
        case red = "R"
        case black = "B"
    }
    
    var board: [[CellType]] = [
        [.empty, .empty, .empty, .empty, .empty, .empty, .empty],
        [.empty, .empty, .empty, .empty, .empty, .empty, .empty],
        [.empty, .empty, .empty, .empty, .empty, .empty, .empty],
        [.empty, .empty, .empty, .empty, .empty, .empty, .empty],
        [.empty, .empty, .empty, .empty, .empty, .empty, .empty],
        [.empty, .empty, .empty, .empty, .empty, .empty, .empty]
    ]
}

// MARK: - Actions

extension Connect4 {
    
    mutating func drop(type: CellType, column: Int, printResult: Bool = true) throws {
        
        guard column >= 0, column <= 6 else {
            throw Connect4Error.invalidColumn
        }
        
        guard let cell = board[column].first, cell == .empty else {
            throw Connect4Error.columnFull
        }
        
        var index = 0
        
        for i in 0...5 {

            if board[i][column] != .empty {
                break
            }
            
            index = i
        }
        
        board[index][column] = type
        
        if printResult { printBoard() }
        
        print("---------------")
        
        if didWin(column: column) {
            print("\(type.rawValue) WON 🏁 🏁")
        } else {
            if isDraw() {
                print("DRAW 🎌 🎌")
            } else {
                print("KEEP PLAYING 🚩 🚩")
            }
        }
        
        print("")
    }
}

// MARK: - Utilities

extension Connect4 {
    
    typealias Position = (row: Int, column: Int)
    
    func isPositionValid(_ position: Position) -> Bool {
        
        return position.row > 0 && position.row < 6 && position.column > 0 && position.column < 5
    }
    
    func didWin(column: Int) -> Bool {
        
        var row = 0
        var type = CellType.empty
        
        for i in 0...5 {

            if board[i][column] != .empty {
                row = i
                type = board[i][column]
            }
        }
        
        // Horizontally
        
        var horizontalCount = 1
        
        if column > 0 {
            for i in stride(from: column-1, through: 0, by: -1) {
                if board[row][i] == type {
                    horizontalCount += 1
                } else {
                    break
                }
            }
        }
        
        if column < 6 {
            for i in column+1...6 {
                if board[row][i] == type {
                    horizontalCount += 1
                } else {
                    break
                }
            }
        }
        
        if horizontalCount >= 4 {
            return true
        }
        
        // Vertically
        
        var verticalCount = 1
        
        if row > 0 {
            for i in stride(from: row-1, through: 0, by: -1) {
                if board[i][column] == type {
                    verticalCount += 1
                } else {
                    break
                }
            }
        }
        
        if row < 5 {
            for i in row+1...5 {
                if board[i][column] == type {
                    verticalCount += 1
                } else {
                    break
                }
            }
        }
        
        if verticalCount >= 4 {
            return true
        }
        
        // First diagonal
        
        var d1 = 1
        var position: Position = (row-1, column-1)
        
        while isPositionValid(position) {
            if board[position.row][position.column] == type {
                d1 += 1
            } else {
                break
            }
            
            position = (position.row-1, position.column-1)
        }
        
        position = (row+1, column+1)
        
        while isPositionValid(position) {
            if board[position.row][position.column] == type {
                d1 += 1
            } else {
                break
            }
            
            position = (position.row+1, position.column+1)
        }
        
        if d1 >= 4 {
            return true
        }
        
        // Second diagonal
        
        var d2 = 1
        position = (row-1, column+1)
        
        while isPositionValid(position) {
            if board[position.row][position.column] == type {
                d2 += 1
            } else {
                break
            }
            
            position = (position.row-1, position.column+1)
        }
        
        position = (row+1, column-1)
        
        while isPositionValid(position) {
            if board[position.row][position.column] == type {
                d2 += 1
            } else {
                break
            }
            
            position = (position.row+1, position.column-1)
        }
        
        if d2 >= 4 {
            return true
        }
        
        return false
    }
    
    func isDraw() -> Bool {
        return !board[0].contains(.empty)
    }
    
    func printBoard() {
        for row in board {
            let mapped = row.map{ $0.rawValue }
            let converted = "|\(mapped.joined(separator: "|"))|"
            print(converted)
        }
    }
}
