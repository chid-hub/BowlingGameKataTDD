//
//  OpenFrameModel.swift
//  BowlingGameKataTDD
//
//  Created by LoaclUser on 05/01/24.
//

import Foundation

class OpenFrameModel: Frame {
    
    var id: UUID = UUID()

   let rolls: [Int]
   let startingRoll: Int

    init(rolls: [Int], staringIndex: Int) {
      self.rolls = rolls
      self.startingRoll = staringIndex
    }

     func score() -> Int {
        guard startingRoll + 1 < rolls.count else { return  rolls[startingRoll]} // Stop processing frames if there are not enough rolls
        return rolls[startingRoll] + rolls[startingRoll + 1]
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

extension OpenFrameModel {
    
    static func == (lhs: OpenFrameModel, rhs: OpenFrameModel) -> Bool {
        return lhs.id == rhs.id
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
