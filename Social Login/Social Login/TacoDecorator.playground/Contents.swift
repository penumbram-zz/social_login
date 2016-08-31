import Foundation

protocol Taco : CustomStringConvertible {
    func cost() -> Double
    func ingredients() -> String
}

class EmptyTaco: Taco {
    
    func cost() -> Double {
        return 1.0
    }
    
    func ingredients() -> String {
        return "Taco Shell"
    }
    
    var description: String {
        return "Cost : \(cost()); Ingredients: \(ingredients())"
    }
    
}

class TacoDecorator: Taco {
    private let decoratedTaco: Taco
    private let ingredientSeparator: String = ", "
    
    required init(decoratedTaco: Taco) {
        self.decoratedTaco = decoratedTaco
    }
    
    func cost() -> Double {
        return decoratedTaco.cost()
    }
    
    func ingredients() -> String {
        return decoratedTaco.ingredients()
    }
    
    var description: String {
        return "Cost : \(self.cost()); Ingredients: \(self.ingredients())"
    }
    
}

class BeefedTaco: TacoDecorator {
    required init(decoratedTaco: Taco) {
        super.init(decoratedTaco: decoratedTaco)
    }
    
    override func cost() -> Double {
        return super.cost() + 0.5
    }
    
    override func ingredients() -> String {
        return super.ingredients() + ingredientSeparator + "Beef"
    }
}

class SaucedTaco: TacoDecorator {
    required init(decoratedTaco: Taco) {
        super.init(decoratedTaco: decoratedTaco)
    }
    
    override func cost() -> Double {
        return super.cost() + 0.2
    }
    
    override func ingredients() -> String {
        return super.ingredients() + ingredientSeparator + "Sauce"
    }
}

var taco : Taco = EmptyTaco()
print(taco.description)
taco = BeefedTaco(decoratedTaco: taco)
print(taco.description)
taco = SaucedTaco(decoratedTaco: taco)
print(taco.description)