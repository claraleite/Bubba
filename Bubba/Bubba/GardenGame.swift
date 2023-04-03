//
//  GardemGame.swift
//  Bubba
//
//  Created by Natália Pessoa de Azevedo Albuquerque on 22/03/23.
//

import SwiftUI

struct GardemGame: View {
    
    
    @State private var buttonColor0 = Color.white
    @State private var buttonColor1 = Color.white
    @State private var buttonColor2 = Color.white
    @State private var buttonColor3 = Color.white
    
    var body: some View {
        
        let dictName: [String : String] = ["abelha 1" : "Garden Images_03",
                                           "joaninha" : "Garden Images_01",
                                           "borboleta" : "Garden Images_02",
                                           "soldadinho" : "Garden Images_04",
        ]
        
        let nomeDoInseto = [
            "abelha 1",
            "joaninha",
            "borboleta",
            "soldadinho",
        ]
            .shuffled()
        
        let imagensDosBichos = [
            "Garden Images_01",
            "Garden Images_02",
            "Garden Images_03",
            "Garden Images_04",
        ]
            .shuffled()
        
        
        let cenarioAbelha: [String : Color] = ["Garden Images_03" : Color.green,
                                               "Garden Images_01" : Color.red,
                                               "Garden Images_02" : Color.red,
                                               "Garden Images_04" : Color.red
        ]
        
        
        ZStack{
////            for insetos in nomeDoInseto {
//                if nomeDoInseto = dictName.keys {
//                    print ("")
//                } else {
//                    print ("")
//                }
////            }
            
            VStack{
                Spacer()
                
                nomeView(image: nomeDoInseto[0])
                
                HStack{
                    ImageButton(image: imagensDosBichos[0], action: {
                        print("acertou")
                        self.buttonColor0 = cenarioAbelha[imagensDosBichos[0]] ?? Color.white
//                        self.buttonColor0 = Color.green
                        withAnimation(.linear(duration: 0.9)) {
                            self.buttonColor0 = Color.white
                        }
                        
                    }, backgorundColor: buttonColor0)
                    
                    ImageButton(image: imagensDosBichos[1], action: {
                        print("errou")
                        self.buttonColor1 = cenarioAbelha[imagensDosBichos[1]] ?? Color.white
                        withAnimation(.linear(duration: 0.9)) {
                            self.buttonColor1 = Color.white
                        }
                        
                    }, backgorundColor: buttonColor1)
                }
                HStack{
                    ImageButton(image: imagensDosBichos[2], action: {
                        print("errou")
                        self.buttonColor2 = cenarioAbelha[imagensDosBichos[2]] ?? Color.white
                        withAnimation(.linear(duration: 0.9)) {
                            self.buttonColor2 = Color.white
                        }
                        
                    }, backgorundColor: buttonColor2)
                    
                    ImageButton(image: imagensDosBichos[3], action: {
                        print("errou")
                        self.buttonColor3 = cenarioAbelha[imagensDosBichos[3]] ?? Color.white
                        withAnimation(.linear(duration: 0.9)) {
                            self.buttonColor3 = Color.white
                        }
                        
                    }, backgorundColor: buttonColor3)
                }
                
                
                
                
            }.ignoresSafeArea()
                .edgesIgnoringSafeArea(.all)
            
        }
    }
}

struct ImageButton: View {
    let image: String
    let action: () -> Void
    let backgorundColor: Color
    
    var body: some View {
        Button(action:
                
                action) {
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 680, height: 400)
                .background(backgorundColor)
            
        }
    }
}


struct nomeView: View {
    
    var image: String
    
    var body: some View {
        Image(image)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 200, height: 200)
    }
}

struct ImageView: View {
    
    var image: String
    
    var body: some View {
        Image(image)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 680, height: 400)
            .background(Color.white)
        
    }
}

struct Question {
    let insectName: String
    let correctAnswer: String
    //    let answerOptions: [String]
}

struct GardemGame_Previews: PreviewProvider {
    static var previews: some View {
        GardemGame()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
