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
}
