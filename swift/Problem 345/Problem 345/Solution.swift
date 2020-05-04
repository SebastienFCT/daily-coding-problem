//
//  Solution.swift
//  Problem 345
//
//  Created by sebastien FOCK CHOW THO on 2020-05-04.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

typealias Synonym = (String, String)

func areTheSame(left: String, right: String, synonyms: [Synonym], connectSynonyms: Bool) -> Bool {
    
    let leftWords = left.trimmingCharacters(in: CharacterSet.punctuationCharacters).split(separator: " ")
    let rightWords = right.trimmingCharacters(in: CharacterSet.punctuationCharacters).split(separator: " ")
    
    guard leftWords.count == rightWords.count else {
        return false
    }
    
    if !connectSynonyms {
        for i in 0..<leftWords.count {
            
            if leftWords[i] == rightWords[i] { continue }
            
            guard synonyms.contains(where: { (element) -> Bool in
                (element.0 == leftWords[i] && element.1 == rightWords[i]) || (element.1 == leftWords[i] && element.0 == rightWords[i])
            }) else {
                return false
            }
        }
    } else {
        
    }
    
    return true
}

func areSynonyms(left: String, right: String, withConnectedSynonyms synonyms: [Synonym], seen: [String]) -> Bool {
    
    var candidates: [String] = []
    
    if synonyms.contains(where: { (element) -> Bool in
        (element.0 == left && element.1 == right) || (element.1 == left && element.0 == right)
    }) {
        return true
    }
    
    var newSeens = seen
    
    for synonym in synonyms {
        if (synonym.0 == left && synonym.1 == right) || (synonym.1 == left && synonym.0 == right) {
            return true
        }
        
        if synonym.0 == left && !seen.contains(where: { (item) -> Bool in
            item == synonym.1
        }) {
            newSeens.append(synonym.1)
            candidates.append(synonym.1)
        }
        
        if synonym.1 == left && !seen.contains(where: { (item) -> Bool in
            item == synonym.0
        }) {
            newSeens.append(synonym.0)
            candidates.append(synonym.0)
        }
    }
    
    for candidate in candidates {
        
        if areSynonyms(left: candidate, right: right, withConnectedSynonyms: synonyms, seen: newSeens) {
            return true
        }
    }
    
    return false
}
