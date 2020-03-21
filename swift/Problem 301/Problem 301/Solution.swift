//
//  Solution.swift
//  Problem 301
//
//  Created by sebastien FOCK CHOW THO on 2020-03-21.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation
import CryptoKit

struct TripleByteCustomStruct {
    
    var key: SymmetricKey
    var box: AES.GCM.SealedBox? = nil
    
    mutating func add(value: String) {
        
        if let box = box, let decrypted = try? AES.GCM.open(box, using: key), var compound = String(data: decrypted, encoding: .utf8) {
            
            compound = "\(compound)\(value)"
            
            self.box = encrypt(value: compound)
            return
        }
        
        guard let data = value.data(using: .utf8), let cryptedBox = try? AES.GCM.seal(data, using: key), let sealedBox = try? AES.GCM.SealedBox(combined: cryptedBox.combined!) else {
            fatalError("couldn't encrypt value")
        }
        
        self.box = sealedBox
    }
    
    func check(value: String) -> Bool {
        
        if let box = box, let decrypted = try? AES.GCM.open(box, using: key), let compound = String(data: decrypted, encoding: .utf8) {
            
            return compound.contains(value)
        }
        
        return false
    }
    
    private func encrypt(value: String) -> AES.GCM.SealedBox {
        
        guard let data = value.data(using: .utf8), let cryptedBox = try? AES.GCM.seal(data, using: key), let sealedBox = try? AES.GCM.SealedBox(combined: cryptedBox.combined!) else {
            fatalError("couldn't encrypt value")
        }
        
        return sealedBox
    }
}
