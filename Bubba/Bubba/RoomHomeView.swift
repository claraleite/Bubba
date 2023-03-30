//
//  RoomHomeView.swift
//  Bubba
//
//  Created by mccl on 22/03/23.
//

import SwiftUI

struct RoomHomeView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @State var isDark: Bool = false
    @State private var shouldAnimate = false
    
    @State private var location: CGPoint = CGPoint(x: UIScreen.main.bounds.width * 0.5, y: UIScreen.main.bounds.height * 0.6)
    @State var isDragging = false
    
    var body: some View {
        
        GeometryReader { geometry in
            
            ZStack {
                
                DefaultBackground(imageName: isDark ? "bubba quarto escuro" : "bubba quarto")
                
                Image(isDark ? "bubba medo escura" : "bubba")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: geometry.size.width * 0.3, height: geometry.size.height * 0.4)
                    .position(location)
                    .gesture(
                        DragGesture().onChanged { value in
                            location = value.location
                            isDragging = true
                        }
                            .onEnded { value in
                                withAnimation(.spring()) {
                                    isDragging = false
                                    location = CGPoint(x: location.x, y: geometry.size.height * 0.7)
                                }
                            }
                        )
                
                
                VStack {
                    
                    if isDark {
                        DefaultNavigationButton(icon: Image(isDark ? "Popup-play" : ""), nextView: RoomGameView(), width: geometry.size.width * 0.7, height: geometry.size.height * 0.25)
                            .position(x: geometry.size.width * 0.5 , y: geometry.size.height * 0.16)
                        
                    } else {
                        Image(isDark ? "Popup-play" : "")
                            .frame(width: geometry.size.width * 0.7, height: geometry.size.height * 0.25)
                            .position(x: geometry.size.width * 0.5 , y: geometry.size.height * 0.16)
                        
                    }
                    
                    
                    Image(isDark ? "interruptor off" : "interruptor")
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
                            
                        }
                    
                    
                    
                    
                    
                }
                
                Image("home botao")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: geometry.size.width * 0.10, height: geometry.size.height * 0.10)
                    .position(x: geometry.size.width * 0.08, y: geometry.size.height * 0.08)
                    .onTapGesture {
                        dismiss()
                    }
                
                
                
                
                
                
                
            }
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        
    }
}

struct RoomHomeView_Previews: PreviewProvider {
    static var previews: some View {
        RoomHomeView()
            .previewInterfaceOrientation(.landscapeLeft)
        
    }
}
