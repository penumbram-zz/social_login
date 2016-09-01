import Foundation

class Footman : NSObject, NSCopying {
    var id: Int!
    var name: String!
    var birth: NSDate!
    var from: String!
    var trained = false
    
    init(id: Int, name: String, birth: NSDate, from: String) {
        self.id = id
        self.name = name
        self.birth = birth
        self.from = from
    }
    
    func train() {
        var i = 0
        while i < 5 {
            print("training")
            i += 1
        }
        self.trained = true
    }
    
    func copyWithZone(zone: NSZone) -> AnyObject {
        return Footman(id: self.id, name: self.name, birth: self.birth, from: self.from)
    }
    
    override var description: String {
        return "id: \(id) name: \(name) day: \(birth) place: \(from) trained: \(trained)"
    }
}


let footmanPrototype = Footman(id: 0, name: "aName", birth: NSDate(timeIntervalSinceReferenceDate: NSTimeIntervalSince1970), from: "here")
footmanPrototype.train()

let footmanCopy = footmanPrototype.copy() as! Footman
footmanCopy.name = "anotherName"

print(footmanPrototype.description)
print(footmanCopy.description)