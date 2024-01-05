//
//  StrikeFrameModel.swift
//  BowlingGameKataTDD
//
//  Created by LoaclUser on 05/01/24.
//

import Foundation

class StrikeFrameModel: Frame {
    
    let rolls: [Int]
    let startingRoll: Int
    
    init(rolls: [Int], staringIndex: Int) {
        self.rolls = rolls
        self.startingRoll = staringIndex
    }
    
    func score() -> Int {
        guard startingRoll + 2 < rolls.count else { return 0 } // Stop processing frames if there are not enough rolls
        return 10 + rolls[startingRoll + 1] + rolls[startingRoll + 2]
    }
    func frameSize() -> Int {
        return 1
    }
    
    
}
