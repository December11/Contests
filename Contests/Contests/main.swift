//
//  main.swift
//  Contests
//
//  Created by Alla Shkolnik on 07.11.2022.
//

import Foundation

////// Задача
///Реализовать работу множества
///хеш-функция X % 10

struct MySet {
    
    private var elements = [[Int]]()
    private let setSize = 10
    
    init(elements : [[Int]] = [[]]) {
        if elements == [[]] {
            for _ in 0...self.setSize {
                self.elements.append([Int]())
            }
        } else {
            self.elements = elements
        }
    }
    
    mutating func add(_ element: Int) {
        guard !find(element) else { return }
        elements[element % setSize].append(element)
    }
    
    mutating func delete(_ element: Int) -> Bool {
        guard find(element) else { return false }
        for i in 0 ..< elements[element % setSize].count {
            if elements[element % setSize][i] == element,
               let last = elements[element % setSize].last {
                elements[element % setSize][i] = last
            }
        }
        elements[element % setSize].removeLast()
        
        return true
    }
    
    func find(_ element: Int) -> Bool {
        elements[element % setSize].contains(element)
    }
}

var set1 = MySet()
set1.add(12)
set1.add(23)
set1.add(22)
set1.add(25)
set1.add(2)
set1.add(17)

print(set1)
print()
print(set1.find(12))
print(set1.find(24))
print()
print(set1.delete(12))
print(set1.delete(12))
print(set1)

