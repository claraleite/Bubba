//
//  RoomGameView.swift
//  Bubba
//
//  Created by mccl on 23/03/23.
//

import SwiftUI
import SpriteKit


struct RoomGameView: View {
    
    @Environment(\.dismiss) private var dismiss
    @State var isConnected: Bool = false
    
    @State var draggedObject: String
    
    @State private var borderColor: Color = .black
    @State private var borderWidth: CGFloat = 1.0
    
    let posicao1Array = ["bolsa", "sombrinha", "biombo"]
    let sombra1Array = ["sombra bolsa", "sombra sombrinha", "sombra biombo"]
    
    let posicao2Array = ["bola", "coelho", "walkie"]
    let sombra2Array = ["sombra bola", "sombra coelho", "sombra walkie"]
    
    let posicao5Array = ["patins", "telefone", "meia"]
    let sombra5Array = ["sombra patins", "sombra telefone", "sombra meia"]
    
    
    var body: some View {
        
        GeometryReader { geometry in
            
            let randomInt = Int.random(in: 0..<3)
            
            DefaultBackground(imageName: "bubba quarto escuro")
            
            Image("btn close")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: geometry.size.width * 0.10, height: geometry.size.height * 0.10)
                .position(x: geometry.size.width * 0.92, y: geometry.size.height * 0.08)
                .onTapGesture {
                    dismiss()
                }
            
            VStack {
                
                ZStack {
                    
                    Image("bg sombras")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: geometry.size.width)
                    
                    HStack {
                        DraggingObject(dragObject: posicao1Array[randomInt], width: geometry.size.width * 0.2, height: geometry.size.height * 0.2)
                        DraggingObject(dragObject: posicao2Array[randomInt], width: geometry.size.width * 0.2, height: geometry.size.height * 0.2)
                        DraggingObject(dragObject: posicao5Array[randomInt], width: geometry.size.width * 0.2, height: geometry.size.height * 0.2)
                    }
                }
                
                DroppableObject(draggedObject: draggedObject, width: geometry.size.width * 0.2, height: geometry.size.height * 0.4, nameOfShadow: posicao1Array[randomInt], shadowName: sombra1Array[randomInt])
                    .position(x: geometry.size.width * 0.65, y: geometry.size.height * 0.4)
                
                DroppableObject(draggedObject: draggedObject, width: geometry.size.width * 0.2, height: geometry.size.height * 0.2, nameOfShadow: posicao2Array[randomInt], shadowName: sombra2Array[randomInt])
                    .position(x: geometry.size.width * 0.85, y: geometry.size.height * 0.3)
                
                DroppableObject(draggedObject: draggedObject, width: geometry.size.width * 0.15, height: geometry.size.height * 0.15, nameOfShadow: posicao5Array[randomInt], shadowName: sombra5Array[randomInt])
                    .position(x: geometry.size.width * 0.35)
                
               
                
               
            }
                
            
        
            
        }
        .edgesIgnoringSafeArea(.all)
        .navigationBarTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}


struct RoomGameView_Previews: PreviewProvider {
    static var previews: some View {
        RoomGameView(draggedObject: "")
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
