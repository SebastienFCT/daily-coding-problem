//
//  Solution.swift
//  Problem 264
//
//  Created by sebastien FOCK CHOW THO on 2020-02-13.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

// Algorith taken from https://www.geeksforgeeks.org/de-bruijn-sequence-set-1/
// I didn't get the explanation.

struct DeBrujinSequence {
    
    var seen: Set<String>
    var edges: [Int]
    
    mutating func build(n: Int, characters: Set<Character>) -> String {
        let k = characters.count
        let string = characters.reduce(""){ "\($0)\($1)" }
        
        seen = Set<String>()
        edges = []
        
        let startingNode = buildString(length: n-1, withChar: string.first!)
        dfs(node: startingNode, k: k, string: string)
        
        var result = ""
        
        let edgesCount = Int(exactly: pow(Double(k), Double(n)))!
        
        for i in 0..<edgesCount {
            result += String(string[edges[i]])
        }
        
        result += startingNode
        
        return result
    }
    
    mutating private func dfs(node: String, k: Int, string: String) {
        for i in 0..<k {
            let value = "\(node)\(string[i])"
            if !seen.contains(value) {
                seen.insert(value)
                dfs(node: String(value.suffix(value.count-1)), k: k, string: string)
                edges.append(i)
            }
        }
    }
    
    private func buildString(length: Int, withChar: Character) -> String {
        
        var result = ""
        
        for _ in 0..<length {
            result += "\(withChar)"
        }
        
        return result
    }
}

extension StringProtocol {
    subscript(offset: Int) -> Character { self[index(startIndex, offsetBy: offset)] }
    subscript(range: Range<Int>) -> SubSequence {
        let startIndex = index(self.startIndex, offsetBy: range.lowerBound)
        return self[startIndex..<index(startIndex, offsetBy: range.count)]
    }
    subscript(range: ClosedRange<Int>) -> SubSequence {
        let startIndex = index(self.startIndex, offsetBy: range.lowerBound)
        return self[startIndex..<index(startIndex, offsetBy: range.count)]
    }
    subscript(range: PartialRangeFrom<Int>) -> SubSequence { self[index(startIndex, offsetBy: range.lowerBound)...] }
    subscript(range: PartialRangeThrough<Int>) -> SubSequence { self[...index(startIndex, offsetBy: range.upperBound)] }
    subscript(range: PartialRangeUpTo<Int>) -> SubSequence { self[..<index(startIndex, offsetBy: range.upperBound)] }
}
