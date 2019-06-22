//
//  Solution.swift
//  Problem 25
//
//  Created by sebastien FOCK CHOW THO on 2019-06-21.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

/**
 
    Since the goal is to interpret a string, we should start building a function that read a string (that would be the regular expression) and separate its asterisks and periods
 
    let's also build a structure that knows it can be replaced by a character or multiple characters
 
    Finally, while parsing the regular expression, let's separate it into different parts:
 
    - Periods
    - Asterisks
    - Other characters (grouped)
 
 */
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
}
/**
 
    ~~Ok, now, we know that the string must contain all the part of our "parsedRegex" that are non asterisks or periods and in the same order, we can check for this first:~~
 
    At this point of the test, I thought of another way to solve this problem, I could instead build a function that compare the "rest" of a string with a regex. The function will return every time it finds a special regex character
 
    I'll do this progressively by testing first two string, then adding periods and then asterisks.
 
 */
//extension String {
//    func matches(_ regex: String) -> Bool {
//        let comparison = self.next(regex)
//
//        return comparison.result && comparison.rest == ""
//    }
//
//    func next(_ regex: String) -> (result: Bool, rest: String, leftRegex: String) {
//        var selfCopy = self
//        var regexCopy = regex
//
//        while !regexCopy.isEmpty {
//            if regexCopy.removeFirst() != selfCopy.removeFirst() {
//                return (false, "", "")
//            }
//        }
//
//        return (true, selfCopy, regexCopy)
//    }
//}
/**
 
    Now let's introduce the period character into our function, the period must match any single character
 
 */
//extension String {
//    func matches(_ regex: String) -> Bool {
//        let comparison = self.next(regex)
//
//        return comparison.result && comparison.rest == ""
//    }
//
//    func next(_ regex: String) -> (result: Bool, rest: String, leftRegex: String) {
//        var selfCopy = self
//        var regexCopy = regex
//
//        while !regexCopy.isEmpty {
//            if regexCopy.first == "." {
//                regexCopy.removeFirst()
//                selfCopy.removeFirst()
//
//                return selfCopy.next(regexCopy)
//            }
//
//            if regexCopy.removeFirst() != selfCopy.removeFirst() {
//                return (false, "", "")
//            }
//        }
//
//        return (true, selfCopy, regexCopy)
//    }
//}
/**
 
    Finally, we need the logic for the asterisk.
 
    For this one, if we find an asterisk, we need to loop through the input until we find a sub-string matching the following, for example having
 
    abc*c and abcaac
 
    The logic is that at the asterisk:
 
    - remove first character of the input: the rest is ac, an ac doesn't match c
    - remove the next first character: the rest is c, it matches the expression return true
 
 */
//extension String {
//    func matches(_ regex: String) -> Bool {
//        let comparison = self.next(regex)
//
//        return comparison.result && comparison.rest == ""
//    }
//
//    func next(_ regex: String) -> (result: Bool, rest: String, leftRegex: String) {
//        var selfCopy = self
//        var regexCopy = regex
//
//        while !regexCopy.isEmpty {
//            if regexCopy.first == "." {
//                regexCopy.removeFirst()
//                selfCopy.removeFirst()
//
//                return selfCopy.next(regexCopy)
//            }
//
//            if regexCopy.first == "*" {
//                regexCopy.removeFirst()
//                selfCopy.removeFirst()
//                while !selfCopy.isEmpty {
//                    if selfCopy.next(regexCopy).result {
//                        return selfCopy.next(regexCopy)
//                    }
//                    selfCopy.removeFirst()
//                }
//
//                return (false, "", "")
//            }
//
//            if regexCopy.removeFirst() != selfCopy.removeFirst() {
//                return (false, "", "")
//            }
//        }
//
//        return (true, selfCopy, regexCopy)
//    }
//}
/**
 
    We notice few issues here:
 
    - If we reach the end on the asterisk condition, then there is two possibilities
        - The regex wasn't finish, therefore it should fail (we reach the end of the input)
        - The regex was at the end, in which case it should succeed. In fact, this should change the rule to "if the next regex character is a * and it's the last regex character, then return true
 
 */
extension String {
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
