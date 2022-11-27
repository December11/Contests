//
//  main.swift
//  Contests
//
//  Created by Alla Shkolnik on 07.11.2022.
//

import Foundation

////// Метод - Два указателя
///
/// Дана отсортированная последовательность чисел длиной N и число K.
/// Необходимо найти количество пар чисел A, B, таки что  B - A > K
///
/// N = [1, 3, 7, 8]     K= 4
/// 3
///

func countPairs(array: [Int], k: Int) -> Int {
    var counter = 0
    var r = 0
    for l in 0..<array.count {
        while r < array.count && array[r] - array[l] <= k {
            r += 1
        }
        counter += array.count - r
    }
    
    return counter
}
