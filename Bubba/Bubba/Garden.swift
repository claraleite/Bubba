//
//  Garden.swift
//  Bubba
//
//  Created by Natália Pessoa de Azevedo Albuquerque on 23/03/23.
//

import SwiftUI

struct Garden: View {
    var gameManagerVM: GameManagerVM

    
    @State private var shouldAnimate = false
    @State private var playAnimation : Bool = false
    @State private var buttonOffset = CGSize(width: -340, height: -400)
    @State private var buttonOpacity = 1.0
    
    @State private var location: CGPoint = CGPoint(x: UIScreen.main.bounds.width * 0.25, y: UIScreen.main.bounds.height * 0.7)
    @State var isDragging = false
    
//    @Binding var endGame: Bool
    
    @Environment(\.dismiss) private var dismiss
    
    @State private var showingSheet = false
    
    @State var playingSound: Bool = false
    
    var body: some View {
        
        GeometryReader { geometry in
            
            let imagensDosBichos = [
                "Garden Images_01",
                "Garden Images_03",
                "Garden Images_02",
                "Garden Images_04",
            ]
            
            
            ZStack{
                Image("background garden")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                
                Image("bubba")
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
                    
                    Image("popup-garden")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: geometry.size.width * 0.7, height: geometry.size.height * 0.3)
                        .position(x: geometry.size.width * 0.5, y: geometry.size.height * 0.2)
                        .onTapGesture {
                            showingSheet.toggle()
                            gameManagerVM.restartGame()
                        }
                    
                    Button(action: {
                        showingSheet.toggle()
                        self.playAnimation = true
                        gameManagerVM.restartGame()
                        withAnimation {
                            //                    buttonOffset = CGSize(width: 100000, height: 0.0)
                            //                    buttonOpacity = 0.0
                            //                    buttonOffset = CGSize(width: UIScreen.main.bounds.width + 50, height: 0)
                        }
                        
                        
                    }) {
                        
                        Bichinho(image: imagensDosBichos[0])
                            .frame(width: 180)
                            .offset(x: 80.0, y: -80.0)
                            .scaleEffect(shouldAnimate ? 1.1 : 1.0)
                            .animation(Animation.easeInOut(duration: 0.5).repeatForever(autoreverses: true), value: shouldAnimate)
                            .onAppear() {
                                self.shouldAnimate = true
                            }
                        Bichinho(image: imagensDosBichos[1])
                            .frame(width: 180)
                            .offset(x: 10.0, y: 20.0)
                            .scaleEffect(shouldAnimate ? 1.1 : 1.0)
                            .animation(Animation.easeInOut(duration: 0.5).repeatForever(autoreverses: true), value: shouldAnimate)
                            .onAppear() {
                                self.shouldAnimate = true
                            }
                        Bichinho(image: imagensDosBichos[2])
                            .frame(width: 180)
                            .offset(x: 0.0, y: -40.0)
                            .scaleEffect(shouldAnimate ? 1.1 : 1.0)
                            .animation(Animation.easeInOut(duration: 0.5).repeatForever(autoreverses: true), value: shouldAnimate)
                            .onAppear() {
                                self.shouldAnimate = true
                            }
                        Bichinho(image: imagensDosBichos[3])
                            .frame(width: 180)
                            .offset(x: -70.0, y: 40.0)
                            .scaleEffect(shouldAnimate ? 1.1 : 1.0)
                            .animation(Animation.easeInOut(duration: 0.5).repeatForever(autoreverses: true), value: shouldAnimate)
                            .onAppear() {
                                self.shouldAnimate = true
                            }
                        
                    }.offset(buttonOffset)
                        .opacity(buttonOpacity) //acho que não é a forma mais elegante de fazer
                    //            .animation(.easeInOut(duration: 2))
                    
                }
                
                Image("btn home")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: geometry.size.width * 0.10, height: geometry.size.height * 0.10)
                    .position(x: geometry.size.width * 0.08, y: geometry.size.height * 0.08)
                    .onTapGesture {
                        dismiss()
                        playSound(sound: "vamos brincar")
                    }
                
                
                
            }
            
            .navigationBarTitle("")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            .fullScreenCover(isPresented: $showingSheet, content: {
                GardenGameView(gameManagerVM: GameManagerVM(), isPresenting: $showingSheet)
                
            })
            .onAppear() {
                if playingSound == false {
                    playSound(sound: "jogo jardim")
                }
                
            }
            
        }
        
    }
}

struct Garden_Previews: PreviewProvider {
    static var previews: some View {
        Garden(gameManagerVM: GameManagerVM())
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


