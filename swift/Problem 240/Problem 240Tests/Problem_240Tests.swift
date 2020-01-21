//
//  Problem_240Tests.swift
//  Problem 240Tests
//
//  Created by sebastien FOCK CHOW THO on 2020-01-20.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_240

class Problem_240Tests: XCTestCase {

    func test_rearranging_couples() {
        
        var people = [1,1,2,2,3,3,4,4,5,5,6,6,7,7,8,8,9,9,10,10,11,11,12,12,13,13,14,14,15,15,16,16,17,17,18,18,19,19,20,20]
        people.shuffle()
        
        print(people)
        
        let couples = Couples(people: people)
        
        print(couples.rearrange())
    }

}
