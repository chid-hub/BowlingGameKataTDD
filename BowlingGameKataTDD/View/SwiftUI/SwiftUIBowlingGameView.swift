//
//  SwiftUIContentView.swift
//  BowlingGameKataTDD
//
//  Created by LoaclUser on 08/01/24.
//

import SwiftUI

struct SwiftUIBowlingGameView: View {
    @ObservedObject var viewModel: BowlingGameViewModel
    
    let columns = [
        GridItem()
    ]
    var body: some View {
       
        VStack {
            ScrollView(.horizontal) {
                LazyHGrid(rows: columns, spacing: 10) {
                    ForEach(Array(viewModel.getAllFrames().enumerated()),id: \.element.id) { index,frame in
                        FrameView(viewModel: viewModel, frameNumber: index)
                    }
                }.padding()
            }.frame(height:100)
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
                
                Button(action: {
                    self.viewModel.resetGame()
                }) {
                    Text("Reset Game")
                }.padding()
                    .background(Color.orange)
                    .foregroundColor(.white)
                    .cornerRadius(8)
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

struct FrameView: View {
    var viewModel: BowlingGameViewModel
    var frameNumber: Int
    
    var body: some View {
        VStack(spacing: 10) {
            Text("\(frameNumber + 1)")
            Text(viewModel.getFrameViewScore(frameindex: frameNumber))
        }
        .padding()
        .background(Color.blue.opacity(0.5))
        .cornerRadius(8)
        
    }
}
