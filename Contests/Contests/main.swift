//
//  main.swift
//  Contests
//
//  Created by Alla Shkolnik on 07.11.2022.
//

import Foundation

////// 704. Binary Search
/// Given an array of integers nums which is sorted in ascending order, and an integer target, write a function to search target in nums. If target exists, then return its index. Otherwise, return -1.
/// You must write an algorithm with O(log n) runtime complexity.
///

class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        var left = 0
        var right = nums.count
        
        while left < right {
            let mid = (right + left) / 2
            if target == nums[mid] {
                return mid
            } else if target > nums[mid] {
                left = mid + 1
            } else {
                right = mid
            }
        }
        
        return -1
    }
}
