//
//  SpareFrameModel.swift
//  BowlingGameKataTDD
//
//  Created by LoaclUser on 05/01/24.
//

import Foundation

class SpareFrameModel: Frame {
    
    var id: UUID = UUID()
    
    let rolls: [Int]
    let startingRoll: Int

     init(rolls: [Int], staringIndex: Int) {
       self.rolls = rolls
       self.startingRoll = staringIndex
     }
    
     func score() -> Int {
         guard startingRoll + 2 < rolls.count else { return 0 }
         return AppConstants.spareScore + firstBonusBall()
     }

    func frameSize() -> Int {
        return 2
    }
    
    func nextRollingScore() -> Int {
        let index = startingRoll + 1
        guard index < rolls.count else {
            return 0
        }
        return rolls[index]
    }

}

extension SpareFrameModel {
    
    static func == (lhs: SpareFrameModel, rhs: SpareFrameModel) -> Bool {
        return lhs.id == rhs.id
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
