//
//  AbstractFactory-SwiftInt-NSNumber.swift
//  Social Login
//
//  Created by Tolga Caner on 29/08/16.
//
//

import Foundation
import UIKit

//Abstract Product
protocol Number {
    func captureValue(string: String)
}

//Abstract Factory
protocol NumberAbstractFactory {
    func createNumber() -> Number
}

// Concrete Product
class SwiftNumber : Number {
    
    private var swiftNumber : Int = 0
    func captureValue(string: String) {
        
        swiftNumber = Int((string as NSString).integerValue)
        
        print("Capture String \(string) into number(Swift Int): \(swiftNumber)")
    }
}

class NextStepNumber : Number {
    
    private var nextStepNumber : NSNumber?
    func captureValue(string: String) {
        
        nextStepNumber = NSNumber(longLong: Int64(string)!)
        
        print("Capture String \(string) into number(NSNumber): \(nextStepNumber)")
    }
}

//Concrete factories
class SwiftNumberFactory : NumberAbstractFactory {
    // singleton instance
    static let sharedInstance : SwiftNumberFactory = SwiftNumberFactory()
    
    func createNumber() -> Number {
        return SwiftNumber()
    }
}

class NextStepNumberFactory: NumberAbstractFactory {
    
    static let sharedInstance : NextStepNumberFactory = NextStepNumberFactory()
    
    func createNumber() -> Number {
        return NextStepNumber()
    }
    
}

//Client
class Client {
    static func convertStringToNumber(string: String, withNumberFactory numberFactory: NumberAbstractFactory) {
        let number: Number = numberFactory.createNumber()
        number.captureValue(string)
    }
}

// Usage
enum ENV {
    case Swift
    case NextStep
}

class AbstractFactoryUser {
    init() {
        let env: ENV = .Swift
        var numberFactory: NumberAbstractFactory = SwiftNumberFactory()
        if env == ENV.NextStep {
            numberFactory = NextStepNumberFactory()
        }
        
        Client.convertStringToNumber("67.8", withNumberFactory: numberFactory)
    }
}


