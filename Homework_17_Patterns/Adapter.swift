import Foundation

//Предполагает создания класса-адаптера для представления какого-то класса к работе с третьим (с разными интерфейсами)


class SberbankATM {
    func inkass(curr: Currency) -> Bool {
        return type(of: Currency.self) == RusRubles.self
    }
}

protocol Currency {
    var codeDescription : String { get }
    var amount : Float { get}
}

class RusRubles: Currency {
    var codeDescription: String = "RUB"
    var amount: Float
    
    init(amount: Float) {
        self.amount = amount
    }
}

class BelarusRubles {
    var localName: String = "BRUB"
    var value: Float
    
    init(value: Float) {
        self.value = value
    }
}

class BelRubAdapter: Currency {
    
    var codeDescription: String {
        get {
            return bel.localName
        }
    }
    var amount: Float {
        get {
            return bel.value
        }
    }
    
    private var bel: BelarusRubles
    
    init(bel: BelarusRubles) {
        self.bel = bel
    }

 }

func b() {
    let rubles = RusRubles(amount: 200)
    let belarRubles = BelarusRubles(value: 70)
    let atm = SberbankATM()
    print(atm.inkass(curr: rubles))
    print(atm.inkass(curr: BelRubAdapter(bel: belarRubles)))
}

