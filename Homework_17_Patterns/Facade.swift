import Foundation

class NetworkLoader {
    static let shared = NetworkLoader()
    var lastDownload : Codable? = nil
    func loadJSONFrom<T: Codable>(string: String, type: T) {
        guard let url = URL(string: string) else {
            fatalError("Invalid adress")
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                fatalError("Data error")
            }
            guard error == nil else {
                fatalError("Error: \(String(describing: error))")
            }
            do {
                let info = try JSONDecoder().decode(T.self, from: data)
                DispatchQueue.main.async {
                    self.lastDownload = info
                }
            } catch let error { print("Error: \(error)")}
        }.resume()
    }
    
    func getData() -> Codable? {
        return lastDownload
    }
}

class CharacterRAMFacade {
    func getDataFrom(web: String) -> CharactersArray? {
        let data : CharactersArray? = nil
        NetworkLoader.shared.loadJSONFrom(string: web, type: data)
        guard let array = NetworkLoader.shared.getData() as? CharactersArray else {
            fatalError("Last download is empty")
        }
        return array
    }
}

func d() -> CharactersArray {
    let facade = CharacterRAMFacade()
    guard let array = facade.getDataFrom(web: "https://rickandmortyapi.com/api/character") else {
        fatalError()
    }
    
    return array
}




