//
//  main.swift
//  Contests
//
//  Created by Alla Shkolnik on 07.11.2022.
//

import Foundation

////// Задача
/// Дана строка S
/// Выведите гистограмму как в примере (коды символов отсортированы)
/// S = "Hello, World!"
///
///        #
///        ##
///  ##########
///   !,Hdelorw

func countRepeating(string: String) -> [Character: Int] {
    var dictionary = [Character: Int]()
    for letter in string {
        if !dictionary.keys.contains(letter) {
            dictionary.updateValue(0, forKey: letter)
        }
        if let oldValue = dictionary[letter] {
            dictionary.updateValue(oldValue + 1, forKey: letter)
        }
    }
    
    return dictionary
}

func countBeatingRooks() {
    let dictionary = countRepeating(string: "Hello, World!")
    guard
        let max = dictionary.values.max()
    else { return }
    let sortedKeys = dictionary.keys.sorted()
    
    var rows = max
    while rows > 0 {
        var str = ""
        for letter in sortedKeys {
            if let n = dictionary[letter] {
                n >= rows ? str.append("#") : str.append(" ")
            }
        }
        print(str)
        rows -= 1
    }
    if let res = sortedKeys as? [String] {
        print(res)
    }
    if let res = sortedKeys as? [String] {
        print(res.joined(separator: ""))
    }
}

countBeatingRooks()
