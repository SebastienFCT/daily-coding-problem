//
//  Solution.swift
//  Problem 10
//
//  Created by sebastien FOCK CHOW THO on 2019-06-12.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

struct Functions {
    func printExecuted() {
        NSLog("executed")
    }
}

func BackgroundJobScheduler(fun: @escaping () -> (), delay: Double) {
    DispatchQueue.global(qos: .background).async {
        let start = Date()
        NSLog("starting at \(start.description)")
        
        while true {
            if Date().timeIntervalSince(start) >= delay / 1000 {
                DispatchQueue.main.async {
                    fun()
                }
                break
            }
        }
    }
}

func JobScheduler(fun: @escaping () -> (), delay: Double) {
    let start = Date()
    NSLog("starting at \(start.description)")
    
    while true {
        if Date().timeIntervalSince(start) >= delay / 1000 {
            fun()
            break
        }
    }
}
