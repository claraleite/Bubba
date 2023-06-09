//
//  HomeView.swift
//  Bubba
//
//  Created by mccl on 28/03/23.
//

import SwiftUI

struct HomeView: View {
    
    @AppStorage("_shouldShowOnboarding") var shouldShowOnboarding: Bool = true
//    @State var shouldShowOnboarding: Bool = true
    
    @State var isPresentingRoomView: Bool = false
    @State var isPresentingGardenView: Bool = false
    
    @State private var location: CGPoint = CGPoint(x: UIScreen.main.bounds.width * 0.6, y: UIScreen.main.bounds.height * 0.5)
    @State var isDragging = false
    
    @State var shouldAnimate: Bool = false
    
    @State var showPopup: Bool = false
    @State var soundPlaying: Bool = false
    
    var body: some View {
        
        GeometryReader { geometry in
        
        NavigationStack {
            
                ZStack {
                                        
                    VStack(spacing: 0) {
                        HStack(spacing: 0) {
                            DefaultBackground(imageName: "casa-02")
                            HomeButton(icon: Image("casa-03"), nextView: RoomHomeView())
                            DefaultBackground(imageName: "casa-04")
                        }
                        
                        HStack(spacing: 0) {
                            DefaultBackground(imageName: "casa-05")
                            DefaultBackground(imageName: "casa-06")
                            HomeButton(icon: Image("casa-07"), nextView: Garden(gameManagerVM: GameManagerVM()))
                        }
                    }
                    
                    VStack {
                        
                        Image(showPopup ? "popup-home-1" : "")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: geometry.size.width * 0.7, height: geometry.size.height * 0.25)
//                            .position(x: geometry.size.width * 0.5 , y: geometry.size.height * 0.16)
//
                        
                        
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
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                        showPopup = true
                                        if soundPlaying == false {
                                            playSound(sound: "home")
                                            soundPlaying = true
                                        }
                                        
                                    }
                                }
                                    .onEnded { value in
                                        withAnimation(.spring()) {
                                            isDragging = false
                                            location = CGPoint(x: location.x, y: geometry.size.height * 0.5)
                                        }
                                    }
                            )
                            .onTapGesture {
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                    showPopup = true
                                    if soundPlaying == false {
                                        playSound(sound: "home")
                                        soundPlaying = true
                                    }
                                }
                            }
                        
                    }
                    
//                    Image("borboleta rosa")
//                        .resizable()
//                        .aspectRatio(contentMode: .fit)
//                        .frame(width: geometry.size.width * 0.1)
//                        .position(x: shouldAnimate ? geometry.size.width * 0.86 : geometry.size.width * 0.84, y: shouldAnimate ? geometry.size.height * 0.53 : geometry.size.height * 0.55)
//                        .scaleEffect(shouldAnimate ? 1.07 : 1.05)
//                        .animation(Animation.easeInOut(duration: 0.7).repeatForever(autoreverses: true), value: shouldAnimate)
//                        .onAppear() {
//                            self.shouldAnimate = true
//
//                        }
                    
                    Image("abelha")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: geometry.size.width * 0.1)
                        .position(x: shouldAnimate ? geometry.size.width * 0.88 : geometry.size.width * 0.9, y: shouldAnimate ? geometry.size.height * 0.63 : geometry.size.height * 0.65)
                        .scaleEffect(shouldAnimate ? 1.07 : 1.05)
                        .animation(Animation.easeInOut(duration: 0.7).repeatForever(autoreverses: true), value: shouldAnimate)
                        .onAppear() {
                            self.shouldAnimate = true
                            
                        }
                    
                    Image("bola")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: geometry.size.width * 0.05)
                        .position(x: geometry.size.width * 0.5, y: shouldAnimate ? geometry.size.height * 0.4 : geometry.size.height * 0.45)
                        .animation(.easeInOut(duration: 0.7).repeatForever(autoreverses: true), value: shouldAnimate)
                        .onAppear() {
                            self.shouldAnimate = true
                            
                        }
//                    
//                    Image("coelho")
//                        .resizable()
//                        .aspectRatio(contentMode: .fit)
//                        .frame(width: geometry.size.width * 0.05)
//                        .position(x: geometry.size.width * 0.6, y: geometry.size.height * 0.4)
//                        .rotationEffect(.degrees(shouldAnimate ? 2.5 : 0))
//                        .rotation3DEffect(.degrees(1.0), axis: (x: 0, y: 5, z: 0))
//                        .animation(Animation.easeInOut(duration: 0.15).repeatForever(), value: shouldAnimate)
//                        .onAppear() {
//                            shouldAnimate = true
//                        }
                    
                    
                }
            
        }.fullScreenCover(isPresented: $shouldShowOnboarding, content:{ OnboardingView(shouldShowOnboarding: $shouldShowOnboarding)
            
        })
        .onAppear() {
            playSound(sound: "vamos brincar")
        }
            
            
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView().previewInterfaceOrientation(.landscapeLeft)
    }
}
