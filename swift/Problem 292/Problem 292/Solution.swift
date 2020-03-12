//
//  Solution.swift
//  Problem 292
//
//  Created by sebastien FOCK CHOW THO on 2020-03-12.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

struct Class {
    
    var students: [(key: Int, value: [Int])]
    
    func divide(currentLeft: [Int]? = nil, currentRight: [Int]? = nil, studentLeft: [(key: Int, value: [Int])]? = nil) -> (left: [Int], right: [Int])? {
        
        if let studentLeft = studentLeft,  studentLeft.isEmpty {
            return (left: currentLeft!, right: currentRight!)
        }
        
        let leftStudent = studentLeft ?? students
        var sortedLeftStudent = leftStudent.sorted{ $0.value.count > $1.value.count }
        var left = currentLeft ?? []
        var right = currentRight ?? []
        
        let pair = sortedLeftStudent.removeFirst()
        
        if !left.contains(pair.key) {
            
            if !right.contains(pair.key) {
                right.append(pair.key)
            }
            
            for ennemy in pair.value {
                if right.contains(ennemy) {
                    return nil
                } else {
                    if !left.contains(ennemy) {
                        left.append(ennemy)
                    }
                }
            }
            
            if let candidate = divide(currentLeft: left, currentRight: right, studentLeft: sortedLeftStudent) {
                return candidate
            }
        }
        
        left = currentLeft ?? []
        right = currentRight ?? []
        
        if !right.contains(pair.key) {
            
            if !left.contains(pair.key) {
                left.append(pair.key)
            }
            
            for ennemy in pair.value {
                if left.contains(ennemy) {
                    return nil
                } else {
                    if !right.contains(ennemy) {
                        right.append(ennemy)
                    }
                }
            }
            
            if let candidate = divide(currentLeft: left, currentRight: right, studentLeft: sortedLeftStudent) {
                return candidate
            }
        }
        
        return nil
    }
}
