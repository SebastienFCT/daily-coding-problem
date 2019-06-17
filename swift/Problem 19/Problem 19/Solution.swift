//
//  Solution.swift
//  Problem 19
//
//  Created by sebastien FOCK CHOW THO on 2019-06-17.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

extension Array where Element == Array<Int> {
    //      k1  k2  k3
    // n0   0   1   2
    // n1   3   2   1
    // n2   0   9   1
    
    // Reading:
    // To build house n1 with color k2 would cost me 2
    
    func optimum() -> [String] {
        var result: [String] = []
        
        for i in 0...self.count-1 {
            let pricing = self[i]
            
            result.append("color \(pricing.min() ?? 0)")
        }
        
        return result
    }
    
    // First let's try the "naive" way where we just ignore the previous color in our current selection
    // (we know that this won't give us the optimum as sometimes taking the largest value for the house n can save us more on the selection of house n+1
    
    func optimumWithDistinctNeighborsV1() -> [String] {
        var result: [String] = []
        
        var lastIndex: Int? = nil
        
        for i in 0...self.count-1 {
            var pricing = self[i]
            
            if let lastIndex = lastIndex {
                pricing[lastIndex] = Int.max
            }
            
            var selectedElement: (offset: Int, element: Int)? = nil
            
            for element in pricing.enumerated() {
                if selectedElement == nil {
                    selectedElement = element
                } else {
                    if element.element < selectedElement!.element {
                        selectedElement = element
                    }
                }
            }
            
            result.append("color \(selectedElement!.element)")
            lastIndex = selectedElement!.offset
            
        }
        
        return result
    }
}
