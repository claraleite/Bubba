//
//  QuizCompletedView.swift
//  Bubba
//
//  Created by Natália Pessoa de Azevedo Albuquerque on 05/04/23.
//

import SwiftUI

struct QuizCompletedView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @State var showingSheet: Bool = false

    var gameManagerVM: GameManagerVM
    
    var backgroundImage = ["AbelhaBackground",
                           "borboletaBackground_Prancheta 1",
                           "CaracolBackground",
                           "Joaninha Background",
                           "Minhoca Background",
                           "SapoBackground",
                           "SoldadinhoBackground",
    ]
    @State private var count = 0
    @State var currentBackgroundIndex = 0
    @State private var shouldAnimate = false

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Image(backgroundImage[currentBackgroundIndex])
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea(.all)
                
                Image("btn close")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: geometry.size.width * 0.10, height: geometry.size.height * 0.10)
                    .position(x: geometry.size.width * 0.92, y: geometry.size.height * 0.08)
                    .onTapGesture {
                        dismiss()
                    }
                
                if count == 0 {
                    Image("Abelhinhas")
                        .padding(.top, 400)
                        .padding(.trailing, 100)
                        .scaleEffect(shouldAnimate ? 1.1 : 1.0)
                        .animation(Animation.easeInOut(duration: 0.5).repeatForever(autoreverses: true), value: shouldAnimate)
                        .onAppear() {
                            self.shouldAnimate = true
                            playSound(sound: "cut abelha")
                        }
                } else if count == 1{
                    Image("Boboleta")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200)
                        .padding(.top, 50)
                        .padding(.trailing, 100)
                        .scaleEffect(shouldAnimate ? 1.1 : 1.0)
                        .animation(Animation.easeInOut(duration: 0.5).repeatForever(autoreverses: true), value: shouldAnimate)
                        .onAppear() {
                            self.shouldAnimate = true
                            playSound(sound: "cut borboleta")
                        }
                    Image("borboleta azul")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 300)
                        .padding(.top, 200)
                        .padding(.trailing, 450)
                        .scaleEffect(shouldAnimate ? 1.1 : 1.0)
                        .animation(Animation.easeInOut(duration: 0.5).repeatForever(autoreverses: true), value: shouldAnimate)
                        .onAppear() {
                            self.shouldAnimate = true
                            
                        }
                    Image("borboleta laranja")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 300)
                        .padding(.top, 200)
                        .padding(.leading, 350)
                        .scaleEffect(shouldAnimate ? 1.1 : 1.0)
                        .animation(Animation.easeInOut(duration: 0.5).repeatForever(autoreverses: true), value: shouldAnimate)
                        .onAppear() {
                            self.shouldAnimate = true
                            
                        }
                    
                } else if count == 2{
                    Image("Caracolzinho")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 300)
                        .padding(.top, 400)
                        .padding(.trailing, 1000)
                        .scaleEffect(shouldAnimate ? 1.05 : 1.0)
                        .animation(Animation.easeInOut(duration: 0.5).repeatForever(autoreverses: true), value: shouldAnimate)
                        .onAppear() {
                            self.shouldAnimate = true
                            playSound(sound: "cut caracol")
                        }
                    Image("Caracol-2")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 400)
                        .padding(.top, 600)
                        .padding(.leading, 550)
                        .scaleEffect(shouldAnimate ? 1.05 : 1.0)
                        .animation(Animation.easeInOut(duration: 0.5).repeatForever(autoreverses: true), value: shouldAnimate)
                        .onAppear() {
                            self.shouldAnimate = true
                        }
                    
                } else if count == 3{
                    Image("Joaninhas")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 800)
                        .padding(.top, 400)
                        .padding(.trailing, 50)
                        .scaleEffect(shouldAnimate ? 1.1 : 1.0)
                        .animation(Animation.easeInOut(duration: 0.5).repeatForever(autoreverses: true), value: shouldAnimate)
                        .onAppear() {
                            self.shouldAnimate = true
                            playSound(sound: "cut joaninha")
                        }
                
                } else if count == 4{
                    Image("Minhoquinhas")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 1000)
                        .padding(.top, 400)
                        .padding(.trailing, 100)
                        .scaleEffect(shouldAnimate ? 1.1 : 1.0)
                        .animation(Animation.easeInOut(duration: 0.5).repeatForever(autoreverses: true), value: shouldAnimate)
                        .onAppear() {
                            self.shouldAnimate = true
                            playSound(sound: "cut minhoca")
                        }
                    
                } else if count == 5{
                    Image("FolhaAgua1")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 250)
                        .padding(.top, 400)
                        .padding(.leading, 500)
                        .scaleEffect(shouldAnimate ? 1.05 : 1.0)
                        .animation(Animation.easeInOut(duration: 0.5).repeatForever(autoreverses: true), value: shouldAnimate)
                        .onAppear() {
                            self.shouldAnimate = true
                            playSound(sound: "cut sapo")
                        }
                    Image("SapoNaPlanta")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 250)
                        .padding(.top, 600)
                        .padding(.trailing, 100)
                        .scaleEffect(shouldAnimate ? 1.05 : 1.0)
                        .animation(Animation.easeInOut(duration: 0.5).repeatForever(autoreverses: true), value: shouldAnimate)
                        .onAppear() {
                            self.shouldAnimate = true
                        }
                    Image("FolhaAgua2")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 250)
                        .padding(.top, 500)
                        .padding(.trailing, 600)
                        .scaleEffect(shouldAnimate ? 1.05 : 1.0)
                        .animation(Animation.easeInOut(duration: 0.5).repeatForever(autoreverses: true), value: shouldAnimate)
                        .onAppear() {
                            self.shouldAnimate = true
                        }
                } else if count == 6{
                    Image("Soldadinhos")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 1000)
                        .padding(.top, 300)
                        .padding(.trailing, 10)
                        .scaleEffect(shouldAnimate ? 1.05 : 1.0)
                        .animation(Animation.easeInOut(duration: 0.5).repeatForever(autoreverses: true), value: shouldAnimate)
                        .onAppear() {
                            self.shouldAnimate = true
                            playSound(sound: "cut soldadinho")
                        }
                }
                HStack {
                    Button(action: {
                        self.currentBackgroundIndex = (self.currentBackgroundIndex + 1) % self.backgroundImage.count
                        count += 1
                        self.shouldAnimate = false
                        
                        if count > 6 {
                            dismiss()
                        }
                        
                    }) {
                        Image("btn direita")
                            
                    }
                        .offset(x: geometry.size.width*0.4, y: -geometry.size.height*0.05)
                    
                    if count > 0 {
                        Button(action: {
                            self.currentBackgroundIndex = (self.currentBackgroundIndex - 1) % self.backgroundImage.count
                            count -= 1
                            self.shouldAnimate = false
                        }) {
                            Image("btn esquerda")
                                
                        }
                            .offset(x: -geometry.size.width*0.4, y: -geometry.size.height*0.05)
                    }
                    
                    
                    
                }
                
                
                
                
                
            }
//            .fullScreenCover(isPresented: $showingSheet, content: {
//                GardenEnding(isPresenting: $showingSheet)
//                
//            })
        }
        
            
//            ReusableText(text: gameManagerVM.model.quizWinningStatus
//                         ? "Thank you for playing!!"
//                         : "Better luck next time",
//                         size: 30)
//                .padding()
            
//            Button {
//                gameManagerVM.restartGame()
//            } label: {
//                HStack {
//                    Image(systemName: "play.fill")
//                        .foregroundColor(.white)
//                        .font(.system(size: 24))
//                        .padding()
//
//                    Text("Play Again")
//                        .foregroundColor(.white)
//                        .font(.system(size: 24, weight: .bold, design: .rounded))
//                }
//            }.frame(width: 300, height: 60, alignment: .center)
//                .background(.purple.opacity(0.7))
//                .cornerRadius(30)
//                .padding()
            
        
    }
}
struct QuizCompletedView_Previews: PreviewProvider {
    static var previews: some View {
        QuizCompletedView(gameManagerVM: GameManagerVM())
            .previewInterfaceOrientation(.landscapeLeft)
    }
}

