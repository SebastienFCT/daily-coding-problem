//
//  Solution.swift
//  Problem 107
//
//  Created by sebastien FOCK CHOW THO on 2019-09-09.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

class Node<T> {
    var value: T
    var left: Node<T>?
    var right: Node<T>?
    
    init(value: T, left: Node<T>?, right: Node<T>?) {
        self.value = value
        self.left = left
        self.right = right
    }
    
    func printTree(level: Int = 0) {
        let dictionary = valuesToDictionary()
        let sortedKeys = dictionary.keys.sorted{ $0 < $1 }
        
        var result = ""
        
        for key in sortedKeys {
            for value in dictionary[key]! {
                result += value
            }
        }
        
        print(result.prefix(result.count-1))
    }
    
    private func valuesToDictionary(level: Int = 0) -> [Int : [String]] {
        var result: [Int : [String]] = [:]
        
        result[level] = ["\(value),"]
        
        if let left = left {
            let leftDictionary = left.valuesToDictionary(level: level+1)
            
            for key in leftDictionary.keys {
                if !result.keys.contains(key) {
                    result[key] = []
                }
                
                for leftKey in leftDictionary[key]! {
                    result[key]!.append("\(leftKey)")
                }
            }
        }
        
        if let right = right {
            let rightDictionary = right.valuesToDictionary(level: level+1)
            
            for key in rightDictionary.keys {
                if !result.keys.contains(key) {
                    result[key] = []
                }
                
                for rightKey in rightDictionary[key]! {
                    result[key]!.append("\(rightKey)")
                }
            }
        }
        
        return result
    }
}
