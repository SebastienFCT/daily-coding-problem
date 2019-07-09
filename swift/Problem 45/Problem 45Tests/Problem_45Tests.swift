//
//  Problem_45Tests.swift
//  Problem 45Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-07-09.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_45

class Problem_45Tests: XCTestCase {

    func test_0() {
        let total: Double = 100000
        
        var count1: Double = 0
        var count2: Double = 0
        var count3: Double = 0
        var count4: Double = 0
        var count5: Double = 0
        
        for _ in 0...Int(total) {
            switch SigmaChallenge.rand5() {
            case 1:
                count1 += 1
            case 2:
                count2 += 1
            case 3:
                count3 += 1
            case 4:
                count4 += 1
            default:
                count5 += 1
            }
        }
        
        print("repartition: 1(\(count1/total)),2(\(count2/total)),3(\(count3/total)),4(\(count4/total)),5(\(count5/total))")
    }
    
    func test_1() {
        let total: Double = 100000
        
        var count1: Double = 0
        var count2: Double = 0
        var count3: Double = 0
        var count4: Double = 0
        var count5: Double = 0
        var count6: Double = 0
        var count7: Double = 0
        
        for _ in 0...Int(total) {
            switch SigmaChallenge.rand7b() {
            case 1:
                count1 += 1
            case 2:
                count2 += 1
            case 3:
                count3 += 1
            case 4:
                count4 += 1
            case 5:
                count5 += 1
            case 6:
                count6 += 1
            default:
                count7 += 1
            }
        }
        
        print("repartition: 1(\(count1/total)),2(\(count2/total)),3(\(count3/total)),4(\(count4/total)),5(\(count5/total)),6(\(count6/total)),7(\(count7/total))")
    }

}
