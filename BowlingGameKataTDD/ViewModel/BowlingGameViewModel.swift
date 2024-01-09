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

class BowlingGameViewModel: BowlingGameViewModelProtocol, ObservableObject {
    
    private var model: BowlingGameModel
    
    @Published private var scores: Int = 0


     init(bowlingGameModel: BowlingGameModel) {
         self.model = bowlingGameModel
     }

     func roll(pins: Int) {
         model.roll(pins: pins)
         self.scores = scores
     }

     func score() -> Int {
         return model.score()
     }
 }

extension BowlingGameViewModel {
    
    func getAllFrames() -> [any Frame] {
        return model.getAllFrames()
    }

    func resetGame()  {
        model.resetGame()
        self.scores = scores

    }
    
    func getFrameViewScore(frameindex: Int) -> String {
        
        let frame = getAllFrames()[frameindex]
        
        if let openFrame = frame as? OpenFrameModel {
            return "\(openFrame.currentRollingScore())  \(openFrame.nextRollingScore())"
        }
        
        if let spareFrame = frame as? SpareFrameModel {
            if frameindex == 9 {
                return "\(spareFrame.currentRollingScore()) / \(spareFrame.firstBonusBall())"

            }
            return "\(spareFrame.currentRollingScore())  /"
        }
         if let strikeframe = frame as? StrikeFrameModel{
             if frameindex == 9 {
                 return "X \(strikeframe.firstBonusBall())  \(strikeframe.secondBonusBall())"
             }
             
             return "X"
        }
        
        return ""
    }

}
