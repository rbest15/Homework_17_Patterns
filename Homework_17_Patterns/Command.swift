import Foundation
import UIKit
import SpriteKit

//Предполагает наличие команд, их очередность и возможность отменя для какого то конкретного класса

protocol Command {
    func execute()
}

class Character {
    let rect : CGRect
    let name : String
    let texture : SKTexture
    var sprite : SKSpriteNode
    var node : SKNode
    
    init(rect: CGRect, name: String, texture: SKTexture) {
        self.rect = rect
        self.name = name
        self.texture = texture
        sprite = SKSpriteNode(texture: texture)
        node = SKNode()
        node.addChild(sprite)
    }
    
}

class CharacterJumpCommand : Command {
    let char : Character
    
    func execute() {
        char.sprite.physicsBody?.applyImpulse(CGVector(dx: 100, dy: 80))
    }
    
    init(char: Character) {
        self.char = char
    }
}

class VelocityChanger : Command {
    let char : Character
    let velocity : CGVector
    
    func execute() {
        char.sprite.physicsBody?.velocity = velocity
    }
    
    init(char: Character, velocity: CGVector) {
        self.char = char
        self.velocity = velocity
    }
}

final class CharacterMove {
    let jump : Command
    let velocity : Command
    
    init(char: Character) {
        self.jump = CharacterJumpCommand.init(char: char)
        self.velocity = VelocityChanger.init(char: char, velocity: CGVector(dx: 10, dy: 20))
    }
    
    func jumper() {
        jump.execute()
    }
    
    func velocityChanger() {
        velocity.execute()
    }
}
