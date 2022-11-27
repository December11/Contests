//
//  main.swift
//  Contests
//
//  Created by Alla Shkolnik on 07.11.2022.
//

import Foundation

////// Метод
/// Реализовать префиксные суммы - RQS
/// Пусть у нас есть массив nums и N чисел и необходимо отвечать на запросы "Чему равна сумма элементов на полуинтервале [L, R) не включая R
/// Подсчитаем массив prefixSum длинной N+1, где prefixSum[k] = сумма всех чисел от 0 до k-1.
///
/// nums            5  3  8    1   4    6
/// prefixSum    0  5  8  16  17  21  27
///

// строим массив префиксных сумм
func prefixSum(array: [Int]) -> [Int] {
    var prefixSum = Array(repeating: 0, count: array.count + 1)
    for i in 1 ..< array.count + 1 {
        prefixSum[i] = prefixSum[i-1] + array[i-1]
    }
    return prefixSum
}

// на каждый запрос вызываем вот такую функцию, которая дает ответ за O(1)
func rsq(array: [Int], l: Int, r: Int) -> Int? {
    guard array.indices.contains(r),
          array.indices.contains(l)
    else { return nil }
    return array[r] - array[l]
}


