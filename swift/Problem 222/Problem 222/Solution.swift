//
//  Solution.swift
//  Problem 222
//
//  Created by sebastien FOCK CHOW THO on 2020-01-02.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

extension String {
    
    func shortestStandardizedPath() -> String {
        
        var splitted = self.split(separator: "/")
        splitted = splitted.filter{ $0 != "." }
        
        let absolutePath = self.first == "/"
        
        var keepLooping = true
        
        while keepLooping {
            for i in 0..<splitted.count {
                
                if splitted[i] == "." {
                    splitted.remove(at: i)
                    break
                }
                
                if i > 0 {
                    if splitted[i] == ".." {
                        if splitted[i-1] != ".." {
                            splitted.remove(at: i)
                            splitted.remove(at: i-1)
                            break
                        }
                    }
                }
             
                if i == splitted.count-1 {
                    keepLooping = false
                }
            }
        }
        
        return "\(absolutePath ? "/" : "")\(splitted.joined(separator: "/"))/"
    }
}
