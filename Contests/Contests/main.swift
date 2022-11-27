//
//  main.swift
//  Contests
//
//  Created by Alla Shkolnik on 07.11.2022.
//

import Foundation

////// Задача
/// Игрок в футбол обладает одной числовой характеристикой - профессионализм.
/// команда называется сплоченной, если профессионализм одного игрока не превосходмт суммарный проф. двух любых других игроков команды.
/// Команда состоит из любого числа игроков.
/// Дана отсортированная последовательность чисел длинной N - професионализм игроков.
///
/// необходимо найти макс. суммарный професионализм сплоченной команды.
///

func bestTeamSum(players: [Int]) -> Int {
    var bestSum = 0
    var nowSum = 0
    var last = 0
    for first in 0..<players.count {
        while last < players.count &&
                (last == first || players[first] + players[first+1] >= players[last]) {
            nowSum += players[last]
            last += 1
        }
        
        bestSum = max(bestSum, nowSum)
        nowSum -= players[first]
    }
    
    return bestSum
}
