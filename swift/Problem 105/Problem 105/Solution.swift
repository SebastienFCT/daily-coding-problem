//
//  Solution.swift
//  Problem 105
//
//  Created by sebastien FOCK CHOW THO on 2019-09-07.
//  Copyright © 2019 sebfct. All rights reserved.
//

import Foundation

class Debouncer {
    var workItem: DispatchWorkItem?
    
    init(workItem: DispatchWorkItem?) {
        self.workItem = workItem
    }
    
    func debounce(delay: DispatchTimeInterval, queue: DispatchQueue = .main) {
        workItem?.cancel()
        workItem = DispatchWorkItem { print("I ran from debouncer at \(Date())") }
        queue.asyncAfter(deadline: .now() + delay, execute: workItem!)
    }
}
