//
//  Solution.swift
//  Problem 174
//
//  Created by sebastien FOCK CHOW THO on 2019-11-15.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

// Subtype polymophism is the ability to apply the behaviour of a function from a parent class to its children classes:

class Animal {
    
    init() { }
    
    func die() {}
}

class Human: Animal { }
class Fish: Animal { }

struct ExamplePolymorphism {
    
    func Subtype() {
        let johnDoe = Human()
        johnDoe.die()

        let nemo = Fish()
        nemo.die()
    }
}

// Parametric polymorphism is when we define a function behaviour base of parameters that aren't typed. In swift, we use generics

class Node<T> {
    var value: T
    var leftChild: Node?
    var rightChild: Node?
    
    init(value: T, leftChild: Node?, rightChild: Node?) {
        self.value = value
        self.leftChild = leftChild
        self.rightChild = rightChild
    }
}

extension ExamplePolymorphism {
    
    func parametric() {
        let numericTree = Node(value: 0, leftChild: Node(value: 1, leftChild: nil, rightChild: nil), rightChild: Node(value: 2, leftChild: nil, rightChild: nil))
        let abcTree = Node(value: "a", leftChild: Node(value: "b", leftChild: nil, rightChild: nil), rightChild: Node(value: "c", leftChild: nil, rightChild: nil))
    }
}

// Ad-hoc polymorphism is the ability to re-define a function behaviour with different parameters. It's also called function overloading

func addNumbers(left: Int, right: Int) -> Int {
    return left + right
}

func addNumbers(left: Double, right: Double) -> Double {
    return left + right
}

extension ExamplePolymorphism {
    
    func adHoc() {
        let intSum = addNumbers(left: 1, right: 2)
        let doubleSum = addNumbers(left: 1.1, right: 2.2)
    }
}
