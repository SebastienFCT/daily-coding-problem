//
//  Solution.swift
//  Problem 120
//
//  Created by sebastien FOCK CHOW THO on 2019-09-22.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

class Singleton {
    static private let instance1 = Singleton()
    static private let instance2 = Singleton()
    private var even = true
    
    static func getInstance() -> Singleton {
        if Singleton.instance1.even {
            Singleton.instance1.even = false
            Singleton.instance2.even = true
            print("returned instance1")
            return Singleton.instance1
        } else {
            Singleton.instance1.even = true
            Singleton.instance2.even = false
            print("returned instance2")
            return Singleton.instance2
        }
    }
}
