//
//  Solution.swift
//  Problem 231
//
//  Created by sebastien FOCK CHOW THO on 2020-01-11.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

extension String {
    
    func rearrangeWithoutAdjacentDuplicates() -> Any {
        
        let arrayOfCharacters = Array(self)
        let distribution = arrayOfCharacters.repartition()
        
        do {
            let result = try distribution.distributeWithoutAdjacentDuplicates()
            
            return String(result)
        } catch {
            return false
        }
    }
}

extension Array where Element == Character {
    
    func repartition() -> [Character: Int] {
        
        var result: [Character: Int] = [:]
        
        for character in self {
            if result.keys.contains(character) {
                result[character]! += 1
            } else {
                result[character] = 1
            }
        }
        
        return result
    }
}

enum CustomError: Swift.Error {
    case InvalidInput
}

extension Dictionary where Key == Character, Value == Int {
    
    func distributeWithoutAdjacentDuplicates() throws -> [Character] {
        
        var result: [Character] = []
        var repartition = self
        
        while !repartition.isEmpty {
            
            let sorted = repartition.sorted{ $0.value > $1.value }
            let sortedkeys = sorted.map{ $0.key }
            
            if result.isEmpty || sortedkeys.first! != result.last! {
                let current = sortedkeys.first!
                result.append(current)
                
                if repartition[current]! > 1 {
                    repartition[current]! -= 1
                } else {
                    repartition.removeValue(forKey: current)
                }
            } else {
                if sortedkeys.count == 1 {
                    throw CustomError.InvalidInput
                } else {
                    let current = sortedkeys[1]
                    result.append(current)
                    
                    if repartition[current]! > 1 {
                        repartition[current]! -= 1
                    } else {
                        repartition.removeValue(forKey: current)
                    }
                }
            }
            
        }
        
        return result
    }
}
