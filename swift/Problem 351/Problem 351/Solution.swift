//
//  Solution.swift
//  Problem 351
//
//  Created by sebastien FOCK CHOW THO on 2020-05-10.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

struct QuoraChallenge {
    
    var meanings: [String: [String]]
    
    func meaning(of word: String, in sentence: String) -> [String] {
        
        guard meanings.keys.contains(word) else {
            fatalError("can't find \(word) in the bank")
        }
        
        // TODO: - This should be improve by removing common words such as "the", "a", etc.
        let allWords = sentence.split(separator: " ")
        let allMeanings = meanings[word]!
        
        var candidates: [String: Int] = [:]
        
        for aMeaning in allMeanings {
            
            if !candidates.keys.contains(aMeaning) {
                candidates[aMeaning] = 0
            }
        }
        
        for pair in candidates {
            
            for word in allWords {
                if pair.key.contains(word) {
                    candidates[pair.key] = candidates[pair.key]! + 1
                }
            }
        }
        
        var maxRef = 0
        
        for pair in candidates {
            if pair.value > maxRef {
                maxRef = pair.value
            }
        }
        
        var result: [String] = []
        
        for pair in candidates {
            if pair.value == maxRef {
                result.append(pair.key)
            }
        }
        
        return result
        
    }
}
