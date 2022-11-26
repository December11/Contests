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

func countRepeating(string: String) -> [String: Int] {
    var dictionary = [String: Int]()
    for letter in string {
        if !dictionary.keys.contains(String(letter)) {
            dictionary.updateValue(0, forKey: String(letter))
        }
        if let oldValue = dictionary[String(letter)] {
            dictionary.updateValue(oldValue + 1, forKey: String(letter))
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
    print(sortedKeys.joined(separator: ""))
}

countBeatingRooks()
