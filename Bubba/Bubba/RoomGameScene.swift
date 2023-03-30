//
//  RoomGameScene.swift
//  Bubba
//
//  Created by mccl on 24/03/23.
//

import SpriteKit

class GameScene: SKScene {
    
    let sideMonster = TouchSpriteNode(imageNamed: "sombra 1")
    let closetMonster = TouchSpriteNode(imageNamed: "sombra 2")
    let shelfMonster = TouchSpriteNode(imageNamed: "sombra 3")
    let drawerMonster = TouchSpriteNode(imageNamed: "sombra 4")
    let bedMonster = TouchSpriteNode(imageNamed: "sombra 5")

    let background = SKSpriteNode(imageNamed: "bubba quarto escuro")
    
    override func didMove(to view: SKView) {
        
        background.position = CGPoint(x: self.size.width/2 , y: self.size.height/2)
        background.size = self.size
        background.zPosition = 0
        
        addChild(background)
        
        sideMonster.size = CGSize(width: 150, height: 300)
        sideMonster.position = CGPoint(x: 720, y: 300)
        sideMonster.isUserInteractionEnabled = true
        
        addChild(sideMonster)
        
        closetMonster.size = CGSize(width: 150, height: 150)
        closetMonster.position = CGPoint(x: 800, y: 650)
        closetMonster.isUserInteractionEnabled = true
        
        addChild(closetMonster)
        
        shelfMonster.size = CGSize(width: 120, height: 120)
        shelfMonster.position = CGPoint(x: 320, y: 620)
        shelfMonster.isUserInteractionEnabled = true
        
        addChild(shelfMonster)
        
        drawerMonster.size = CGSize(width: 120, height: 120)
        drawerMonster.position = CGPoint(x: 350, y: 410)
        drawerMonster.isUserInteractionEnabled = true
        
        addChild(drawerMonster)
        
        bedMonster.size = CGSize(width: 160, height: 120)
        bedMonster.position = CGPoint(x: 150, y: 30)
        bedMonster.isUserInteractionEnabled = true
        
        addChild(bedMonster)
    }
    
    //    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    //        for touch in touches {
    //            let location = touch.location(in: self)
    //            let touchedNode = atPoint(location)
    //            if touchedNode.name == "square" {
    //                square.color = .red
    //            }
    //        }
    //
    //    }
}

class TouchSpriteNode: SKSpriteNode {
    
    override var isUserInteractionEnabled: Bool {
        set {
            // ignore
        }
        get {
            return true
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touched")
    }
}
