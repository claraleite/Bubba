//
//  RoomGameView.swift
//  Bubba
//
//  Created by mccl on 23/03/23.
//

import SwiftUI
import SpriteKit


struct RoomGameView: View {
    
    var scene: SKScene {
        let scene = GameScene()
        scene.size = CGSize(width: 300, height: 300)
        scene.scaleMode = .fill
        
        return scene
    }
    
    
    @State var isMonsterBedTapped: Bool = false
    @State var isMonsterShelfTapped: Bool = false
    @State var isMonsterTableTapped: Bool = false
    @State var isMonsterClosetTapped: Bool = false
    @State var isMonsterDrawerTapped: Bool = false
    
    
    var monstersBed: [String] = ["monstro-cama-1", "monstro-cama-2", "monstro-cama-3"]
    var monstersTable: [String] = ["monstro-mesa-1", "monstro-mesa-2", "monstro-mesa-3"]
    var monstersCloset: [String] = ["monstro-armario-1", "monstro-armario-2", "monstro-armario-3"]
    var monstersShelf: [String] = ["monstro-prateleira-1", "monstro-prateleira-2", "monstro-prateleira-3"]
    var monstersDrawer: [String] = ["monstro-comoda-1", "monstro-comoda-2", "monstro-comoda-3"]
    
    var body: some View {
        
        GeometryReader { geometry in
            
            ZStack {
                
                DefaultBackground(imageName: "Quarto-mini-game")
                
                SpriteView(scene: scene)
                    .frame(width: 300, height: 300)
                
//
//                // bed monster
//
//                Image(isMonsterBedTapped ? monstersBed[Int.random(in: 0..<3)] : "Sombra")
//                    .position(x: geometry.size.width * 0.3, y: geometry.size.height * 0.95)
//                    .onTapGesture(perform: {
//                        isMonsterBedTapped.toggle()
//                    })
//
//
//                // shelf monster
//                Button(action: {
//                    isMonsterShelfTapped.toggle()
//
//                }) {
//                    Image(isMonsterShelfTapped ? monstersShelf[Int.random(in: 0..<3)] : "Sombra")
//                        .position(x: geometry.size.width * 0.3, y: geometry.size.height * 0.42)
//
//                }
//
//                // table monster
//                Button(action: {
//                    isMonsterTableTapped.toggle()
//
//                }) {
//                    Image(isMonsterTableTapped ? monstersTable[Int.random(in: 0..<3)] : "Sombra")
//                        .position(x: geometry.size.width * 0.7, y: geometry.size.height * 0.98)
//
//                }
//
//                // closet monster
//                Button(action: {
//                    isMonsterClosetTapped.toggle()
//
//                }) {
//                    Image(isMonsterClosetTapped ? monstersCloset[Int.random(in: 0..<3)] : "Sombra")
//                        .position(x: geometry.size.width * 0.9, y: geometry.size.height * 0.3)
//
//                }
//
//                // drawer monster
//                Button(action: {
//                    isMonsterDrawerTapped.toggle()
//
//                }) {
//                    Image(isMonsterDrawerTapped ? monstersDrawer[Int.random(in: 0..<3)] : "Sombra")
//                        .position(x: geometry.size.width * 0.5, y: geometry.size.height * 0.75)
//
//                }
                
                
                
                
                
            }
        }
    }
}

struct RoomGameView_Previews: PreviewProvider {
    static var previews: some View {
        RoomGameView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
