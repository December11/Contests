//
//  main.swift
//  Contests
//
//  Created by Alla Shkolnik on 07.11.2022.
//

import Foundation

////// Задача
/// Дана последовательност чисел длиной N и (M запросов) - // много запросов == префиксные суммы
/// Запросы: Сколько нулей на полуинтервале [L, R)
///

// решение в лоб
func countZeroes(array: [Int]) -> Int {
    var zeroes = 0
    for i in 0..<array.count where i == 0 {
        zeroes += 1
    }
    return zeroes
}

// решение префиксными суммами
func makeCountZeroes(array: [Int]) -> [Int] {
    var prefixZeroes = Array(repeating: 0, count: array.count + 1)
    for i in 1..<array.count+1 {
        prefixZeroes[i] = i - 1 == 0 ? prefixZeroes[i-1] + 1 : prefixZeroes[i-1]
    }
    
    return prefixZeroes
}

func countZeroes(prefixZeroes: [Int], r: Int, l: Int ) -> Int? {
    guard prefixZeroes.indices.contains(r),
          prefixZeroes.indices.contains(l)
    else { return nil }
    
    return prefixZeroes[r] - prefixZeroes[l]
}
