//
//  Solution.swift
//  Problem 25
//
//  Created by sebastien FOCK CHOW THO on 2019-06-21.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

class Asterisk {
    var value: String?
    
    init() {
        self.value = nil
    }
}

class Period {
    var value: Character?
    
    init() {
        self.value = nil
    }
}

extension String {
    func parseRegex() -> [Any] {
        var result: [Any] = []

        var nextPart = ""
        for character in self {
            if character == "*" {
                if !nextPart.isEmpty {
                    result.append(nextPart)
                    nextPart = ""
                }
                result.append(Asterisk())
                continue
            }

            if character == "." {
                if !nextPart.isEmpty {
                    result.append(nextPart)
                    nextPart = ""
                }
                result.append(Period())
                continue
            }

            nextPart += String(character)
        }

        if !nextPart.isEmpty {
            result.append(nextPart)
            nextPart = ""
        }

        for element in result {
            print(element)
        }
        
        return result
    }
    
    func matches(_ regex: String) -> Bool {
        let comparison = self.next(regex)
        
        return comparison.result && comparison.rest == ""
    }
    
    func next(_ regex: String) -> (result: Bool, rest: String, leftRegex: String) {
        var selfCopy = self
        var regexCopy = regex
        
        while !regexCopy.isEmpty {
            if regexCopy.first == "." {
                regexCopy.removeFirst()
                selfCopy.removeFirst()
                
                return selfCopy.next(regexCopy)
            }
            
            if regexCopy.first == "*" {
                if regexCopy.count == 1 {
                    return (true, "", "")
                }
                
                regexCopy.removeFirst()
                selfCopy.removeFirst()
                while !selfCopy.isEmpty {
                    if selfCopy.next(regexCopy).result {
                        return selfCopy.next(regexCopy)
                    }
                    selfCopy.removeFirst()
                }
                
                return (false, "", "")
            }
            
            if regexCopy.removeFirst() != selfCopy.removeFirst() {
                return (false, "", "")
            }
        }
        
        return (true, selfCopy, regexCopy)
    }
}
