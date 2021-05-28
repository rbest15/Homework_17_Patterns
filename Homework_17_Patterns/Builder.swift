import Foundation
import UIKit

//Предполагает наличие класса для создания объектов какого то сложного объекта разных конфигураций

protocol UIAlertControllerBuilder {
    func reset()
    func setStyle(_ style: UIAlertController.Style)
    func setTitle(_ title: String)
    func setMessage(_ message: String)
}

class AlertControllerBuilder: UIAlertControllerBuilder {
    private var alert = UIAlertController(title: nil, message: nil, preferredStyle: .alert)

    func reset() {
        alert = UIAlertController()
    }
    
    internal func setStyle(_ style: UIAlertController.Style) {
        alert = UIAlertController(title: nil, message: nil, preferredStyle: style)
    }
    
    internal func setTitle(_ title: String) {
        alert.title = title
    }
    
    internal func setMessage(_ message: String) {
        alert.message = message
    }
    
    func create(title: String, message: String) -> UIAlertController {
        setTitle(title)
        setMessage(message)
        return alert
    }
}

class ActionSheetControllerBuilder: UIAlertControllerBuilder {
    private var alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
    
    func reset() {
        alert = UIAlertController()
    }
    
    internal func setStyle(_ style: UIAlertController.Style) {
        alert = UIAlertController(title: nil, message: nil, preferredStyle: style)
    }
    
    internal func setTitle(_ title: String) {
        alert.title = title
    }
    
    internal func setMessage(_ message: String) {
        alert.message = message
    }
    
    func create(title: String, message: String) -> UIAlertController {
        setTitle(title)
        setMessage(message)
        return alert
    }
}

let builder = ActionSheetControllerBuilder().create(title: "hi", message: "ok")
