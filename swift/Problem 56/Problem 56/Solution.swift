//
//  Solution.swift
//  Problem 56
//
//  Created by sebastien FOCK CHOW THO on 2019-07-20.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

/**
 
    I had no idead whatadjacency matrix adjacency matrix meant, so I look it up: https://en.wikipedia.org/wiki/Adjacency_matrix#Undirected_graphs
 
    The first graph in the abode link shows that the the node 4 has 3 relations (by looking at the column 4 or row 4, the node 6 has 1 relation, etc...
 
    It seems that max(sum(row)) gives us how many unique color (relation) are required minimum for not having adjacent vertexes with the same color
 
 */
extension Array where Element == Array<Int> {
    
    func isValid(k: Int) -> Bool {
        for row in self {
            if row.reduce(0, +) > k {
                print(row.reduce(0, +))
                return false
            }
        }
        
        return true
    }
}
