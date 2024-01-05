//
//  BowlingGameModel.swift
//  BowlingGameKataTDD
//
//  Created by LoaclUser on 05/01/24.
//

import Foundation

class BowlingGameModel {
   
    var rolls: [Int] = []
    
    func roll(pins: Int) {
        rolls.append(pins)
    }

    func score() -> Int {
          return rolls.reduce(0, +)
      }
}
