//
//  Solution.swift
//  Problem 253
//
//  Created by sebastien FOCK CHOW THO on 2020-02-02.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

struct Zigzag {
    
    func printZigzag(value: String, lines k: Int) {
        let lines = build2(value: value, lines: k)
        
        let mapped = lines.map{ $0.reduce("") { "\($0)\($1)" } }
        for line in mapped {
            print(line)
        }
    }
    
    func build2(value: String, lines k: Int) -> [[Character]] {
        
        var lines: [[Character]] = []
        for _ in 1...k {
            lines.append([])
        }
        
        var currentLine = 0
        var ascending = true
        
        for character in value {
            
            for i in 0..<lines.count {
                if i == currentLine {
                    lines[i].append(character)
                } else {
                    lines[i].append(" ")
                }
            }
            
            if ascending {
                currentLine += 1
                if currentLine == k-1 { ascending.toggle() }
            } else {
                currentLine -= 1
                if currentLine == 0 { ascending.toggle() }
            }
        }
        
        return lines
    }
}
