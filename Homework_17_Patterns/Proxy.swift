import Foundation
import UIKit

class ProxyUIView : UIView {
    override func addSubview(_ view: UIView) {
        //Любое действие сработает до добавлением subView какое прописать
        print("Processing additional functions...")
        super.addSubview(view)
    }
}


func proxy() {
    let newView = UIView()
    let subView = UIView()
    newView.addSubview(subView)
    print("Successully add subView on UIView")
    print("")
    let newproxyView = ProxyUIView()
    newproxyView.addSubview(subView)
    print("Successully add subView on ProxyUIView")
}

