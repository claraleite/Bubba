//
//  RoomGameScene.swift
//  Bubba
//
//  Created by mccl on 24/03/23.
//

import SpriteKit

class GameScene: SKScene {
    
    let closetMonster = TouchSpriteNode(imageNamed: "monstro-armario-1")
    let bedMonster = TouchSpriteNode(imageNamed: "monstro-cama-1")
    let shelfMonster = TouchSpriteNode(imageNamed: "monstro-prateleira-1")
    let tableMonster = TouchSpriteNode(imageNamed: "monstro-mesa-1")
    let drawerMonster = TouchSpriteNode(imageNamed: "monstro-comoda-1")

    let background = SKSpriteNode(imageNamed: "Quarto-mini-game")
    
    override func didMove(to view: SKView) {
        
        background.position = CGPoint(x: self.size.width/2 , y: self.size.height/2)
        background.size = self.size
        background.zPosition = 0
        
        addChild(background)
        
        closetMonster.size = CGSize(width: 50, height: 50)
        closetMonster.position = CGPoint(x: 1000, y: 550)
        closetMonster.isUserInteractionEnabled = true
        
        addChild(closetMonster)
        
        bedMonster.size = CGSize(width: 50, height: 50)
        bedMonster.position = CGPoint(x: 300, y: 30)
        bedMonster.isUserInteractionEnabled = true
        
        addChild(bedMonster)
        
        shelfMonster.size = CGSize(width: 50, height: 50)
        shelfMonster.position = CGPoint(x: 400, y: 400)
        shelfMonster.isUserInteractionEnabled = true
        
        addChild(shelfMonster)
        
        tableMonster.size = CGSize(width: 50, height: 50)
        tableMonster.position = CGPoint(x: 800, y: 300)
        tableMonster.isUserInteractionEnabled = true
        
        addChild(tableMonster)
        
        drawerMonster.size = CGSize(width: 50, height: 50)
        drawerMonster.position = CGPoint(x: 550, y: 200)
        drawerMonster.isUserInteractionEnabled = true
        
        addChild(drawerMonster)
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
