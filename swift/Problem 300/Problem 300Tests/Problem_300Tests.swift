//
//  Problem_300Tests.swift
//  Problem 300Tests
//
//  Created by sebastien FOCK CHOW THO on 2020-03-20.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_300

class Problem_300Tests: XCTestCase {

    func test_voting_machine() {
        
        let sarkozy = UUID()
        let lepen = UUID()
        let melenchon = UUID()
        let bayrou = UUID()
        
        let map = [
            sarkozy: "sarkozy",
            lepen: "lepen",
            melenchon: "melenchon",
            bayrou: "bayrou"
        ]
        
        var vm = VotingMachine(voters: Set(), candidates: [:], top3: [], min: 0)
        
        for _ in 0...1000 {
            
            switch Int.random(in: 0...3) {
                case 0: vm.vote(voterId: UUID(), candidateId: sarkozy)
                case 1: vm.vote(voterId: UUID(), candidateId: lepen)
                case 2: vm.vote(voterId: UUID(), candidateId: melenchon)
                case 3: vm.vote(voterId: UUID(), candidateId: bayrou)
                default: break
            }
            print(vm.top3.map{ (map[$0.id]!,$0.count) })
        }
    }

}
