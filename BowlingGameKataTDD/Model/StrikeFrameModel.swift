//
//  StrikeFrameModel.swift
//  BowlingGameKataTDD
//
//  Created by LoaclUser on 05/01/24.
//

import Foundation

class StrikeFrameModel: Frame {
    
    var id: UUID = UUID()
    
    let rolls: [Int]
    let startingRoll: Int
    
    init(rolls: [Int], staringIndex: Int) {
        self.rolls = rolls
        self.startingRoll = staringIndex
    }
    
    func score() -> Int {
        guard startingRoll + 2 < rolls.count else { return 0 } // Stop processing frames if there are not enough rolls
        return AppConstants.strikeScore + firstBonusBall() + secondBonusBall()
    }
    func frameSize() -> Int {
        return 1
    }
    
    
}

extension StrikeFrameModel {
    
    static func == (lhs: StrikeFrameModel, rhs: StrikeFrameModel) -> Bool {
        return lhs.id == rhs.id
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
