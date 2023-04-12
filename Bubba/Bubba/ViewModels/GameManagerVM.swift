//
//  GameManagerVM.swift
//  Bubba
//
//  Created by Natália Pessoa de Azevedo Albuquerque on 05/04/23.
//

import SwiftUI

class GameManagerVM : ObservableObject {

    static var currentIndex = 0
    
    static func createGameModel(i:Int) -> Quiz {
        return Quiz(currentQuestionIndex: i, quizModel: quizData[i])
    }
    
    
    @Published var model = GameManagerVM.createGameModel(i: GameManagerVM.currentIndex)

    
    func verifyAnswer(selectedOption: QuizOption) {
        for index in model.quizModel.optionsList.indices {
            model.quizModel.optionsList[index].isMatched = false
            model.quizModel.optionsList[index].isSelected = false
            
        }
        if let index = model.quizModel.optionsList.firstIndex(where: {$0.optionId == selectedOption.optionId}) {
            if selectedOption.optionId ==  model.quizModel.answer {
                playSound(sound: "uihuu")
                model.quizModel.optionsList[index].isMatched = true
                model.quizModel.optionsList[index].isSelected = true
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    
                    if (GameManagerVM.currentIndex < 7) {
                        GameManagerVM.currentIndex = GameManagerVM.currentIndex + 1
                        playSound(sound: GameManagerVM.quizData[GameManagerVM.currentIndex].sound)
                        self.model = GameManagerVM.createGameModel(i: GameManagerVM.currentIndex)
                        
                    } else {
                        
                        self.model.quizCompleted = true
                        self.model.quizWinningStatus = true

                    }
                }
                
                
                
            } else {
                playSound(sound: "anan")
                model.quizModel.optionsList[index].isMatched = false
                model.quizModel.optionsList[index].isSelected = true
            }

        }
        
    }

}

extension GameManagerVM
{
    static var quizData: [QuizModel] {
        [
            QuizModel(question: "AbelhaLetra",
                      answer: "B", sound: "abelha",
                      optionsList: [QuizOption(id: 11, optionId: "A", option: "Soldadinho"),
                                    QuizOption(id: 12,optionId: "B", option: "abelha"),
                                    QuizOption(id: 13,optionId: "C", option: "Minhoca"),
                                    QuizOption(id: 14,optionId: "D", option: "Aranha")]),
            
            QuizModel(question: "AranhaLetra",
                      answer: "C", sound: "aranha",
                      optionsList: [QuizOption(id: 21,optionId: "A", option: "abelha"),
                                    QuizOption(id: 22,optionId: "B", option: "Minhoca"),
                                    QuizOption(id: 23,optionId: "C", option: "Aranha"),
                                    QuizOption(id: 24,optionId: "D", option: "Boboleta")]),
            
            QuizModel(question: "BorboletaLetra",
                      answer: "B", sound: "borboleta",
                      optionsList: [QuizOption(id: 31,optionId: "A", option: "Sapo"),
                                    QuizOption(id: 32,optionId: "B", option: "Boboleta"),
                                    QuizOption(id: 33,optionId: "C", option: "abelha"),
                                    QuizOption(id: 34,optionId: "D", option: "Soldadinho")]),
            
            QuizModel(question: "CaracolLetra",
                      answer: "A", sound: "caracol",
                      optionsList: [QuizOption(id: 31,optionId: "A", option: "Caracol"),
                                    QuizOption(id: 32,optionId: "B", option: "Sapo"),
                                    QuizOption(id: 33,optionId: "C", option: "Aranha"),
                                    QuizOption(id: 34,optionId: "D", option: "Boboleta")]),
            
            QuizModel(question: "JoaninhaLetra",
                      answer: "A", sound: "joaninha",
                      optionsList: [QuizOption(id: 31,optionId: "A", option: "Joaninha"),
                                    QuizOption(id: 32,optionId: "B", option: "Soldadinho"),
                                    QuizOption(id: 33,optionId: "C", option: "Aranha"),
                                    QuizOption(id: 34,optionId: "D", option: "Boboleta")]),
            
            QuizModel(question: "SoldadinhoLetra",
                      answer: "A", sound: "soldadinho",
                      optionsList: [QuizOption(id: 31,optionId: "A", option: "Soldadinho"),
                                    QuizOption(id: 32,optionId: "B", option: "Minhoca"),
                                    QuizOption(id: 33,optionId: "C", option: "Aranha"),
                                    QuizOption(id: 34,optionId: "D", option: "Boboleta")]),
            
            QuizModel(question: "MinhacaLetra",
                      answer: "C", sound: "minhoca",
                      optionsList: [QuizOption(id: 31,optionId: "A", option: "Aranha"),
                                    QuizOption(id: 32,optionId: "B", option: "Soldadinho"),
                                    QuizOption(id: 33,optionId: "C", option: "Minhoca"),
                                    QuizOption(id: 34,optionId: "D", option: "Boboleta")]),
            
            QuizModel(question: "SapoLetra",
                      answer: "D", sound: "sapo",
                      optionsList: [QuizOption(id: 31,optionId: "A", option: "Boboleta"),
                                    QuizOption(id: 32,optionId: "B", option: "Soldadinho"),
                                    QuizOption(id: 33,optionId: "C", option: "Aranha"),
                                    QuizOption(id: 34,optionId: "D", option: "Sapo")]),
        ]
    }
}

