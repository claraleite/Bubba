//
//  RoomHomeView.swift
//  Bubba
//
//  Created by mccl on 22/03/23.
//

import SwiftUI

struct RoomHomeView: View {
    
    @Binding var isPresenting: Bool
    @Environment(\.dismiss) private var dismiss
    
    @State var isPresentingRoomGameView: Bool = false
    
    @State var isDark: Bool = false
    @State private var shouldAnimate = false
    
    var body: some View {
        
        GeometryReader { geometry in
            
            ZStack {
                
                NavigationLink(destination: RoomGameView(isPresenting: $isPresentingRoomGameView), isActive: $isPresentingRoomGameView) {
                    
                    EmptyView()
                    
                }.isDetailLink(false)
                    .navigationBarTitle("")
                    .navigationBarHidden(true)
                    .navigationBarBackButtonHidden(true)
                
                DefaultBackground(imageName: isDark ? "bubba quarto escuro" : "bubba quarto")
                
                Image(isDark ? "bubba escura" : "bubba")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: geometry.size.width * 0.3, height: geometry.size.height * 0.4)
                    .position(x: geometry.size.width * 0.5, y: geometry.size.height * 0.7)
                
                
                VStack {
                    
                    Image(isDark ? "Popup-play" : "")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: geometry.size.width * 0.7, height: geometry.size.height * 0.25)
                        .position(x: geometry.size.width * 0.5 , y: geometry.size.height * 0.16)
                        .contentShape(Rectangle())
                        .onTapGesture {
                            isPresentingRoomGameView = true
                        }
                    
                    Image(isDark ? "interruptor escuro" : "interruptor")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: geometry.size.width * 0.15, height: geometry.size.height * 0.15)
                        .position(x: geometry.size.width * 0.61, y: geometry.size.height * 0)
                        .onTapGesture {
                            isDark.toggle()
                        }
                        .scaleEffect(shouldAnimate ? 1.09 : 1.05)
                        .animation(Animation.easeInOut(duration: 0.7).repeatForever(autoreverses: true), value: shouldAnimate)
                        .onAppear() {
                            self.shouldAnimate = true
                            if isDark == true {
                                shouldAnimate = false
                            }
                        }
                        
                        
                    
                    
                }
                
                
                
                
                
                
            }
        }
    }
}
    
struct RoomHomeView_Previews: PreviewProvider {
    static var previews: some View {
        RoomHomeView(isPresenting: .constant(true))
            .previewInterfaceOrientation(.landscapeLeft)
        
    }
}
