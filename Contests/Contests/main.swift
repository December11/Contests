//
//  main.swift
//  Contests
//
//  Created by Alla Shkolnik on 07.11.2022.
//

import Foundation

////// 242. Valid Anagram
/// Given two strings s and t, return true if t is an anagram of s, and false otherwise.
/// An Anagram is a word or phrase formed by rearranging the letters of a different word or phrase, typically using all the original letters exactly once.
///

class Solution {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        // 1. создать два словаря
        // 2. добавить все символы первого слова в первый словарь
        // 3. добавить все символы второго слова во второй словарь
        // 4. проверить совпадает ли массив ключей.
        
        func makeDictionary(_ s: String) -> [Character: Int] {
            var results = [Character: Int]()
            for char in s {
                if results.keys.contains(char) {
                    if let oldValue = results[char] {
                        results[char] = oldValue + 1
                    }
                } else {
                    results[char] = 1
                }
            }
            
            return results
        }
        
        let sDict = makeDictionary(s)
        let tDict = makeDictionary(t)
        
        return sDict == tDict
    }
}
