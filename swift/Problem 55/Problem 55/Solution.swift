//
//  Solution.swift
//  Problem 55
//
//  Created by sebastien FOCK CHOW THO on 2019-07-20.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

var base64 = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"

struct URLShortener {
    var dictionary: [String: String]
    var reverse: [String: String]
    
    mutating func add(url: String) -> String {
        
        // If it already has the url, return the shortened version
        if reverse.keys.contains(url) {
            return reverse[url]!
        }
        
        let id = buildUniqueId()
        dictionary[id] = url
        reverse[url] = id
        
        return id
    }
    
    private func buildUniqueId() -> String {
        var result = ""
        
        // This should be an area of improvement where we control a cache and restrict how many url we're keeping
        guard Double(dictionary.count) < pow(2.0, 64) else {
            fatalError("your dictionary is full")
        }
        
        while true {
            for _ in 0...5 {
                let random = Int.random(in: 0...61)
                let randomCharacter = base64[base64.index(base64.startIndex, offsetBy: random)]
                result.append(randomCharacter)
            }
            
            if !dictionary.keys.contains(result) {
                return result
            } else {
                result = ""
            }
        }
    }
}


