//
//  NotImplementedException.swift
//  Social Login
//
//  Created by Tolga Caner on 29/08/16.
//
//

import Foundation

class NotImplementedException: Exception {
    
    init() {
        super.init(ReturnCode: 404, Message: " Method Not Implemented Exception")
    }
    
    override init(ReturnCode aReturnCode: Int32, Message aMessage: String) {
        super.init(ReturnCode: aReturnCode, Message: aMessage)
        ExceptionName = "NotImplementedException"
    }
    
    convenience init(ReturnCode aReturnCode: Int32) {
        self.init(ReturnCode: aReturnCode,Message: "Unknown exception")
    }
    
    convenience init(Message aMessage:String) {
        self.init(ReturnCode:-1,Message:aMessage)
    }
}