//
//  RoomGameScene.swift
//  Bubba
//
//  Created by mccl on 24/03/23.
//

import SpriteKit

class GameScene: SKScene {
    
    let square = SKSpriteNode()
    
    override func didMove(to view: SKView) {
    
        square.size = CGSize(width: 50, height: 50)
        square.position = CGPoint(x: 100, y: 100)
        square.color = .green
        
        addChild(square)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            square.position = location
            square.color = .red
        }
        
    }
}
