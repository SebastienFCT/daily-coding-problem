//
//  Solution.swift
//  Problem 28
//
//  Created by sebastien FOCK CHOW THO on 2019-06-23.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

extension Array where Element == String {
    func justify(withMaxLength length: Int) -> [[String]] {
        var matrix = getMatrixForJustifying(withMaxLenght: length)
        
        for i in 0...matrix.count-1 {
            var row = matrix[i]
            
            let remainingSpace = length - row.reduce(0, { $0 + $1.count })
            
            if row.count == 1 {
                row[0] += String(repeating: " ", count: remainingSpace)
                matrix[i] = row
                continue
            }
            
            var wordIndex = 0
            
            if remainingSpace > 0 {
                for _ in 0...remainingSpace-1 {
                    row[wordIndex] += " "
                    
                    wordIndex += 1
                    if wordIndex == row.count-1 { wordIndex = 0 }
                }
            }
            
            matrix[i] = row
        }
        
        return matrix
    }
    
    func getMatrixForJustifying(withMaxLenght length: Int) -> [[String]] {
        var result: [[String]] = []
        
        var row: [String] = []
        var rowContent = ""
        
        for word in self {
            if rowContent.count + (row.count-1) + word.count > length {
                result.append(row)
                row = []
                rowContent = ""
            }
            
            row.append(word)
            rowContent += word
        }
        
        if row.count > 0 {
            result.append(row)
        }
        
        return result
    }
}
