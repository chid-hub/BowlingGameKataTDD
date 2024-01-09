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
        
        VStack{
            Text("Click number of pin knocked down")
            HStack(spacing: 10) {
                ForEach(0...5,id: \.self) { index in
                    PinButton(viewModel: viewModel, pinNumber: index)
                }
            }
            HStack(spacing: 10) {
                ForEach(6...10,id: \.self) { index in
                    PinButton(viewModel: viewModel, pinNumber: index)
                }
            }
        }
    }
}

struct SwiftUIBowlingGameView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = BowlingGameViewModel(bowlingGameModel: BowlingGameModel())
        SwiftUIBowlingGameView(viewModel: viewModel)
    }
}

struct PinButton: View {
    var viewModel: BowlingGameViewModel
    var pinNumber: Int = 1
    var body: some View {
        Button(action: {
            self.viewModel.roll(pins: pinNumber)
        }) {
            Text("\(pinNumber)")
        }.padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(8)
    }
}
