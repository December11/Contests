//
//  main.swift
//  Contests
//
//  Created by Alla Shkolnik on 07.11.2022.
//

import Foundation

////// 374. Guess Number Higher or Lower
/// We are playing the Guess Game. The game is as follows:
/// I pick a number from 1 to n. You have to guess which number I picked.
/// Every time you guess wrong, I will tell you whether the number I picked is higher or lower than your guess.
///
/// You call a pre-defined API int guess(int num), which returns three possible results:
///
/// -1: Your guess is higher than the number I picked (i.e. num > pick).
/// 1: Your guess is lower than the number I picked (i.e. num < pick).
/// 0: your guess is equal to the number I picked (i.e. num == pick).
/// Return the number that I picked.


/**
 * Forward declaration of guess API.
 * @param  num -> your guess number
 * @return          -1 if num is higher than the picked number
 *                  1 if num is lower than the picked number
 *               otherwise return 0
 * func guess(_ num: Int) -> Int
 */

class Solution : GuessGame {
    func guessNumber(_ n: Int) -> Int {
        var left = 1
        var right = n
        var mid = 0
        while left <= right {
            mid = (left + right) / 2
            let answer = guess(mid)
            if answer == 0 {
                return mid
            } else if answer == 1 {
                left = mid + 1
            } else {
                right = mid
            }
        }
        return mid
    }
}
