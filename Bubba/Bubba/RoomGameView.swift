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
    
    
    var body: some View {
        
        GeometryReader { geometry in
            
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
                        DraggingObject(dragObject: "bola", width: geometry.size.width * 0.1, height: geometry.size.height * 0.1)
                        DraggingObject(dragObject: "coelho", width: geometry.size.width * 0.2, height: geometry.size.height * 0.2)
                        DraggingObject(dragObject: "walkie", width: geometry.size.width * 0.2, height: geometry.size.height * 0.2)
                    }
                }
                
                DroppableObject(draggedObject: draggedObject, width: geometry.size.width * 0.1, height: geometry.size.height * 0.1, nameOfShadow: "bola", shadowName: "sombra bola")
                    .position(x: geometry.size.width * 0.5, y: geometry.size.height * 0.5)
                
                DroppableObject(draggedObject: draggedObject, width: geometry.size.width * 0.2, height: geometry.size.height * 0.2, nameOfShadow: "walkie", shadowName: "sombra walkie")
                    .position(x: geometry.size.width * 0.25, y: -(geometry.size.height * 0.05))
                
                DroppableObject(draggedObject: draggedObject, width: geometry.size.width * 0.2, height: geometry.size.height * 0.2, nameOfShadow: "coelho", shadowName: "sombra coelho")
                    .position(x: geometry.size.width * 0.3)
                
               
                
               
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
