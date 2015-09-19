import Foundation
import SpriteKit


class Gradient: SKScene {
    
    class func drawGradientImage(size: CGSize) -> UIImage {
        
        let bounds = CGRect(origin: CGPoint.zero, size: size)
        let opaque = false
        let scale: CGFloat = 0
        UIGraphicsBeginImageContextWithOptions(size, opaque, scale)
        let context = UIGraphicsGetCurrentContext()
        
        let topColour = UIColor(red:0.500, green:0.700, blue:1.000, alpha:1.000)
        let midColour = UIColor(red:0.710, green:0.952, blue:1.000, alpha:1.000)
        let bottomColour = UIColor(red:0.000, green:0.502, blue:1.000, alpha:1.000)
        
        let gradientColours: [CGColor] = [topColour.CGColor, midColour.CGColor, bottomColour.CGColor]
        
        let gradientLocations: [CGFloat] = [0.0, 0.5, 1.0] // top, middle and bottom of the frame
        
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        
        let gradient = CGGradientCreateWithColors(
            colorSpace,
            gradientColours,
            gradientLocations)
        
        let gradientLayer: CAGradientLayer = CAGradientLayer()
        gradientLayer.colors = gradientColours
        gradientLayer.locations = gradientLocations
        
        let topPoint = CGPointMake(bounds.width/2, bounds.height)
        let bottomPoint = CGPointMake(bounds.width/2, 0)
        
        CGContextDrawLinearGradient(context, gradient, bottomPoint, topPoint, CGGradientDrawingOptions.DrawsAfterEndLocation)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image
    }
    
    class func getBackgroundSprite(frame:CGRect) -> SKSpriteNode {
        let imageSize = CGSize(width: frame.size.width, height: frame.size.height)
        let imageView = UIImageView(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: imageSize))
        
        let imageGradient = drawGradientImage(imageSize)
        imageView.image = imageGradient
        
        let gradBack = SKTexture(image: imageGradient)
        
        let background = SKSpriteNode(texture: gradBack)
        
        background.zPosition = -10
        background.position = CGPointMake(CGRectGetMidX(frame), CGRectGetMidY(frame))
        
        return background
    }
    
    
}

    