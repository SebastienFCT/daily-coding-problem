//
//  Solution.swift
//  Problem 139
//
//  Created by sebastien FOCK CHOW THO on 2019-10-11.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

protocol PeekableInterface {
    func peek() -> Any?
}

struct Iterator: PeekableInterface {
    var items: [Any] = []
    var currentIndex = 0

    func hasNext() -> Bool {
        return currentIndex < items.count-1
    }
    
    mutating func next() -> Any? {
        if currentIndex >= items.count {
            return nil
        }
        
        currentIndex += 1
        return items[currentIndex]
    }
    
    func peek() -> Any? {        
        if currentIndex >= items.count {
            return nil
        }
        
        return items[currentIndex+1]
    }
}
