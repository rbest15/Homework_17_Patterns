import Foundation
import UIKit


class CustomView {
    private var childs : [CustomLabel] = []
    
    func addSubView(_ sub: CustomLabel) {
        childs.append(sub)
    }
    
    func removeLast(_ sub: CustomLabel) -> CustomLabel {
        return childs.removeLast()
    }
    
    func countChilds() -> Int {
        return childs.count
    }
    
    func getChildsTexts() -> String {
        return childs.reduce(into: "") { result, child in
            result += child.text
        }
    }
    
    func fullfill() {
        for _ in 0..<100 {
            childs.append(CustomLabel(text: randomString(length: 10)))
        }
    }
}

class CustomLabel {
    let text : String
    
    init(text: String) {
        self.text = text
    }
}

func randomString(length: Int) -> String {
  let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
  return String((0..<length).map{ _ in letters.randomElement()! })
}


func c() {
    let view = CustomView()
    view.fullfill()
    print(view.getChildsTexts())
}


