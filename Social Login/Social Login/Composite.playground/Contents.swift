import Foundation

class Part {
    let name : String
    let price : Float
    
    init(name: String, price: Float) {
        self.name = name
        self.price = price
    }
}

class CompositePart {
    let name : String
    let parts:[Part]
    
    init(name:String, parts:Part...) {
        self.name = name
        self.parts = parts
    }
}

class CustomerOrder {
    let customer : String
    let parts : [Part]
    let compositeParts : [CompositePart]
    
    init(customer:String, parts:[Part], composites:[CompositePart]) {
        self.customer = customer
        self.parts = parts
        self.compositeParts = composites
    }
    
    var totalPrice:Float {
        return parts.reduce(0, combine: {subtotal, part in
            return subtotal + part.price});
    }
    
    func printDetails() {
        print("Order for \(customer): Cost: \(formatCurrencyString(totalPrice))");
    }
    
    func formatCurrencyString(number:Float) -> String {
        let formatter = NSNumberFormatter();
        formatter.numberStyle = NSNumberFormatterStyle.CurrencyStyle;
        return formatter.stringFromNumber(number) ?? "";
    }
}

let doorWindow = CompositePart(name: "DoorWindow", parts: Part(name: "Window", price: 100.50),
                                                          Part(name: "Window Stitch", price: 12.0))

let door = CompositePart(name: "Door", parts: Part(name: "Window", price: 100.50),
                                              Part(name: "Door Loom", price: 80),
                                              Part(name: "Window Switch", price: 12),
                                              Part(name: "Door Handles", price: 43.40))

let hood = Part(name: "Hood", price: 320);

let order = CustomerOrder(customer: "Bob", parts: [hood],
                          composites: [door, doorWindow]);
order.printDetails();
