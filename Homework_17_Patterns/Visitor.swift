import Foundation
import UIKit

//Предполагает "засылку" в комплексные классы визитера для выполнения вмененных им функций

protocol UIVisitor {
    func visit(element: UIButton)
    func visit(element: UILabel)
    func visit(element: UITextView)
}

protocol UIVisitable {
    func accept(visitor: UIVisitor)
}

extension UIButton : UIVisitable {
    func accept(visitor: UIVisitor) {
        visitor.visit(element: self)
    }
}

extension UILabel : UIVisitable {
    func accept(visitor: UIVisitor) {
        visitor.visit(element: self)
    }
}

extension UITextView : UIVisitable {
    func accept(visitor: UIVisitor) {
        visitor.visit(element: self)
    }
}

class TextValueVisitor : UIVisitor {
    func visit(element: UIButton) {
        print(element.currentTitle ?? "Empty")
    }
    
    func visit(element: UILabel) {
        print(element.text ?? "Empty")
    }
    
    func visit(element: UITextView) {
        print(element.text ?? "Empty")
    }
}

func visitor() {
    let label = UILabel()
    let visitor = TextValueVisitor()
    label.text = "123"
    label.accept(visitor: visitor)
}
