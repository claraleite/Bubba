//
//  RoomHomeView.swift
//  Bubba
//
//  Created by mccl on 22/03/23.
//

import SwiftUI

struct RoomHomeView: View {
    
    @State var isDark: Bool = false
    @State var switchWiggles = false
    
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
                        .rotationEffect(.degrees(switchWiggles ? 1.0 : 0))
                        .rotation3DEffect(.degrees(1.0), axis: (x: 0, y: 5, z: 0))
                        .animation(Animation.easeInOut(duration: 0.15).repeatForever(), value: switchWiggles)
                        .onAppear() {
                            switchWiggles.toggle()
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
