//
//  Solution.swift
//  Problem 166
//
//  Created by sebastien FOCK CHOW THO on 2019-11-07.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

class Iterator2D {
    var elements: [[Int]]
    var parentIndex: Int
    var index: Int
    
    init(elements: [[Int]]) {
        self.elements = elements
        self.parentIndex = 0
        self.index = -1
    }
    
    func next() -> Int? {
        
        if !has_next() {
            return nil
        }
        
        return nextElement()
    }
    
    private func nextElement() -> Int? {
        if index >= elements[parentIndex].count-1 {
            index = 0
            parentIndex += 1
        } else {
            index += 1
        }
        
        if elements[parentIndex].isEmpty {
            return nextElement()
        }
        
        return elements[parentIndex][index]
    }
    
    func has_next() -> Bool {
        return hasNextFrom(parentIndex: self.parentIndex, index: self.index)
    }
    
    private func hasNextFrom(parentIndex: Int, index: Int) -> Bool {
        if parentIndex > elements.count-1  {
            return false
        }
        
        if index >= elements[parentIndex].count-1 {
            return hasNextFrom(parentIndex: parentIndex+1, index: 0)
        }
        
        if elements[parentIndex].isEmpty {
            
            if parentIndex <= elements.count {
                return hasNextFrom(parentIndex: parentIndex+1, index: 0)
            } else {
                return false
            }
        }
        
        return true
    }
}

