//
//  Solution.swift
//  Problem 22
//
//  Created by sebastien FOCK CHOW THO on 2019-06-18.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

/**
 
 First thought is: it's simple, since I can return any combination, I just have to loop through the array of work and stop every time I catch a word
 
 But this won't work for something like this:
 - Possibilities: ["ab", "a", "b", "bc"]
 - Input: "abc", as the algorithm would find "ab" and then would stuck on the "c" (while ["a", "bc"] is possible)
 
 So then I'm thinking sorting my array of possibilities per length:
 - Possibilities: ["ab", "a", "b", "bc"]
 - Transformed = ["a", "b", "ab", "bc"]
 - Input: "abc"
 But the same problem happens: it would return ["a", "b"] and then get stuck.
 
 So then, I'm thinking brute force:
 I create a recursive function that will progressively build my output and everytime it get stucks, it tries a different path
 But here, I feel like it would be way too agresive: it works fine when I just need to change the path of the last node, but what if all path for the node N aren't working? I should loop back to the previous node and check if there is any alternative and if not I keep looping back
 
 Rather than looping back indefinitively (and keeping track of it to avoid duplicate paths), I should probably try to build all possible paths
 I will basically build a function that takes a string as input and return a list of (a: string, b: string) where a is a possibility pulled and b the "rest" of the input
 
 */

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

/**
 
 Let's build a structure that can holds it's children possibilities with their rest
 
 */

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
            
            // I realized after testing that I forgot this part: each child must build its own chilren
            
            for child in children {
                child.buildChildren()
            }
        }
    }
}

/**
 
 Now we should be close to the end: we need to write a function that search for a given node if there is a path where the rest is empty (we only need one possibility)
 
 */

extension Node {
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
