import Foundation

//For any class that supports having channels : just for convenience
protocol Channels {
    var currentChannel : Int {get set}
    init(channel: Int)
}

//Old remote controls used to support this
protocol RemoteControlProtocol {
    func nextChannel()
    func prevChannel()
}

//New remote controls are much more free in zapping
protocol NewRemoteControlProtocol {
    func switchChannelTo(channel: Int)
}


class RemoteControl : Channels, RemoteControlProtocol {
    
    var currentChannel: Int
    
    required init(channel: Int) {
        self.currentChannel = channel
    }
    
    func nextChannel() {
        self.currentChannel += 1
    }
    
    func prevChannel() {
        self.currentChannel -= 1
    }
}

class NewRemoteControl : Channels, NewRemoteControlProtocol {
    
    var currentChannel: Int
    
    required init(channel: Int) {
        self.currentChannel = channel
    }
    
    func switchChannelTo(channel: Int) {
        self.currentChannel = channel
    }
}

// Adapter
class RemoteControlAdapter: RemoteControlProtocol {
    
    private var target : NewRemoteControl!
    
    init(_ target:NewRemoteControl) {
        self.target = target
    }
    
    func nextChannel() {
        target.switchChannelTo(target.currentChannel + 1)
    }
    
    func prevChannel() {
        target.switchChannelTo(target.currentChannel - 1)
    }
}

let newRemoteControl = NewRemoteControl(channel: 0)
let remoteControlAdapter = RemoteControlAdapter(newRemoteControl)
while newRemoteControl.currentChannel < 5 {
    remoteControlAdapter.nextChannel()
}
print(newRemoteControl.currentChannel)
while newRemoteControl.currentChannel > 3 {
  remoteControlAdapter.prevChannel()
}
print(newRemoteControl.currentChannel)
newRemoteControl.switchChannelTo(20)
print(newRemoteControl.currentChannel)
