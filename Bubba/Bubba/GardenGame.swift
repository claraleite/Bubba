//
//  GardemGame.swift
//  Bubba
//
//  Created by Natália Pessoa de Azevedo Albuquerque on 22/03/23.
//

import SwiftUI

struct GardenGameView: View {
    @ObservedObject var gameManagerVM: GameManagerVM
    var body: some View {
        ZStack {
            
            
            if (gameManagerVM.model.quizCompleted) {
                QuizCompletedView(gameManagerVM: gameManagerVM)
            } else {
                ZStack{
                    Image("GameBackground_Prancheta 1") 
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                    
                    
                    VStack {
                        
                        ReusableImage(image: gameManagerVM.model.quizModel.question)
                        
                        
                        OptionsGridView(gameManagerVM: gameManagerVM)
                        
                        Spacer()
                    }
                }
                
            }
        }
    }
}

struct GardemGame_Previews: PreviewProvider {
    static var previews: some View {
        GardenGameView(gameManagerVM: GameManagerVM())
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
