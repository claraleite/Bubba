//
//  RoomGameView.swift
//  Bubba
//
//  Created by mccl on 23/03/23.
//

import SwiftUI
import SpriteKit


struct RoomGameView: View {
    
    @Binding var isPresenting: Bool
    @Environment(\.dismiss) private var dismiss
    
    var scene: GameScene {
        let scene = GameScene()
        scene.scaleMode = .resizeFill
        return scene
    }
    
    var monstersBed: [String] = ["monstro-cama-1", "monstro-cama-2", "monstro-cama-3"]
    var monstersTable: [String] = ["monstro-mesa-1", "monstro-mesa-2", "monstro-mesa-3"]
    var monstersCloset: [String] = ["monstro-armario-1", "monstro-armario-2", "monstro-armario-3"]
    var monstersShelf: [String] = ["monstro-prateleira-1", "monstro-prateleira-2", "monstro-prateleira-3"]
    var monstersDrawer: [String] = ["monstro-comoda-1", "monstro-comoda-2", "monstro-comoda-3"]
    
    var body: some View {
        
        GeometryReader { geometry in
            
            SpriteView(scene: scene)
                .frame(width: geometry.size.width, height: geometry.size.height)
            

        }.edgesIgnoringSafeArea(.all)
    }
}

struct RoomGameView_Previews: PreviewProvider {
    static var previews: some View {
        RoomGameView(isPresenting: .constant(true))
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
