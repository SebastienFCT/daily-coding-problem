//
//  Solution.swift
//  Problem 57
//
//  Created by sebastien FOCK CHOW THO on 2019-07-21.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

/**
 
    We're given a string and we want to distribute its words in lines of k length
 
    - First we will split the string into words (using spaces as a splitting reference)
    - Then we will loop through the words and append them to array of string, each string representing a row
 
 */
extension String {
    func distribute(k: Int) -> [String]? {
        
        let splitted = self.split(separator: " ")
        
        print("splitted: \(splitted)")
        
        var result: [String] = []
        var line = ""
        
        for i in 0..<splitted.count {
            let word = splitted[i]
            
            guard String(word).count <= k else {
                return nil
            }
            
            if line.isEmpty {
                line.append(String(word))
            } else {
                // + 1 for the space in between
                if line.count + String(word).count + 1 > k {
                    result.append(line)
                    line = String(word)
                } else {
                    line += " \(String(word))"
                }
            }
            
            if i == splitted.count-1 && !line.isEmpty {
                result.append(line)
            }
        }
        
        return result
    }
}
