//
//  Frame.swift
//  BowlingGameKataTDD
//
//  Created by LoaclUser on 05/01/24.
//

import Foundation

protocol Frame {
    var rolls: [Int] { get }
    var startingRoll: Int { get }

    func score() -> Int
    func currentRollingScore() -> Int
    func frameSize() -> Int
    func firstBonusBall() -> Int
    func secondBonusBall() -> Int
}

protocol Rolls{
    func nextRollingScore() -> Int
}
extension Frame {
    
    func firstBonusBall() -> Int {
        let index = startingRoll + frameSize()
        guard index < rolls.count else {
            return 0
        }

        return rolls[index]
    }

    func secondBonusBall() -> Int {
        let index = startingRoll + frameSize() + 1
        guard index < rolls.count else {
            return 0
        }
        
        return rolls[index]
    }
    
    func currentRollingScore() -> Int {
        return rolls[startingRoll]
    }
}
