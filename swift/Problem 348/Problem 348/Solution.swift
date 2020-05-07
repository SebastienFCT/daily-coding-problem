//
//  Solution.swift
//  Problem 348
//
//  Created by sebastien FOCK CHOW THO on 2020-05-07.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

class Node {
    var value: Character
    var left: Node?
    var center: Node?
    var right: Node?
    
    init(value: Character) {
        self.value = value
        self.left = nil
        self.center = nil
        self.right = nil
    }
    
    func search(word: String, current: [Node]) -> [Node]? {
        
        guard let firstCharacter = word.first else {
            return current
        }
        
        var newCurrent = current
        newCurrent.append(self)
        
        if value > firstCharacter {
            return left?.search(word: word, current: newCurrent)
        } else if value < firstCharacter {
            return right?.search(word: word, current: newCurrent)
        } else {
            if word.count == 1 {
                return newCurrent
            } else {
                return center?.search(word: String(word.suffix(word.count-1)), current: newCurrent)
            }
        }
    }
    
    func insert(word: String) {
        
        guard let firstCharacter = word.first else {
            return
        }
        
        if center == nil {
            
            let node = Node(value: firstCharacter)
            self.center = node
            self.center!.insert(word: String(word.suffix(word.count-1)))
            
        } else {
            
            if firstCharacter > value {
                
                if let right = right {
                    right.insert(word: word)
                } else {
                    let node = Node(value: firstCharacter)
                    self.right = node
                    self.right!.insert(word: String(word.suffix(word.count-1)))
                }
                
            } else if firstCharacter < value {
                
                if let left = left {
                    left.insert(word: word)
                } else {
                    let node = Node(value: firstCharacter)
                    self.left = node
                    self.left!.insert(word: String(word.suffix(word.count-1)))
                }
                
            } else {
                
                if let center = center {
                    center.insert(word: word)
                } else {
                    let node = Node(value: firstCharacter)
                    self.center = node
                    self.center!.insert(word: String(word.suffix(word.count-1)))
                }
                
            }
        }
    }
}

struct TernaryTree {
    
    var root: Node? = nil
    
    func search(word: String) -> [Node]? {
        
        return root?.search(word: word, current: [])
    }
    
    mutating func insert(word: String) {
        
        guard let firstCharacter = word.first else {
            return
        }
        
        if let root = root {
            root.insert(word: word)
        } else {
            
            let node = Node(value: firstCharacter)
            self.root = node
            self.root!.insert(word: String(word.suffix(word.count-1)))
        }
    }
}
