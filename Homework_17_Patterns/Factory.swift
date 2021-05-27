import Foundation
import SpriteKit


protocol NodeFabric {
    func newOfSize(_ size: CGFloat) -> SKShapeNode
}

class CircleNodeFabric: NodeFabric {
    func newOfSize(_ size: CGFloat) -> SKShapeNode {
        return SKShapeNode(circleOfRadius: size)
    }
}

class SquareNodeFabric: NodeFabric {
    func newOfSize(_ size: CGFloat) -> SKShapeNode {
        return SKShapeNode(rect: CGRect(x: 0, y: 0, width: size, height: size))
    }
}


class ShapeNodeFabric: NodeFabric {
    let shape : ShapeNodeForm
    private let circleFab = CircleNodeFabric()
    private let squareFab = SquareNodeFabric()
    
    func newOfSize(_ size: CGFloat) -> SKShapeNode {
        switch shape {
        case .circle:
            return circleFab.newOfSize(size)
        case .square:
            return squareFab.newOfSize(size)
        }
    }
    
    init(shape: ShapeNodeForm) {
        self.shape = shape
    }
}


enum ShapeNodeForm {
    case square, circle
}


let fab = ShapeNodeFabric(shape: .circle).newOfSize(10)
