//
//  Solution.swift
//  Problem 349
//
//  Created by sebastien FOCK CHOW THO on 2020-05-08.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

struct Soundex {
    
    var similarConsonants: [Character: Character]
    
    func encode(word: String) -> String {
        
        if word.isEmpty {
            fatalError("input invalid")
        }
        
        if word.count == 1 {
            return "\(word.first!)000"
        }
        
        var copy = Array(word.lowercased())
        
        var indexesToRemove: [Int] = []
        
        var previous = copy.first!
        
        for i in 1..<copy.count {
            
            let areSimilar = similarConsonants.contains(where: { (tuple) -> Bool in
                (tuple.key == copy[i] && tuple.value == previous) || (tuple.key == previous && tuple.value == copy[i])
            })
            let areTheSame = copy[i] == previous
            
            if areTheSame || areSimilar {
                indexesToRemove.append(i)
            }
            
            previous = copy[i]
        }
        
        for index in indexesToRemove.reversed() {
            copy.remove(at: index)
        }
        
        indexesToRemove = []
        
        for i in 1..<copy.count {
            if "aeiouywh".contains(copy[i]) {
                indexesToRemove.append(i)
            }
        }
        
        for index in indexesToRemove.reversed() {
            copy.remove(at: index)
        }
        
        for i in 1..<copy.count {
            if "bfpv".contains(copy[i]) {
                copy[i] = "1"
                continue
            }
            
            if "cgjkqsxz".contains(copy[i]) {
                copy[i] = "2"
                continue
            }
            
            if "dt".contains(copy[i]) {
                copy[i] = "3"
                continue
            }
            
            if "l".contains(copy[i]) {
                copy[i] = "4"
                continue
            }
            
            if "mn".contains(copy[i]) {
                copy[i] = "5"
                continue
            }
            
            if "r".contains(copy[i]) {
                copy[i] = "6"
                continue
            }
        }
        
        if copy.count < 4 {
            while copy.count < 4 {
                copy.append("0")
            }
        }
        
        return String(copy.prefix(4))
    }
}
