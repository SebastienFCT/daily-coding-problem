//
//  Solution.swift
//  Problem 82
//
//  Created by sebastien FOCK CHOW THO on 2019-08-15.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

/**
 
    Once you have your function read7(), you just have to do a readN() = [read7() * N/7], compile the result together and returns the first N characters
 
 */
struct MicrosoftChallenge {
    var filename: String
    var ext: String
    
    var count = 0
    var remaining = ""
    
    mutating func read7() -> String? {
        
        if let bundle = Bundle(identifier: "com.sebfct.Problem-82"), let path = bundle.url(forResource: filename, withExtension: ext) {
            
            if let content = try? String(contentsOf: path, encoding: .utf8) {
                count += 1
                let text = String(content.prefix(count * 7))
                return String(text.suffix(7))
            }
        }
        
        return nil
    }
    
    // Utitility function to call once the multiple reading is done
    
    mutating func reset() {
        count = 0
    }
    
    mutating func readN(n: Int) -> String {
        // Handle the case where remaining is not empty
        if !remaining.isEmpty {
            let copy = remaining
            remaining = ""
            return "\(copy)\(readN(n: n-copy.count))"
        }
        
        var result = ""
        
        // This limit corresponds to "how many time do I have to run read7()?"
        let limit = (n%7 == 0) ? (n / 7) : (n / 7) + 1
        
        for _ in 1...limit {
            if let intermediate = read7() {
                result.append(intermediate)
            }
        }
        
        // Best case: If N is a multiple of 7, we just return the rest
        if n % 7 == 0 {
            return result
        } else {
            // If the other case, we need to properly set the remaining so that if the user reads again it will be taken into consideration
            if n > 7 {
                remaining = String(result.suffix((n%7)+1))
                return String(result.prefix(n))
            } else {
                remaining = String(result.suffix(7-n+1))
                return String(result.prefix(n))
            }
        }
    }
}
