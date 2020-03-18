//
//  Solution.swift
//  Problem 297
//
//  Created by sebastien FOCK CHOW THO on 2020-03-17.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

struct Bar {
    
    var preferences: [Int: [Int]]
    
    func lazyBartender() -> [Int] {
        
        var result: [Int] = []
        
        var copy = preferences
        
        while !copy.isEmpty {
            let next = nextMostCommmon(inPreferences: copy)
            result.append(next.result)
            copy = next.rest
        }
        
        return result
    }
    
    private func nextMostCommmon(inPreferences: [Int: [Int]]) -> (result: Int, rest: [Int: [Int]]) {
        
        var commons: [Int: Int] = [:]
        
        for key in inPreferences.keys {
            for drink in inPreferences[key]! {
                if commons.keys.contains(drink) {
                    commons[drink]! += 1
                } else {
                    commons[drink] = 1
                }
            }
        }
        
        let mostCommon = commons.sorted{ $0.value > $1.value }.first!.key
        var copy: [Int: [Int]] = [:]
        
        for pref in inPreferences {
            if !pref.value.contains(mostCommon) {
                copy[pref.key] = pref.value
            }
        }
        
        return (mostCommon, (copy))
    }
}
