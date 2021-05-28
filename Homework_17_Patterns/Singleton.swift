import Foundation


//Предполагает наличие только одного объекта класса

class NetworkHandler {
    static let shared = NetworkHandler()
    
    func alamofireRequest() {
        //
    }
}

func a() {
    NetworkHandler.shared.alamofireRequest()
}
