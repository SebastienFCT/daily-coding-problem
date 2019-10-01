//
//  Solution.swift
//  Problem 128
//
//  Created by sebastien FOCK CHOW THO on 2019-09-30.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

class HanoiGame {
    var rods: [HanoiRod]
    var disks: Int
    
    init(withDisks n: Int) {
        let rod1 = HanoiRod()
        let rod2 = HanoiRod()
        let rod3 = HanoiRod()
        
        for i in stride(from: n, to: 0, by: -1) {
            _ = try? rod1.push(node: HanoiDisk(value: i))
        }
        
        self.rods = [rod1, rod2, rod3]
        self.disks = n
    }
    
    func move(from: Int, to: Int) {
        if let disk = rods[from].pop() {
            if let disk = try? rods[to].push(node: disk) {
                print("move disk \(disk.value) from \(from) to \(to)")
            } else {
                print("moving from \(from) to \(to): push failed")
            }
        } else {
            print("moving from \(from) to \(to): pop failed")
        }
        
        log()
    }
    
    func solve() {
        solve(value: disks, from: 0, other: 1, to: 2)
    }
    
    private func solve(value: Int, from: Int, other: Int, to: Int) {
        if value == 1 {
            move(from: from, to: to)
            return
        }
        
        solve(value: value-1, from: from, other: to, to: other)
        move(from: from, to: to)
        solve(value: value-1, from: other, other: from, to: to)
    }
    
    func log() {
        print(rods[0].values())
        print(rods[1].values())
        print(rods[2].values())
    }
}

class HanoiDisk {
    var value: Int
    var next: HanoiDisk?
    
    init(value: Int, next: HanoiDisk?) {
        self.value = value
        self.next = next
    }
    
    init(value: Int) {
        self.value = value
        self.next = nil
    }
    
    func last() -> (node: HanoiDisk, parent: HanoiDisk?) {
        if let next = next {
            if let _ = next.next {
                return next.last()
            }
            
            return (node: next, parent: self)
        }
        
        return (node: self, parent: nil)
    }
    
    func popLast() -> (node: HanoiDisk?, newTail: HanoiDisk?)? {
        if let next = next {
            if let _ = next.next {
                return next.popLast()
            } else {
                let tmp = self.next
                self.next = nil
                return (tmp, self)
            }
        } else {
            return nil
        }
    }
    
    func values() -> String {
        let result = "\(value)"
        
        if let next = next {
            return "\(result)\(next.values())"
        }
        
        return result
    }
}

enum HanoiError: Error {
    case lowerDiskSmallerThanNewOne
}

class HanoiRod {
    var root: HanoiDisk?
    var tail: HanoiDisk?
    
    func push(node: HanoiDisk) throws -> HanoiDisk? {
        if let tail = tail {
            guard node.value <= tail.value else {
                throw HanoiError.lowerDiskSmallerThanNewOne
            }
            
            tail.next = node
            self.tail = node
            
            return self.tail
        }
        
        if let root = root {
            root.next = node
            self.tail = node
            
            return self.tail
        }
        
        self.root = node
        self.tail = node
        
        return self.tail
    }
    
    func pop() -> HanoiDisk? {
        if let root = root {
            if let last = root.popLast(), let node = last.node, let newTail = last.newTail {
                self.tail = newTail
                return node
            } else {
                let tmp = root
                
                self.root = nil
                self.tail = nil
                
                return tmp
            }
        }
        
        return nil
    }
    
    func values() -> String {
        if let root = root {
            return root.values()
        }
        
        return "_"
    }
}
