//
//  GameScene.swift
//  PrimeirosPassosSK
//
//  Created by Ana Raiany Guimarães Gomes on 2023-03-30.
//

import SpriteKit
import GameplayKit

struct MascaraBit {
    static let Laser: UInt32 = 2
    
}

class GameScene: SKScene {
    
    private var label : SKLabelNode?
    private var spinnyNode : SKShapeNode?
    
    override func didMove(to view: SKView) {
        addCircle()
        self.physicsWorld.contactDelegate = self
        addLaser()
    }
     override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
         addCircle()
         circle?.physicsBody?.isDynamic = true
         circle?.physicsBody = SKPhysicsBody(circleOfRadius: 70)
     }

     
     var laser: SKNode!
     
     func addLaser(){
         laser = SKNode()
         laser.position = CGPoint(x: self.size.width , y: 0)
         laser.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: self.size.width, height: 1))
         laser.physicsBody?.isDynamic = false
         laser.physicsBody?.categoryBitMask = MascaraBit.Laser
         laser.physicsBody?.collisionBitMask = 0
         laser.name = "Laser"
         addChild(laser)
         }
    
    var circle: SKShapeNode?
    
    func addCircle(){
        circle = SKShapeNode(circleOfRadius: 70)
        circle!.fillColor = .yellow
        circle!.position = CGPoint(x: size.width/2, y: size.height + 70)
        circle?.name = "Circle"
        circle?.physicsBody?.isDynamic = true
        circle?.physicsBody = SKPhysicsBody(circleOfRadius: 70)
        circle?.physicsBody?.contactTestBitMask = MascaraBit.Laser
        circle?.physicsBody?.collisionBitMask = 0
        addChild(circle!)
    }
    
}

extension GameScene: SKPhysicsContactDelegate {
    
    func didBegin(_ contact: SKPhysicsContact) {
        if contact.bodyA.node?.name == "Laser" || contact.bodyB.node?.name == "Laser"{
            print("""
                  Teve contato aqui!
                  """)
        }
    }
}

