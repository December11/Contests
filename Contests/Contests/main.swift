//
//  main.swift
//  Contests
//
//  Created by Alla Shkolnik on 07.11.2022.
//

import Foundation

////// Задача 3
/// Реализовать сортировку подсчетом
///

func countingSorted(_ array: [Int]) -> [Int] {
    guard
        let minValue = array.min(),
        let maxValue = array.max()
    else { return [] } // зачем тут мин и макс?
    var results = array
    
    let possibleElementsCount = maxValue - minValue + 1 // why +1? зачем вычислять разницу между мин и макс?
                                    // вычисляем тут количество возможных элементов.
    var countValues = Array(repeating: 0, count: possibleElementsCount)
    
    for element in array {
        let index = element - minValue
        countValues[index] = countValues[index] + 1
    }
    var nowPosition = 0
    for element in 0 ..< possibleElementsCount {
        for _ in 0..<countValues[element] {
            results[nowPosition] = element + minValue
            nowPosition += 1
        }
    }
    return results 
}
