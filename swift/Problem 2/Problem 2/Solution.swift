//
//  Solution.swift
//  Problem 2
//
//  Created by sebastien FOCK CHOW THO on 2019-06-09.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

/**
 
    Since I read the `follow up` question from the beginning, I got the obvious answer for this challenge:
 
    - Get the product of all elements and store it in a variable
    - Map the initial array to a new one that corresponds to the calculated product divided by the the item in the initial array
 
    Without this hint, I would have probably gone with a less efficient algorithm where I loop through each element and try to get a product of all element but the current one. This shows how valuable are the first "brain-storming" minutes for any challenge.
 */

extension Array where Element == Int {
    
    func productOfOthers() -> [Int] {
        let product = self.reduce(1){ $0 * $1 }
        
        return self.map{ product / $0 }
    }
}

/**
 
    So now, how to do this without division?
 
    Let's apply the solution mentioned before:
 
    - Create a empty array (the result)
    - Loop through your initial array and for each element
        - Create a copy of your initial array and remove the ith element
        - Store in your result array the product of the elements
 
 */

extension Array where Element == Int {
    
    func productOfOtherWithoutDivision() -> [Int] {
        var result: [Int] = []
        
        for i in 0...(self.count - 1) {
            var copy = self
            copy.remove(at: i)
            
            result.append(copy.reduce(1){ $0 * $1 })
        }
        
        return result
    }
}
