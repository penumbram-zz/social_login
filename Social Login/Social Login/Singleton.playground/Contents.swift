import Foundation

protocol SingletonDummyProtocol {
    var string : String {get set}
    var int : Int {get set}
}

class Singleton : SingletonDummyProtocol {
    static let sharedInstance = Singleton() //Official way https://developer.apple.com/library/ios/documentation/Swift/Conceptual/BuildingCocoaApps/AdoptingCocoaDesignPatterns.html#//apple_ref/doc/uid/TP40014216-CH7-ID14
    
    var string = ""
    var int = 0
}

class OldSingleton : SingletonDummyProtocol {
    class var sharedInstance: OldSingleton {
        struct Static {
            static var onceToken: dispatch_once_t = 0
            static var instance: OldSingleton? = nil
        }
        dispatch_once(&Static.onceToken) {
            Static.instance = OldSingleton()
        }
        return Static.instance!
    }
    
    var string = ""
    var int = 0
}

Singleton.sharedInstance.string = "aString"
Singleton.sharedInstance.int = 111

OldSingleton.sharedInstance.string = "aString"
OldSingleton.sharedInstance.int = 222
