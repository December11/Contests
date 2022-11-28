//
//  main.swift
//  Contests
//
//  Created by Alla Shkolnik on 07.11.2022.
//

import Foundation

////// Метод - Два указателя

//
//  main.swift
//  Contests
//
//  Created by Alla Shkolnik on 07.11.2022.
//

import Foundation

////// Метод - Бинарный поиск
///
///

// бинарный поиск
func binarySearch(_ array: [Int], x: Int) -> Bool {
    var left = 0
    var right = array.count-1
    
    while left < right {
        let mid = (left + right) / 2
        
        if x == array[mid] {
            return true
        } else if x > array[mid] {
            left = mid+1
        } else {
            right = mid
            
    return false
}

// бинарный поиск в возможно развернутом массиве - [4,5,6,7,0,1,2,3]
class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        if nums.count == 0 {
            return -1
        }
        
        var left = 0
        var right = nums.count - 1
        var middle = 0
        
        while left < right {
            middle = (left + right) / 2
            if nums[middle] == target {
                return middle
            }
            if nums[left] <= nums[middle] {
                if target >= nums[left] && target < nums[middle] {
                    right = middle - 1
                } else {
                    left = middle + 1
                }
            } else {
                if target > nums[middle] && target <= nums[right] {
                    left = middle + 1
                } else {
                    right = middle - 1
                }
            }
        }
        
        return nums[left] == target ? left : -1
    }
}
