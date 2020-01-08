//
//  Problem_227Tests.swift
//  Problem 227Tests
//
//  Created by sebastien FOCK CHOW THO on 2020-01-07.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_227

class Problem_227Tests: XCTestCase {

    func test_boggle() {
        
        // Created random board and dictionary from http://fuzzylogicinc.net/boggle/EnterBoard.aspx?BoardID=auhejskdciehsdes&Length=3&Size=4
        
        let board: [[Character]] = [
            ["a", "u", "h", "e"],
            ["j", "s", "k", "d"],
            ["c", "i", "e", "h"],
            ["s", "d", "e", "s"]
        ]
        
        let dictionary = ["asci", "aside", "asked", "cid", "cides", "dee", "deek", "deid", "deked", "desk", "dies", "diked", "disa", "dish", "disked", "eds", "ehs", "eiked", "eke", "eses", "heeds", "hes", "huskies", "idees", "ish", "jauked", "juked", "ked", "kehuas", "kids", "sau", "see", "seek", "sei", "seise", "sesh", "sheds", "sheikh", "shes", "side", "sies", "sikes", "skee", "ski", "skied", "skua", "sukhs", "use"]
        
        let solutions = Boggle().allSolutions(forDictionary: dictionary, board: board)
        let mapped = solutions.map{ $0.word }
        
        print(mapped)
    }

}
