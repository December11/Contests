//
//  main.swift
//  Contests
//
//  Created by Alla Shkolnik on 07.11.2022.
//

import Foundation

////// Дана строка (возможно пустая) состоящая из букв A-Z:
///AAAABBBCCXYZDDDDEEEFFFAAAAAABBBBBBBBBBBBBBBBBBBBBBBBBBBB
///
///нужно написать функцию RLE, которая на выходе даст строку вида:
///A4B3C2XYZD4E3F3A6B28
///И генерирует ошибку, если на вход пришла невалидная строка.
///Если символ встречается 1 раз, то он просто пишется, а если более 1 раза, то после него пишется сколько раз он встречается.
///
///

enum Errors: Error {
    case EmptyString
}

func zipString(_ string: String) throws -> String? {
    guard var char = string.first else { throw Errors.EmptyString }
    var result = [String(char)]
    var counter = 0
    for character in string {
        if character != char {
            if counter > 1 {
                result.append(String(counter))
            }
            result.append(String(character))
            char = character
            counter = 1
        } else {
            counter += 1
        }
    }
    result.append(String(counter))
    
    return result.joined(separator: "")
}

do {
    try print(zipString("AAAABBBCCXYZDDDDEEEFFFAAAAAABBBBBBBBBBBBBBBBBBBBBBBBBBBB"))
} catch {
    print("I cannot read this string!")
}
