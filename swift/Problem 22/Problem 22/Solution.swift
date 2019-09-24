//
//  Solution.swift
//  Problem 22
//
//  Created by sebastien FOCK CHOW THO on 2019-06-18.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

extension String {
    func possibilities(from possiblities: [String]) -> [(String, String)] {
        var result: [(String, String)] = []
        
        for possiblitiy in possiblities {
            if self.prefix(possiblitiy.count) == possiblitiy {
                result.append((possiblitiy, String(self.suffix(self.count - possiblitiy.count))))
            }
        }
        
        return result
    }
}

class Node {
    var possibilities: [String]
    var values: [String]
    var rest: String
    var children: [Node]
    
    init(possibilities: [String], values: [String], rest: String) {
        self.possibilities = possibilities
        self.values = values
        self.rest = rest
        self.children = []
    }
    
    func buildChildren() {
        children = []
        
        for possibility in rest.possibilities(from: possibilities) {
            let child = Node(possibilities: possibilities, values: values + [possibility.0], rest: possibility.1)
            children.append(child)
        }
        
        for child in children {
            child.buildChildren()
        }
    }
    
    func findPath() -> [String]? {
        if rest.isEmpty {
            return values
        }
        
        if !children.isEmpty {
            for child in children {
                if let path = child.findPath() {
                    return path
                }
            }
        }
        
        return nil
    }
}
