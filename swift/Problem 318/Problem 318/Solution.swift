//
//  Solution.swift
//  Problem 318
//
//  Created by sebastien FOCK CHOW THO on 2020-04-07.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

struct Trip {
    
    func countValidPlaylists(requiredSongs: Int, actualSongs: Int, buffer: Int) -> Int {
        
        if buffer > actualSongs {
            fatalError("not enough songs")
        }
        
        if requiredSongs == 0 {
            return 1
        }
        
        let nextRequired = requiredSongs-1
        let remainingSounds = buffer == 0 ? actualSongs : actualSongs-1
        let nextBuffer = buffer > 0 ? buffer-1 : buffer
        
        return actualSongs * countValidPlaylists(requiredSongs: nextRequired, actualSongs: remainingSounds, buffer: nextBuffer)
    }
}
