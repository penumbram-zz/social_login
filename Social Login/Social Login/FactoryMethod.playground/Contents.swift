import Foundation

protocol Card {
    var name: String? {get set}
    var attack: Int? {get set}
    var defense : Int? {get set}
    var mana: Int? {get set}
    func clone() -> Card
    func toString() -> String
}

class AbstractCard: NSObject, Card {
    private var _name: String?
    private var _mana: Int?
    private var _attack: Int?
    private var _defense: Int?
    
    init(name: String?, mana: Int?, attack: Int?, defense: Int?) {
        self._name = name
        self._attack = attack
        self._defense = defense
        self._mana = mana
    }
    
    override init() {
        super.init()
    }
    
    var name: String? {
        get {return _name}
        set {_name = newValue}
    }
    
    var mana: Int? {
        get {return _mana}
        set {_mana = newValue}
    }
    
    var attack: Int? {
        get {return _attack}
        set {_attack = newValue}
    }
    
    var defense: Int? {
        get {return _defense}
        set {_defense = newValue}
    }
    
    func clone() -> Card {
        return AbstractCard(name: self.name, mana: self.mana, attack: self.attack, defense: self.defense)
    }
    
    func toString() -> String {
        return ("\(self.name, self.mana, self.attack,self.defense)")
    }
}

enum CardType {
    case FacelessManipulator, RaidLeader
}

class RaidLeaderCard: AbstractCard {
    override init()
    {
        super.init()
        self._mana = 3
        self._attack = 2
        self._defense = 2
        self._name = "Raid Leader"
    }
}

class FacelessManipulatorCard: AbstractCard {
    override init()
    {
        super.init()
        self._mana = 5
        self._attack = 3
        self._defense = 3
        self._name = "Faceless Manipulator"
        
    }
}

class CardFactory {
    class func createCard(cardtype: CardType) -> Card? {
        
        switch cardtype {
        case .FacelessManipulator:
            return FacelessManipulatorCard()
        case .RaidLeader:
            return RaidLeaderCard()
        }
    }
}

let c = CardFactory.createCard(.FacelessManipulator)
print(c?.toString())
