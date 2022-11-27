//
//  main.swift
//  Contests
//
//  Created by Alla Shkolnik on 07.11.2022.
//

import Foundation

////// Задача
/// Дана последовательность чисел длиной N
/// Нужно найти количество отрезков с нулевой суммой.  //  - неск. отрезков == неск. запросов == префиксные суммы
///

// решение в лоб  - O(N^2) - что-то тут не так
func countZeroes1(array: [Int]) -> Int {
    var zeroes = 0
    for i in 0..<array.count {
        for j in i+1..<array.count+1 {
            var rangeSum = 0
            for k in i..<j {
                rangeSum += array[k]
            }
            if rangeSum == 0 {
                zeroes += 1
            }
        }
    }
    return zeroes
}

// решение в лоб 2 - O(N^2) - тут тоже что-то не так
func countZeroes(array: [Int]) -> Int {
    var zeroRanges = 0
    for i in 0..<array.count {
        var rangeSum = 0
        for j in i..<array.count {
            rangeSum += array[j]
            if rangeSum == 0 {
                zeroRanges += 1
            }
        }
    }
    return zeroRanges
}

// решение префиксными суммами
func countPrefixSum(array: [Int]) -> [Int] {
    var prefixSums = [0: 1]
    var currentSum = 0
    for elem in array {
        currentSum += elem
        if !prefixSums.keys.contains(where: currentSum) {
            prefixSums.updateValue(0, forKey: currentSum)
        }
        if let oldValue = prefixSums[currentSum] {
            prefixSums.updateValue(oldValue, forKey: currentSum)
        }
    }
    return prefixSums
}

func countZeroSumRanges(prefixSums: [Int: Int]) -> Int? {
    var ranges = 0
    for key in prefixSums.keys {
        if let countSum = prefixSums[key] {
            ranges += (countSum * (countSum - 1)) / 2
        }
    }
    
    return ranges
}

print(countZeroes(array: [0, 3, 0, 0, 4, 0, 0, 9, 0, 0, 9, 0, 0, 0, 0, 0, 8]))

