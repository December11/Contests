//
//  main.swift
//  Contests
//
//  Created by Alla Shkolnik on 07.11.2022.
//

import Foundation

////// Задача
/// На шахматной доске N x N  находятся М ладей (ладья бьет клеткий в той же горизонтали и вертикали до ближайшей занятой)
/// Определите, сколько пар ладей бьют друг друга.
/// Ладьи задаютcя парой чисел I и J,  обозначающих координаты клетки.
/// 1 <= N <= 10^9, 0 <= M <= 2*10^5
///

func addRook(rowOrColumn: inout [Int: Int], key: Int) {
    if !rowOrColumn.keys.contains(key) {
        rowOrColumn.updateValue(0, forKey: key)
    }
    if let oldValue = rowOrColumn[key] {
        rowOrColumn.updateValue(oldValue + 1, forKey: key)
    }
    
//    if let oldValue = rowOrColumn[key] {
//        rowOrColumn.updateValue(oldValue + 1, forKey: key)
//    } else {
//        rowOrColumn.updateValue(0, forKey: key)
//    }
}

func countPairs(rowOrColumn: inout [Int: Int]) -> Int {
    var pairs = 0
    for key in rowOrColumn.keys {
        if let value = rowOrColumn[key] {
            pairs += value - 1
        }
    }
    
    return pairs
}

func countBeatingRooks(rookCoordinates: [Int: Int]) -> Int {
    var rooksInRow = [Int: Int]()
    var rooksInColumn = [Int: Int]()
    
    rookCoordinates.forEach { (row, column) in
        addRook(rowOrColumn: &rooksInRow, key: row)
        addRook(rowOrColumn: &rooksInColumn, key: column)
    }
    
    return countPairs(rowOrColumn: &rooksInRow) + countPairs(rowOrColumn: &rooksInColumn)
}
