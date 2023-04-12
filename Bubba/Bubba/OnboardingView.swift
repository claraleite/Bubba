//
//  OnboardingView.swift
//  Bubba
//
//  Created by mccl on 12/04/23.
//

import SwiftUI

struct OnboardingView: View {
    @Binding var shouldShowOnboarding: Bool
    
    @State private var location: CGPoint = CGPoint(x: UIScreen.main.bounds.width * 0.2, y: UIScreen.main.bounds.height * 0.45)
    @State var isDragging = false
    
    @State var shouldAnimate: Bool = false
    
    var body: some View {
        
        GeometryReader { geometry in
            
            ZStack {
                
                DefaultBackground(imageName: "casa onboarding")
                
                
                VStack {
                    
                    Image("popup-onboarding")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: geometry.size.width * 0.8, height: geometry.size.height * 0.3)
                    
                    Image("bubba")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: geometry.size.width * 0.2, height: geometry.size.height * 0.3)
                        .position(location)
                        .scaleEffect(shouldAnimate ? 1.07 : 1.05)
                        .animation(Animation.easeInOut(duration: 0.7).repeatForever(autoreverses: true), value: shouldAnimate)
                        .onAppear() {
                            self.shouldAnimate = true
                            
                        }
                        .gesture(
                            DragGesture().onChanged { value in
                                location = value.location
                                isDragging = true
                                
                            }
                                .onEnded { value in
                                    withAnimation(.spring()) {
                                        isDragging = false
                                        location = CGPoint(x: location.x, y: geometry.size.height * 0.45)
                                    }
                                }
                        )
                }.padding()
                
                Image("btn direita")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: geometry.size.width * 0.10, height: geometry.size.height * 0.10)
                    .position(x: geometry.size.width * 0.9, y: geometry.size.height * 0.9)
                    .onTapGesture {
                        shouldShowOnboarding.toggle()
                        playSound(sound: "vamos brincar")
                    }
                
            }.onAppear() {
                playSound(sound: "intro")
            }
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView(shouldShowOnboarding: .constant(true))
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
