//
//  Problem_17Tests.swift
//  Problem 17Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-06-15.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_17

class Problem_17Tests: XCTestCase {

    func testExample() {
        let input = "dir\\n\\tsubdir1\\n\\tsubdir2\\n\\t\\tfile.ext"
        var fileSystem = FileSystem()
        fileSystem.buildFileSystemFromString(input)
        
        print(fileSystem.root?.children[1].children[0].name)
    }

}
