import Foundation

protocol Appliance {
    func run()
}

protocol Switch {
    var appliance : Appliance {get set}
}

class RemoteControl : Switch {
    var appliance: Appliance
    
    func turnOn() {
        self.appliance.run()
    }
    
    init(appliance: Appliance) {
        self.appliance = appliance
    }
}

class Television: Appliance {
    func run() {
        print("tv turned on")
    }
}

class VacuumCleaner: Appliance {
    func run() {
        print("vacuum cleaner turned on")
    }
}

let tvRemoteControl = RemoteControl(appliance: Television())
tvRemoteControl.turnOn()
let vacuumCleanerRemoteControl = RemoteControl(appliance: VacuumCleaner())
vacuumCleanerRemoteControl.turnOn()
