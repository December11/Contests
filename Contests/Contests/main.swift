//
//  main.swift
//  Contests
//
//  Created by Alla Shkolnik on 07.11.2022.
//

import Foundation

////// 202. Happy Number
/// Write an algorithm to determine if a number n is happy.
/// A happy number is a number defined by the following process:

/// Starting with any positive integer, replace the number by the sum of the squares of its digits.
/// Repeat the process until the number equals 1 (where it will stay), or it loops endlessly in a cycle which does not include 1.
/// Those numbers for which this process ends in 1 are happy.
/// Return true if n is a happy number, and false if not.

class Solution {
    func isHappy(_ n: Int) -> Bool {
        var set = Set<Int>()
        var number = n
        while number != 1 && !set.contains(number) {
            set.insert(number)
            number = squareSum(number)
        }
        
        return number == 1
    }
    
    func squareSum(_ n: Int) -> Int {
        var num = n
        var sum = 0
        while num > 0 {
            let lastDigit = num % 10
            sum += (lastDigit * lastDigit)
            num /= 10
        }
        
        return sum
    }
}
