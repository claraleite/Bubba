//
//  RoomHomeView.swift
//  Bubba
//
//  Created by mccl on 22/03/23.
//

import SwiftUI

struct RoomHomeView: View {
    
    @State var isDark: Bool = false
    @State private var shouldAnimate = false
    
    var body: some View {
        
        GeometryReader { geometry in
            
            ZStack {
                
                DefaultBackground(imageName: isDark ? "Quarto-escuro" : "Quarto")
                
                
                VStack {
                    
                    Button(action: {
                        
                    }) {
                        Image(isDark ? "Popup-play" : "")
                            .padding(.all)
                            .offset(x: 0, y: -(geometry.size.height * 0.3))
                    }
                    
                    
                }
                
                Button(action: {
                    withAnimation {
                        isDark.toggle()
                    }
                    
                    
                }) {
                    Image("Interruptor")
                        .position(x: (geometry.size.width * 0.33), y: geometry.size.height * 0.63)
                        .scaleEffect(shouldAnimate ? 1.1 : 1.05)
                        .animation(Animation.easeInOut(duration: 0.7).repeatForever(autoreverses: true))
                        .onAppear() {
                            self.shouldAnimate = true
                        }
                    
                }
                
                
                
            }
        }
    }
}

struct RoomHomeView_Previews: PreviewProvider {
    static var previews: some View {
        RoomHomeView()
            .previewInterfaceOrientation(.landscapeLeft)
        
    }
}
