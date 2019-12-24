//
//  Solution.swift
//  Problem 212
//
//  Created by sebastien FOCK CHOW THO on 2019-12-23.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

struct Spreadsheet {
    
    var abc = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K" , "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
    
    func columnName(value: Int) -> String {
        
        var result = ""
        
        var current = value
        
        while current > 26 {
            
            let residue = current / 26
            current -= residue * 26
            
            result += abc[residue-1]
            
        }
        
        if current > 0 {
            result += abc[current-1]
        }
        
        
        return result
    }
}
