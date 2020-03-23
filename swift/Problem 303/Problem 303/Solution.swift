//
//  Solution.swift
//  Problem 303
//
//  Created by sebastien FOCK CHOW THO on 2020-03-23.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

struct Clock {
    
    var hoursDigits: Int
    var minutesDigits: Int
    
    init(time: String) {
        
        let splitted = time.split(separator: ":")
        
        guard splitted.count == 2 else {
            fatalError("format must be hh:mm")
        }
        
        let hours = splitted[0]
        let minutes = splitted[1]
        
        guard let hoursVal = Int(hours), let minuteVal = Int(minutes) else {
            fatalError("format must be hh:mm")
        }
        
        self.hoursDigits = hoursVal
        self.minutesDigits = minuteVal
    }
    
    func angle() -> Int {
        
        let hourAngle = (hoursDigits % 12) * (360/12)
        let minuteAngle = (minutesDigits % 60) * (360/60)
        
        return abs(hourAngle-minuteAngle)
    }
    
    static func zeroAngles() -> [String] {
        var result: [String] = []
        
        for i in 0...23 {
            
            for j in 0...59 {
                
                let hourAngle = (i % 12) * (360/12)
                let minuteAngle = (j % 60) * (360/60)
                
                if abs(hourAngle-minuteAngle) == 0 {
                    let iVal = i < 10 ? "0\(i)" : "\(i)"
                    let jVal = j < 10 ? "0\(j)" : "\(j)"
                    result.append("\(iVal):\(jVal)")
                }
            }
        }
        
        return result
    }
}
