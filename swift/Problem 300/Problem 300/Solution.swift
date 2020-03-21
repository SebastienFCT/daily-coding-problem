//
//  Solution.swift
//  Problem 300
//
//  Created by sebastien FOCK CHOW THO on 2020-03-20.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

struct VotingMachine {
    
    var voters: Set<UUID>
    var candidates: [UUID: Int]
    var top3: [(id: UUID, count: Int)]
    var min: Int
    
    mutating func vote(voterId: UUID, candidateId: UUID) {
        
        if voters.contains(voterId) {
            fatalError("voter with id \(voterId) is frauding")
        }
        
        voters.insert(voterId)
        
        if candidates.keys.contains(candidateId) {
            candidates[candidateId]! += 1
        } else {
            candidates[candidateId] = 1
        }
        
        if candidates[candidateId]! > min {
            
            if top3.contains(where: { (candidate) -> Bool in
                candidate.id == candidateId
            }) {
                top3.removeAll { (candidate) -> Bool in
                    candidate.id == candidateId
                }
                
                top3.append((candidateId, candidates[candidateId]!))
                top3.sort{ $0.count > $1.count }
                return
            }
            
            if top3.count < 3 {
                top3.append((candidateId, candidates[candidateId]!))
                return
            }
            
            top3.removeLast()
            top3.append((candidateId, candidates[candidateId]!))
            
            min = candidates[candidateId]!
        }
    }
}
