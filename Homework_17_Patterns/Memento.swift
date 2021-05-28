import Foundation
import SpriteKit

//Предполагает создание копий объектов и функционала к востановленийю из копий

protocol Memento {
    var data: SKSpriteNode? { get }
}

class Player {
    private var sprite : SKSpriteNode? = nil
    private var node : SKNode? = nil
    let texture : SKTexture
    let position: CGPoint
    
    var memento : Memento {
        return PlayerMemento(tex: texture, pos: position)
    }
    
    init(texture: SKTexture, position: CGPoint) {
        self.texture = texture
        self.position = position
        
        sprite = SKSpriteNode(texture: texture)
        sprite!.position = position
        node = SKNode()
        node!.addChild(sprite!)
    }
    
    func restore(with memento: PlayerMemento) {
        sprite = SKSpriteNode(texture: memento.texture)
        sprite!.position = memento.position
        node = SKNode()
        node!.addChild(sprite!)
    }
}


struct PlayerMemento : Memento {
    let data: SKSpriteNode?
    
    let texture: SKTexture
    let position: CGPoint
    
    init(tex: SKTexture, pos: CGPoint) {
        self.texture = tex
        self.position = pos
        self.data = SKSpriteNode(texture: tex)
    }
}

class SaveStack {
    private lazy var mementos = [Memento]()
    private let player : Player
    
    init(player: Player) {
        self.player = player
    }
    
    func save() {
        mementos.append(player.memento)
    }
    
    func restore(with: PlayerMemento) {
        guard !mementos.isEmpty else { return }
        guard let restoreMemento = mementos.removeLast() as? PlayerMemento else { return }
        restore(with: restoreMemento)
    }
}
