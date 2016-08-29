//
//  Exception.swift
//  Social Login
//
//  Created by Tolga Caner on 29/08/16.
//
//

import Foundation

class Exception {
    var ReturnCode:Int32
    var Message:String
    internal var ExceptionName:String
    
    init(ReturnCode aReturnCode:Int32,Message aMessage:String) {
        ReturnCode = aReturnCode
        Message = aMessage
        ExceptionName = "Exception"
    }
    
    convenience init(aReturnCode:Int32) {
        self.init(ReturnCode: aReturnCode,Message: "UnknownException")
        ReturnCode = aReturnCode
    }
    
    convenience init(Message aMessage:String) {
        self.init(ReturnCode: -1,Message:aMessage)
    }
    
    func Throw() {
        print("Exception thrown " + self.Message)
        fatalError("\(self.ReturnCode)")
    }
    
}