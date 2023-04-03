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
    
    //    let sideMonster = SKSpriteNode(imageNamed: "sombra 1")
    //    let closetMonster = SKSpriteNode(imageNamed: "sombra 2")
    //    let shelfMonster = SKSpriteNode(imageNamed: "sombra 3")
    //    let drawerMonster = SKSpriteNode(imageNamed: "sombra 4")
    //    let bedMonster = SKSpriteNode(imageNamed: "sombra 5")
    
    let testing = ObjectsSpriteNode(imageNamed: "bubba")
    let testing2 = SKSpriteNode(imageNamed: "bubba medo")

    let background = SKSpriteNode(imageNamed: "bubba quarto escuro")
    
    override func didMove(to view: SKView) {
        
        background.position = CGPoint(x: self.size.width/2 , y: self.size.height/2)
        background.size = self.size
        background.zPosition = 0
        
        addChild(background)
        
        testing.size = CGSize(width: self.size.width * 0.2, height: self.size.height * 0.3)
        testing.position = CGPoint(x: self.size.width * 0.5, y: self.size.height * 0.5)
        testing.isUserInteractionEnabled = true
        
        addChild(testing)
        
//        testing2.size = CGSize(width: self.size.width * 0.2, height: self.size.height * 0.3)
//        testing2.position = CGPoint(x: self.size.width * 0.5, y: self.size.height * 0.5)
//        testing2.isUserInteractionEnabled = true
//
//        addChild(testing2)
//
        sideMonster.size = CGSize(width: self.size.width * 0.15, height: self.size.height * 0.4)
        sideMonster.position = CGPoint(x: self.size.width * 0.66, y: self.size.height * 0.4)
        sideMonster.isUserInteractionEnabled = true
        
        addChild(sideMonster)
        
        closetMonster.size = CGSize(width: self.size.width * 0.15, height: self.size.height * 0.25)
        closetMonster.position = CGPoint(x: self.size.width * 0.75, y: self.size.height * 0.83)
        closetMonster.isUserInteractionEnabled = true
        
        addChild(closetMonster)
        
        shelfMonster.size = CGSize(width: self.size.width * 0.15, height: self.size.height * 0.15)
        shelfMonster.position = CGPoint(x: self.size.width * 0.3, y: self.size.height * 0.78)
        shelfMonster.isUserInteractionEnabled = true
        
        addChild(shelfMonster)
        
        drawerMonster.size = CGSize(width: self.size.width * 0.12, height: self.size.height * 0.12)
        drawerMonster.position = CGPoint(x: self.size.width * 0.32, y: self.size.height * 0.5)
        drawerMonster.isUserInteractionEnabled = true
        
        addChild(drawerMonster)
        
        bedMonster.size = CGSize(width: self.size.width * 0.20, height: self.size.height * 0.15)
        bedMonster.position = CGPoint(x: self.size.width * 0.12, y: self.size.height * 0.05)
        bedMonster.isUserInteractionEnabled = true
        
        addChild(bedMonster)
    }
    
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
    
    //    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    //        print("touched")
    //    }
    
//    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
//        for touch in touches {
//            let location = touch.location(in: self)
//
//            self.position = location
//
//        }
//    }
}

class ObjectsSpriteNode: SKSpriteNode {
    override var isUserInteractionEnabled: Bool {
        set {
            
        }
        get {
            return true
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            print("touched")
            let location = touch.location(in: self)
            self.position = location
        }
    }
    
//    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
//        for touch in touches {
//            let location = touch.location(in: self)
//            self.position = location
//        }
//    }
}
