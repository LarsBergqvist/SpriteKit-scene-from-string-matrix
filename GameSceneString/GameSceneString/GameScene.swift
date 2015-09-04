//
//  GameScene.swift
//  GameSceneString
//
//  Created by Lars Bergqvist on 2015-09-02.
//  Copyright (c) 2015 Lars Bergqvist. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    var gameLevels = GameLevels()

    override func didMoveToView(view: SKView) {
        
        self.physicsWorld.gravity = CGVectorMake(0, -9.8)
        let physicsBody = SKPhysicsBody (edgeLoopFromRect: self.frame)
        self.physicsBody = physicsBody
        self.name = "edge"

        self.addChild(Gradient.getBackgroundSprite(self.frame))

        gameLevels.generateNextLevelOnNode(self)
    }
    
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        /* Called when a touch begins */
        
        for touch in (touches as! Set<UITouch>) {
            self.removeAllChildren()
            self.addChild(Gradient.getBackgroundSprite(self.frame))
            gameLevels.generateNextLevelOnNode(self)
        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
