//
//  GardemGame.swift
//  Bubba
//
//  Created by Natália Pessoa de Azevedo Albuquerque on 22/03/23.
//

import SwiftUI

struct GardemGame: View {
    var body: some View {
        
        let imagensDosBichos = [
                "bicho 1",
                "bicho 2",
                "bicho 3",
                "bicho 4",
        ].shuffled()
        
        VStack{
            Spacer()
            ZStack(alignment: .center){
    
                Text("Abelha")
                    .font(Font.custom("Pacifico-Regular", size: 70))
                    .font(.system(size: 70))
                    .fontWeight(.bold)
            }
            
            HStack{
                Button(action: {
                    // Action code here
                }) {
                    ImageView(image: imagensDosBichos[0])
                    
                }
                Button(action: {
                    // Action code here
                }) {
                    ImageView(image: imagensDosBichos[1])
                    
                }
            }
            HStack{
                Button(action: {
                    // Action code here
                }) {
                    ImageView(image: imagensDosBichos[2])
                    
                }
                Button(action: {
                    // Action code here
                }) {
                    ImageView(image: imagensDosBichos[3])
                    
                }
            }
        }.ignoresSafeArea()
    }
}


struct GardemGame_Previews: PreviewProvider {
    static var previews: some View {
        GardemGame()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}

struct ImageView: View {
    
    var image: String
    
    var body: some View {
        Image(image)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 500, height: 400)
            
    }
}
