//
//  BowlingGameViewModel.swift
//  BowlingGameKataTDD
//
//  Created by LoaclUser on 05/01/24.
//

import Foundation

// Protocol
protocol BowlingGameViewModelProtocol {
    func roll(pins: Int)
    func score() -> Int
}

class BowlingGameViewModel: BowlingGameViewModelProtocol {
    
    private var model: BowlingGameModel

     init(bowlingGameModel: BowlingGameModel) {
         self.model = bowlingGameModel
     }

     func roll(pins: Int) {
         model.roll(pins: pins)
     }

     func score() -> Int {
         return model.score()
     }
 }

extension BowlingGameViewModel {
    
    func getAllFrames() -> [Frame] {
        return model.getAllFrames()
    }

    func resetGame()  {
        model.resetGame()
    }

}
