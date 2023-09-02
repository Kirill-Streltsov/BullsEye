//
//  ContentView.swift
//  BullsEye
//
//  Created by Kirill Streltsov on 02.09.23.
//

import SwiftUI

struct ContentView: View {
    
    @State var game = Game()
    @State var guess: RGB
    @State var showScore = false
    
    let circleSize: CGFloat = 0.275
    let labelHeight: CGFloat = 0.06
    let labelWidth: CGFloat = 0.53
    let buttonWidth: CGFloat = 0.87
    
    var body: some View {
        GeometryReader { proxy in
            ZStack {
                Color.element
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    ColorCircle(
                        rgb: game.target,
                        size: proxy.size.height * circleSize)
                    
                    if !showScore {
                        BevelText(
                            text: "R: ??? G: ??? B: ???",
                            width: proxy.size.width * labelWidth,
                            height: proxy.size.height * labelHeight)
                    } else {
                        BevelText(
                            text: game.target.intString(),
                            width: proxy.size.width * labelWidth,
                            height: proxy.size.height * labelHeight)
                    }
                    
                    ColorCircle(
                        rgb: guess,
                        size: proxy.size.height * circleSize)
                    BevelText(text: guess.intString(), width: 200, height: 48)
                    
                    ColorSlider(value: $guess.red, trackColor: .red)
                    ColorSlider(value: $guess.green, trackColor: .green)
                    ColorSlider(value: $guess.blue, trackColor: .blue)
                    
                    Button("Hit me!") {
                        showScore = true
                        game.check(guess: guess)
                    }
                    .buttonStyle(
                        NeuButtonStyle(
                            width: proxy.size.width * buttonWidth,
                            height: proxy.size.height * labelHeight))
                    .alert(isPresented: $showScore) {
                        Alert(
                            title: Text("Your Score"),
                            message: Text(String(game.scoreRound)),
                            dismissButton: .default(Text("OK")) {
                                game.startNewRound()
                                guess = RGB()
                            })
                    }
                    
                }
                .font(.headline)
            }
        }
        
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(guess: RGB())
    }
}

struct ColorSlider: View {
    
    @Binding var value: Double
    var trackColor: Color
    
    var body: some View {
        HStack {
            Text("0")
            Slider(value: $value)
                .tint(trackColor)
            Text("255")
        }
        .padding(.horizontal)
    }
}
