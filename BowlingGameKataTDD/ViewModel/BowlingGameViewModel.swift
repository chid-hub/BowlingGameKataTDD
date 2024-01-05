//
//  BowlingGameViewModel.swift
//  BowlingGameKataTDD
//
//  Created by LoaclUser on 05/01/24.
//

import Foundation

// Protocol
protocol BowlingGameViewModelProtocol {
    func roll(_ pins: Int)
    func score() -> Int
}

class BowlingGameViewModel: BowlingGameViewModelProtocol {
    
    private var model: BowlingGameModel

     init(bowlingGameModel: BowlingGameModel) {
         self.model = bowlingGameModel
     }

     func roll(_ pins: Int) {
         model.roll(pins: pins)
     }

     func score() -> Int {
         return model.score()
     }
 }
