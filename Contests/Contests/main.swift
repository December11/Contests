//
//  main.swift
//  Contests
//
//  Created by Alla Shkolnik on 07.11.2022.
//

import Foundation

////// 88. Merge Sorted Array
/// You are given two integer arrays nums1 and nums2, sorted in non-decreasing order, and two integers m and n, representing the number of elements in nums1 and nums2 respectively.
/// Merge nums1 and nums2 into a single array sorted in non-decreasing order.
/// The final sorted array should not be returned by the function, but instead be stored inside the array nums1. To accommodate this, nums1 has a length of m + n, where the first m elements denote the elements that should be merged, and the last n elements are set to 0 and should be ignored. nums2 has a length of n.

class Solution {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var first = 0
        var last = 0
        var minValue = 0
        var array = nums1
        for i in 0..<(n+m) {
            while first < nums1.count && last < nums2.count {
                if nums2[last] >= nums1[first] {
                    nums1.insert(nums2[last], at: i)
                    last += 1
                } else {
                    first += 1
                }
            }
            if m > n {
                array[i] = nums2[i]
            }
        }
    }
}
