import Foundation

protocol Organ {
    func function()
}

protocol Operative {
    var organ : Organ {get set}
    func operate()
}

class Brain : Operative {
    var organ: Organ
    
    func operate() {
        self.organ.function()
    }
    
    init(organ: Organ) {
        self.organ = organ
    }
}

class Heart: Organ {
    func function() {
        print("Heart is pumping blood")
    }
}

class Stomach: Organ {
    func function() {
        print("Stomach is digesting physically")
    }
}

class Liver: Organ {
    func function() {
        print("Liver is detoxificating")
    }
}

class Thyroid: Organ {
    func function() {
        print("Thyroid is secreting hormones")
    }
}

let heartControl = Brain(organ: Heart())
heartControl.operate()
let stomachControl = Brain(organ: Stomach())
stomachControl.operate()
let liverControl = Brain(organ: Liver())
liverControl.operate()
let thyroidControl = Brain(organ: Thyroid())
thyroidControl.operate()
