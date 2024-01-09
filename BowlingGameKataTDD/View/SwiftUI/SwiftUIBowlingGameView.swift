//
//  SwiftUIContentView.swift
//  BowlingGameKataTDD
//
//  Created by LoaclUser on 08/01/24.
//

import SwiftUI

struct SwiftUIBowlingGameView: View {
    @ObservedObject var viewModel: BowlingGameViewModel

    var body: some View {
        Text("Total Score: \(viewModel.score())")
    }
}

struct SwiftUIBowlingGameView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = BowlingGameViewModel(bowlingGameModel: BowlingGameModel())
        SwiftUIBowlingGameView(viewModel: viewModel)
    }
}
