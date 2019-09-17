//
//  Solution.swift
//  Problem 114
//
//  Created by sebastien FOCK CHOW THO on 2019-09-16.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

extension String {
    func reverse(withDelimeters delimiters: Set<Character>) -> String {
        var copy = self
        
        var result = ""
        
        var words: [String?] = []
        var delimiterList: [Character] = []
        
        // This nil indexes isn't really ideal nor readable for developer but it's the first idea that came to mind to handle the last case in the follow up question given the existing code
        var currentIndex = 0
        var nilIndexes: [Int] = []
        
        var currentWord = ""
        
        while !copy.isEmpty {
            let next = copy.removeFirst()
            
            if delimiters.contains(next) {
                delimiterList.append(next)
                if currentWord.isEmpty {
                    nilIndexes.append(currentIndex)
                } else {
                    words.append(currentWord)
                }
                currentWord = ""
                currentIndex += 1
            } else {
                currentWord += String(next)
            }
        }
        
        if currentWord.count > 0 {
            words.append(currentWord)
            currentWord = ""
        }
        
        words = words.reversed()
        
        for index in nilIndexes {
            words.insert(nil, at: index)
        }
        
        for word in words {
            if let word = word {
                result += word
            }
            
            if !delimiterList.isEmpty {
                result += String(delimiterList.removeFirst())
            }
        }
        
        return result
    }
}
