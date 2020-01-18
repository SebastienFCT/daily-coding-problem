//
//  Solution.swift
//  Problem 238
//
//  Created by sebastien FOCK CHOW THO on 2020-01-18.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

struct BlackJack {
    
    var deck: [Int] = [
        1,1,1,1,
        2,2,2,2,
        3,3,3,3,
        4,4,4,4,
        5,5,5,5,
        6,6,6,6,
        7,7,7,7,
        8,8,8,8,
        9,9,9,9,
        10,10,10,10,
        10,10,10,10,
        10,10,10,10
    ]
    
    init() {
        deck.shuffle()
    }
    
    func solve() -> [Round] {
        let allCandidates = possibilities(left: deck, currentRounds: [])
        
        let scoreMap = allCandidates.map { $0.reduce(0) { $0 + ($1.win ? 1 : -1) } }
        
        var bestScoreIndex = 0
        
        for i in 0..<scoreMap.count {
            if scoreMap[i] > scoreMap[bestScoreIndex] { bestScoreIndex = i }
        }
        
        return allCandidates[bestScoreIndex]
    }
    
    typealias Round = (playerHits: Int, dealerHits: Int, win: Bool)
    
    func possibilities(left: [Int], currentRounds: [Round]) -> [[Round]] {
        
        if left.count < 4 {
            return [currentRounds]
        }
        
        var copy = left
        
        var result: [[Round]] = []
        
        var player = 0
        var dealer = 0
        
        player += copy.removeFirst()
        player += copy.removeFirst()
        
        dealer += copy.removeFirst()
        dealer += copy.removeFirst()
        
        // No more cards
        
        if copy.isEmpty {
            var copyRounds = currentRounds
            
            copyRounds.append((0, 0, player > dealer))
            result.append(copyRounds)
            
            return result
        }
        
        // Player passes
        
        if dealer < 16 {
            var allToDealer = copy
            var dealerCopy = dealer
            var dealerCount = 0
            
            while dealerCopy < 16 && !allToDealer.isEmpty {
                dealerCopy += allToDealer.removeFirst()
                dealerCount += 1
            }
            
            if dealerCopy > 21 {
                var copyRounds = currentRounds
                copyRounds.append((0, dealerCount, true))
                
                result.append(contentsOf: possibilities(left: allToDealer, currentRounds: copyRounds))
            } else {
                var copyRounds = currentRounds
                copyRounds.append((0, dealerCount, player > dealerCopy))
                
                result.append(contentsOf: possibilities(left: allToDealer, currentRounds: copyRounds))
            }
        } else {
            var copyRounds = currentRounds
            copyRounds.append((0, 0, player > dealer))
            
            result.append(contentsOf: possibilities(left: copy, currentRounds: copyRounds))
        }
        
        // Player hits
        
        var playerCount = 0
        while player <= 21 && !copy.isEmpty {
            
            if player + copy[0] <= 21 {
                player += copy.removeFirst()
                playerCount += 1
                
                if dealer < 16 {
                    var allToDealer = copy
                    var dealerCopy = dealer
                    var dealerCount = 0
                    
                    while dealerCopy < 16 && !allToDealer.isEmpty {
                        dealerCopy += allToDealer.removeFirst()
                        dealerCount += 1
                    }
                    
                    if dealerCopy > 21 {
                        var copyRounds = currentRounds
                        copyRounds.append((playerCount, dealerCount, true))
                        
                        result.append(contentsOf: possibilities(left: allToDealer, currentRounds: copyRounds))
                    } else {
                        var copyRounds = currentRounds
                        copyRounds.append((playerCount, dealerCount, true))
                        
                        result.append(contentsOf: possibilities(left: allToDealer, currentRounds: copyRounds))
                    }
                } else {
                    var copyRounds = currentRounds
                    copyRounds.append((playerCount, 0, player > dealer))
                    
                    result.append(copyRounds)
                }
            } else {
                var allToDealer = copy
                var dealerCopy = dealer
                var dealerCount = 0
                
                while dealerCopy < 16 && !allToDealer.isEmpty {
                    dealerCopy += allToDealer.removeFirst()
                    dealerCount += 1
                }
                
                if dealerCopy > 21 {
                    var copyRounds = currentRounds
                    copyRounds.append((playerCount, dealerCount, true))
                    
                    result.append(contentsOf: possibilities(left: allToDealer, currentRounds: copyRounds))
                } else {
                    var copyRounds = currentRounds
                    copyRounds.append((playerCount, dealerCount, player > dealerCopy))
                    
                    result.append(contentsOf: possibilities(left: allToDealer, currentRounds: copyRounds))
                }
                
                break
            }
        }
        
        return result
    }
}
