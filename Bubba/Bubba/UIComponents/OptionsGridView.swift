//
//  OptionsGridView.swift
//  Bubba
//
//  Created by Natália Pessoa de Azevedo Albuquerque on 05/04/23.
//

import SwiftUI

struct OptionsGridView: View {
    var gameManagerVM: GameManagerVM
    
    var columns: [GridItem] = Array(repeating: GridItem(.fixed(550), spacing: 100), count: 2)
    
    var body: some View {
        
        LazyVGrid(columns: columns, spacing: 0) {
            ForEach(gameManagerVM.model.quizModel.optionsList) { quizOption in
                HStack{
                    OptionCardView(quizOption: quizOption)
                        .onTapGesture {
                            gameManagerVM.verifyAnswer(selectedOption: quizOption)
                        }
                }

            }
        }
//        .background(Color.white)

    }
}

struct OptionCardView : View {
    var quizOption: QuizOption

    
    var body: some View {
        VStack {
            if (quizOption.isMatched) && (quizOption.isSelected) {
                OptionView(quizOption: quizOption)
                    .overlay(Color.green.opacity(0.5).frame(width: 500, height: 250).cornerRadius(50))
//                OptionStatusImageView(imageName: "checkmark") // EU POSSO COLOCAR O EFEITO PISCADINHO VERMELHO
            } else if (!(quizOption.isMatched) && (quizOption.isSelected)) {
                OptionView(quizOption: quizOption)
                    .overlay(Color.red.opacity(0.5).frame(width: 500, height: 250).cornerRadius(50))
//                OptionStatusImageView(imageName: "xmark") // EU POSSO COLOCAR O EFEITO PISCADINHO VERMELHO
            } else {
                OptionView(quizOption: quizOption)
            }
        }
        .frame(width: 600, height: 280)
//            .background(setBackgroundColor())
            .cornerRadius(50)
            .padding(.bottom, 50)
            .padding(.leading, 50)
            .padding(.trailing, 50)
            
    }
    
    func setBackgroundColor() -> Color {
        if (quizOption.isMatched) && (quizOption.isSelected) {
            return Color.green
//                .opacity(0.5)
        } else if (!(quizOption.isMatched) && (quizOption.isSelected)) {
            return Color.red
        } else {
            return Color.white
        }
    }
}

struct OptionView: View {
    var quizOption: QuizOption
    var body: some View {
            VStack{
                if quizOption.option == "Minhoca" || quizOption.option == "Sapo" || quizOption.option == "Caracol" || quizOption.option == "Joaninha"{
                    Image(quizOption.option)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(.all, 40)
                
                } else if quizOption.option == "Soldadinho" {
                    Image(quizOption.option)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(.all, 70)
                } else {
                    Image(quizOption.option)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
                
                    
            }
    }
}

struct OptionStatusImageView: View {
    var imageName: String

    var body: some View {
        ZStack{
            
        }
//        Image(systemName: imageName)
//            .resizable()
//            .aspectRatio(contentMode: .fit)
//            .padding(EdgeInsets(top: 60, leading: 40, bottom: 40, trailing: 40))
//            .foregroundColor(Color.white)
    }
}


//struct OptionsGridView_Previews: PreviewProvider {
//    static var previews: some View {
//        OptionsGridView()
//    }
//}
