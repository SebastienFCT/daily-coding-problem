//
//  Problem_335Tests.swift
//  Problem 335Tests
//
//  Created by sebastien FOCK CHOW THO on 2020-04-25.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_335

class Problem_335Tests: XCTestCase {

    func test_page_ranking() {
        
        let web1 = Node(value: "web1")
        let web2 = Node(value: "web2")
        let web3 = Node(value: "web3")
        let web4 = Node(value: "web4")
        
        web1.pointers = [web2, web3]
        web3.pointers = [web2]
        web2.pointers = [web4]
        
        let input = Web(pages: [web1, web2, web3], dampingFactor: 0.85)
        
        print(input.ranking())
    }

}
