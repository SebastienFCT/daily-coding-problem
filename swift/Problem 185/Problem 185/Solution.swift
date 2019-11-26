//
//  Solution.swift
//  Problem 185
//
//  Created by sebastien FOCK CHOW THO on 2019-11-26.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

struct Rectangle {
    var topLeftAnchor: (row: Int, column: Int)
    var dimensions: (width: Int, height: Int)
}

func intersection(left: Rectangle, right: Rectangle) -> Int {
    
    let minRow = max(left.topLeftAnchor.row, right.topLeftAnchor.row)
    let maxRow = min(left.topLeftAnchor.row + left.dimensions.width, right.topLeftAnchor.row + right.dimensions.width)
    
    let minColumn = max(left.topLeftAnchor.column, right.topLeftAnchor.column)
    let maxColumn = min(left.topLeftAnchor.column + left.dimensions.height, right.topLeftAnchor.column + right.dimensions.height)
    
    return (maxRow-minRow) * (maxColumn-minColumn)
}
