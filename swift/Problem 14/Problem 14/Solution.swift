//
//  Solution.swift
//  Problem 14
//
//  Created by sebastien FOCK CHOW THO on 2019-06-13.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

/*
 * For a circle of 2 units of diameter,
 * surface = πr^2 = π(1)^2 = π
 *
 * Imagine a square surface of 2x2 units
 * Imagine a circle of 2 unit of diameter centered in this square
 * Imagine printing enough points in this square to totally cover the area
 * For a large amount of random points then, we can say that:
 *
 * (amount of points in the circle) / (amount of points in the square) = (area of circle) / (area of square)
 *
 * We know that (area of square) = 2x2 = 4:
 *
 * (amount of points in the circle) / (amount of points in the square) = (area of circle) / 4
 *
 * We also know that (area of circle) = surface = π:
 *
 * (amount of points in the circle) / (amount of points in the square) = π/4
 *
 * π = 4 * (amount of points in the circle) / (amount of points in the square)
 *
 * Now, the equation of a circle is x^2 + y^2 = r^2
 *
 * x^2 + y^2 = 1
 *
 * A point is in the circle if x^2 + y^2 <= 1
 * A point is in the square if x <= 1 & y <= 1
 */

struct Maths {
    func estimatePi(iteration: Int) -> Double {
        var pointsInSquare = 0
        var pointsInCircle = 0
        
        for _ in 0...iteration {
            let xRandom = Double.random(in: 0...1)
            let yRandom = Double.random(in: 0...1)
            
            pointsInSquare += 1
            
            if pow(xRandom, 2) + pow(yRandom, 2) <= 1 {
                pointsInCircle += 1
            }
        }
        
        return 4 * Double(pointsInCircle) / Double(pointsInSquare)
    }
}
