//
//  GardemGame.swift
//  Bubba
//
//  Created by Natália Pessoa de Azevedo Albuquerque on 22/03/23.
//

import SwiftUI

struct GardenGameView: View {
    @ObservedObject var gameManagerVM: GameManagerVM
    
    @Binding var isPresenting: Bool
    @Environment(\.dismiss) private var dismiss

    
    var body: some View {
        
        GeometryReader { geometry in
            
            ZStack {
                
                
                if (gameManagerVM.model.quizCompleted) {
                    QuizCompletedView(gameManagerVM: gameManagerVM)
                    
                } else {
                    ZStack{
                        Image("GameBackground_Prancheta 1") 
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .ignoresSafeArea(.all, edges: .all)
                        
                        Image("btn close")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: geometry.size.width * 0.10, height: geometry.size.height * 0.10)
                            .position(x: geometry.size.width * 0.92, y: geometry.size.height * 0.08)
                            .onTapGesture {
                                dismiss()
                            }
                        
                        
                        VStack {
                            
                            ReusableImage(image: gameManagerVM.model.quizModel.question, sound: gameManagerVM.model.quizModel.sound)
                            
                            
                            OptionsGridView(gameManagerVM: gameManagerVM)
                            
                            Spacer()
                        }
                    }
                    
                }
            }.onAppear() {
                playSound(sound: "vamos brincar")
            }
        }
    }
}

struct GardemGame_Previews: PreviewProvider {
    static var previews: some View {
        GardenGameView(gameManagerVM: GameManagerVM(), isPresenting: .constant(true))
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
