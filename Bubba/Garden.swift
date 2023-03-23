//
//  Garden.swift
//  Bubba
//
//  Created by Natália Pessoa de Azevedo Albuquerque on 23/03/23.
//

import SwiftUI

struct Garden: View {
    @State private var shouldAnimate = false
    @State private var playAnimation : Bool = false
    
    var body: some View {
        
        let imagensDosBichos = [
                "bicho 1",
                "bicho 2",
                "bicho 3",
                "bicho 4",
        ]
        
        
        ZStack{
            Button(action: {
                self.playAnimation.toggle()
            }) {
                Bichinho(image: imagensDosBichos[0])
                    .frame(width: 200)
                    .offset(x: 190.0, y: -130.0)
                    .scaleEffect(shouldAnimate ? 1.2 : 1.0)
                    .animation(Animation.easeInOut(duration: 1.0).repeatForever(autoreverses: true))
                    .onAppear() {
                        self.shouldAnimate = true
                    }
//                    .offset(x: self.playAnimation ? UIScreen.main.bounds.width - 120 : 120)
                Bichinho(image: imagensDosBichos[1])
                    .frame(width: 200)
                    .offset(x: -130.0, y: -100.0)
                    .scaleEffect(shouldAnimate ? 1.2 : 1.0)
                    .animation(Animation.easeInOut(duration: 0.9).repeatForever(autoreverses: true))
                    .onAppear() {
                        self.shouldAnimate = true
                    }
//                    .offset(x: self.playAnimation ? UIScreen.main.bounds.width - 120 : 0)
                Bichinho(image: imagensDosBichos[2])
                    .frame(width: 200)
                    .offset(x: 140.0, y: -10.0)
                    .scaleEffect(shouldAnimate ? 1.2 : 1.0)
                    .animation(Animation.easeInOut(duration: 0.8).repeatForever(autoreverses: true))
                    .onAppear() {
                        self.shouldAnimate = true
                    }
//                    .offset(x: self.playAnimation ? UIScreen.main.bounds.width - 120 : 0)
                Bichinho(image: imagensDosBichos[3])
                    .frame(width: 200)
                    .offset(x: -290.0, y: 60.0)
                    .scaleEffect(shouldAnimate ? 1.2 : 1.0)
                    .animation(Animation.easeInOut(duration: 0.5).repeatForever(autoreverses: true))
                    .onAppear() {
                        self.shouldAnimate = true
                    }
//                    .offset(x: self.playAnimation ? UIScreen.main.bounds.width - 120 : 0)
                    
                
            }
            
                

            
        }
    }
}

struct Garden_Previews: PreviewProvider {
    static var previews: some View {
        Garden()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}

struct Bichinho: View {
    
    var image: String
    
    var body: some View {
        
        Image(image)
            .resizable()
            .aspectRatio(contentMode: .fit)
    }
}


