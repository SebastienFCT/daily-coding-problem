//
//  Solution.swift
//  Problem 354
//
//  Created by sebastien FOCK CHOW THO on 2020-05-13.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

struct Client {
    
    func process(url: URL) -> String? {
        
        do {
            let html = try String(contentsOf: url)
            return html
        } catch {
            return nil
        }
    }
    
}

struct Master {
    
    var clients: [Client]
    
    var bank: [String]
    
    mutating func crawl() {
        
        for url in getAllLinks() {
            
            var done = false
            
            while !done {
                
                if clients.isEmpty {
                    continue
                }
             
                let next = clients.removeFirst()
                done = true
                
                if let next = next.process(url: url) {
                    self.bank.append(next)
                }
                
                self.clients.append(next)
            }
        }
        
    }
    
    private func getAllLinks() -> [URL] {
        
        var result: [URL] = []
        
        // Retrieve all links from https://en.wikipedia.org/wiki/Special:AllPages and append to result
        
        return result
    }
}
