import Foundation

struct Tortilla {
    
    enum Type {
        case Wheat,
        Corn
    }
    
    var dough : Type
    
}
struct Meat {
    enum Type {
        case Beef,
        Chicken,
        Fish,
        Shrimp,
        Pork
    }
    
    var type : Type
}
struct Sauce {
    enum Type {
        case Salsa,
        Guacamole,
        Cream
    }
    
    var flavor : Type
}

class TacoBuilder {
    
    var tortilla: Tortilla?
    var meat: Meat?
    var sauce: Sauce?
    
    typealias BuilderClosure = (TacoBuilder) -> ()
    
    init(buildClosure: BuilderClosure) {
        buildClosure(self)
    }
}

struct Taco : CustomStringConvertible {
    
    let tortilla: Tortilla
    let meat: Meat
    let sauce: Sauce
    
    init?(builder: TacoBuilder) {
        
        if let tortilla = builder.tortilla, meat = builder.meat, sauce = builder.sauce {
            self.tortilla = tortilla
            self.meat = meat
            self.sauce = sauce
        } else {
            return nil
        }
    }
    
    var description:String {
        return "Taco wrapped with \(self.tortilla.dough), filled with \(self.meat.type) and flourished with \(self.sauce.flavor)"
    }
}

let tacoBuilder = TacoBuilder { builder in
    builder.tortilla = Tortilla(dough: .Wheat)
    builder.meat = Meat(type: .Beef)
    builder.sauce = Sauce(flavor: .Salsa)
}

let wheatBeefSalsaTaco = Taco(builder:tacoBuilder)
let anotherTaco = Taco(builder:tacoBuilder)




