import Foundation
import SpriteKit

class GameLevels {
    var gameObjects = GameObjects()

    let levels = [ level1, level2, level3, level4 ]
    
    var currentLevel = 1;
    
    func generateNextLevelOnNode(node:SKNode) {
        let level = levels[currentLevel-1]
        generateLevelBackgroundFromString(level, parentNode:node )
        currentLevel++;
        if (currentLevel > levels.count) {
            currentLevel = 1
        }
    }

    func generateLevelBackgroundFromString(sceneString:String,parentNode:SKNode) {
        gameObjects.blockWidth = parentNode.frame.width / CGFloat(numCols)
        gameObjects.blockHeight = parentNode.frame.height / CGFloat(numRows)
        

        var row = 1
        var col = 1
        for char in sceneString.characters {
            if let imageName = gameObjects.charToImageNameMap[String(char)] {
                parentNode.addChild(gameObjects.createSpriteAtPos(char,imageName:imageName,row:row, col:col,frame:parentNode.frame))
            }
            col++;
            if (col == 17) {
                col = 1;
                row++;
            }
        }
    }

}

