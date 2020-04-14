//
//  Solution.swift
//  Problem 325
//
//  Created by sebastien FOCK CHOW THO on 2020-04-14.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

struct FCTUnit: Hashable {
    var label: String = ""
    var multiplier: Float = 0
    
    static func == (lhs: FCTUnit, rhs: FCTUnit) -> Bool {
        return lhs.label == rhs.label
    }
}

struct CustomSystem {
    
    var units: [FCTUnit]
    
    mutating func inserUnitWithLabel(_ label: String, reference: String, withMutiplier: Float) {
        
        guard units.contains(where: { (a_unit) -> Bool in
            a_unit.label == reference
        }) else {
            fatalError("reference \(reference) unit not found in the system.")
        }
        
        var ref: FCTUnit!
        
        for unit in units {
            if unit.label == reference {
                ref = unit
            }
        }
        
        if units.contains(where: { (a_unit) -> Bool in
            a_unit.label == label
        }) {
            units.removeAll { (a_unit) -> Bool in
                a_unit.label == label
            }
        }
        
        let newUnit = FCTUnit(label: label, multiplier: ref.multiplier * withMutiplier)
        units.append(newUnit)
    }
    
    func convert(fromUnit: String, toUnit: String, value: Float) -> Float {
        
        if !units.contains(where: { (a_unit) -> Bool in
            a_unit.label == fromUnit
        }) {
            fatalError("Unit \(fromUnit) not found")
        }
        
        if !units.contains(where: { (a_unit) -> Bool in
            a_unit.label == toUnit
        }) {
            fatalError("Unit \(fromUnit) not found")
        }
        
        let from = units.filter{ $0.label == fromUnit }.first!
        let to = units.filter{ $0.label == toUnit }.first!
        
        return value / to.multiplier * from.multiplier
    }
}
