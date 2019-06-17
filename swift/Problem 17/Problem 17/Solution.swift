//
//  Solution.swift
//  Problem 17
//
//  Created by sebastien FOCK CHOW THO on 2019-06-16.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

struct FileSystem {
    var root: Item? = nil
    
    init() {
        self.root = nil
    }
    
    mutating func buildFileSystemFromString(_ string: String) {
        var rootVal = ""
        var string = string
        
        while string != "\\" {
            rootVal += String(string.first!)
            string = String(string.dropFirst())
            
            if string.isEmpty {
                return
            }
            
            root = Item(parent: nil, name: rootVal, level: 1)
            root!.buildChildren(withString: string)
            return
        }
    }
}

class Item {
    var parent: Item? = nil
    var name: String
    var level: Int
    var children: [Item] = []
    
    init(parent: Item?, name: String, level: Int) {
        self.parent = parent
        self.name = name
        self.level = level
    }
    
    func buildChildren(withString string: String) {
        var string = self.name
        var previous = self
        
        while string.first! != "\\" {
            string = String(string.dropFirst())
            
            if string.isEmpty {
                break
            }
        }
        
        while !string.isEmpty {
            print(string)
            if String(string[string.index(string.startIndex, offsetBy: 2 + 2 * previous.level)]) != "\n\(String(repeating: "\t", count: previous.level))" {
                
                if let parent = previous.parent {
                    previous = parent
                    continue
                } else {
                    fatalError("could not identify parent")
                }
            } else {
                if String(string[string.index(string.startIndex, offsetBy: 2 + 2 * previous.level)]) == "\n\(String(repeating: "\t", count: previous.level))" {
                    _ = string.dropFirst(2 + 2 * previous.level)
                    continue
                }
                
                var rest = string.split(separator: "\n", maxSplits: 1, omittingEmptySubsequences: true)
                
                let item = Item(parent: previous, name: String(rest[0]), level: previous.level + 1)
                previous.children.append(item)
                previous = item
                
                string = String(string.dropFirst(rest[0].count))
            }
        }
    }
}
