import Foundation
import SpriteKit

class ObjectPhysics {
    
    init() {
        
    }
    
    init(mass:CGFloat,restitution:CGFloat,friction:CGFloat,isDynamic:Bool,allowsRotation:Bool,autoRotate:Bool) {
        self.mass = mass
        self.isDynamic = isDynamic
        self.restitution = restitution
        self.allowsRotation = allowsRotation
        self.autoRotate = autoRotate
        self.friction = friction
    }
    
    var friction:CGFloat = 0.0
    var restitution:CGFloat = 0.0
    var mass:CGFloat = 10.0
    var allowsRotation = false
    var isDynamic = false
    var autoRotate = false
}
