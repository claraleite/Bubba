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
    
    var monstersBed: [String] = ["monstro-cama-1", "monstro-cama-2", "monstro-cama-3"]
    var monstersTable: [String] = ["monstro-mesa-1", "monstro-mesa-2", "monstro-mesa-3"]
    var monstersCloset: [String] = ["monstro-armario-1", "monstro-armario-2", "monstro-armario-3"]
    var monstersShelf: [String] = ["monstro-prateleira-1", "monstro-prateleira-2", "monstro-prateleira-3"]
    var monstersDrawer: [String] = ["monstro-comoda-1", "monstro-comoda-2", "monstro-comoda-3"]
    
    var body: some View {
        
        GeometryReader { geometry in
            
            DefaultBackground(imageName: "bubba quarto escuro")
                .frame(width: geometry.size.width, height: geometry.size.height)
            
            Image("home botao")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: geometry.size.width * 0.10, height: geometry.size.height * 0.10)
                .position(x: geometry.size.width * 0.92, y: geometry.size.height * 0.08)
                .onTapGesture {
                    dismiss()
                }
            
            VStack {
                
                DraggingObject(dragObject: "bubba medo", width: geometry.size.width * 0.3, height: geometry.size.height * 0.3)
                
                VStack {
                    if draggedObject != "" {
                        DraggingObject(dragObject: draggedObject, width: geometry.size.width * 0.2, height: geometry.size.height * 0.2)
                    } else {
                        Text("Drag and Drop a color here!")
                            .foregroundColor(.white)
                    }
                }
                .frame(width: 280, height: 220)
                .background(Color.gray.opacity(0.25))
                .border(borderColor, width: borderWidth)
                .padding()
                .dropDestination(for: String.self) { items, location in
                    draggedObject = items.first ?? "bubba medo"
                    print(location)
                    print(draggedObject)
                    return true
                } isTargeted: { inDropArea in
                    print("In drop area", inDropArea)
                    borderColor = inDropArea ? .accentColor : .black
                    borderWidth = inDropArea ? 10.0 : 1.0
                    
                }
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
