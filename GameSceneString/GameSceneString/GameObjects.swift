import Foundation
import SpriteKit

class GameObjects {
    var blockWidth:CGFloat = 64
    var blockHeight:CGFloat = 64

    let charToImageNameMap = [
        "T": "pipe-top",
        "I": "pipe",
        "*": "brick",
        "R": "rock",
        "P": "pumpkin",
        "E": "energyball",
        "X": "ninjastar"
    ]
    
    let charToPhysicsMap = [
        "T": ObjectPhysics(mass: 10, restitution: 0.0, friction:0.8, isDynamic: false, allowsRotation: false,autoRotate:false),
        "I": ObjectPhysics(mass: 10, restitution: 0.0, friction:0.8, isDynamic: false, allowsRotation: true,autoRotate:false),
        "*": ObjectPhysics(mass: 10, restitution: 0.0, friction:0.3, isDynamic: false, allowsRotation: false,autoRotate:false),
        "R": ObjectPhysics(mass: 6, restitution: 0.2, friction:0.5, isDynamic: true, allowsRotation: true,autoRotate:false),
        "P": ObjectPhysics(mass: 3, restitution: 0.4, friction:0.5, isDynamic: true, allowsRotation: true,autoRotate:false),
        "E": ObjectPhysics(mass: 0.5, restitution: 0.9, friction:0.7, isDynamic: true, allowsRotation: true,autoRotate:false),
        "X": ObjectPhysics(mass: 25, restitution: 0.5, friction:0.3, isDynamic: true, allowsRotation: true,autoRotate:true)
    ]

    func createSpriteAtPos(objectChar:Character,imageName:String,row:Int,col:Int,frame:CGRect) -> SKSpriteNode {
        let texture = SKTexture(imageNamed: imageName)
        let sprite = SKSpriteNode(texture: texture)
        
        sprite.size = CGSize(width:blockWidth,height:blockHeight)
        
        let xPos = CGFloat(col-1) * blockWidth + (sprite.size.width / 2)
        let yPos = frame.height - CGFloat(row-1) * blockHeight - (sprite.size.height / 2)
        sprite.position = CGPoint(x: xPos, y: yPos)
        
        let objectPhysics = charToPhysicsMap[String(objectChar)] ?? ObjectPhysics()

        sprite.physicsBody = SKPhysicsBody( texture: texture, size: sprite.size)
        sprite.physicsBody!.friction = 0.3//objectPhysics!.friction
        sprite.physicsBody!.restitution = objectPhysics.restitution
        sprite.physicsBody!.mass = objectPhysics.mass
        sprite.physicsBody!.allowsRotation = objectPhysics.allowsRotation
        sprite.physicsBody!.dynamic = objectPhysics.isDynamic
            
        if (objectPhysics.autoRotate) {
            let action = SKAction.rotateByAngle(CGFloat(M_PI), duration:0.5)
            sprite.runAction(SKAction.repeatActionForever(action))
        }
            
        
        return sprite
    }

}
