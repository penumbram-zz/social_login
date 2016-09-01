import Foundation

protocol RemoteControlProtocol {
    var currentChannel: Int {get set}
    init(channel:Int)
}

protocol OldRemoteControlProtocol {
    //This is an old remote control's model, which has only next and previous channel controls, at the time, it wasn't supposed to change to a specific channel
    func nextChannel()
    func prevChannel()
}

protocol NewRemoteControlProtocol {
    func switchChannelTo(channel: Int)
}

//This is the old remote control, which conforms to the OldRemoteControlProtocol.
class OldRemoteControl : RemoteControlProtocol, OldRemoteControlProtocol {
    var currentChannel: Int = 0
    
    required init(channel:Int) {
        self.currentChannel = channel
    }
    
    func nextChannel() {
        //target.switchChannelTo(target.currentChannel + 1)
        currentChannel += 1
    }
    
    func prevChannel() {
      //  target.switchChannelTo(target.currentChannel - 1)
        currentChannel -= 1
    }
}

//Adaptee - The new remote control is so good, it can switch the channel to the number the user wants, there's no need for next and previous. It's suberb! Though it still needs to be compatible with the old remote control's "interface"
final class RemoteControl : RemoteControlProtocol, NewRemoteControlProtocol {
    
    var currentChannel: Int
    
    init(channel:Int) {
        self.currentChannel = channel
    }
    
    func switchChannelTo(channel: Int) {
        self.currentChannel = channel
    }
}

// Adapter
class RemoteControlAdapter: OldRemoteControlProtocol {
    private var target : RemoteControl!
    init(_ target:RemoteControl) {
        self.target = target
    }
    
    func nextChannel() {
        target.switchChannelTo(target.currentChannel + 1)
    }
    
    func prevChannel() {
        target.switchChannelTo(target.currentChannel - 1)
    }
}

var remoteControl = RemoteControl(channel: 0)
let remoteControlAdapter = RemoteControlAdapter(remoteControl)
while remoteControl.currentChannel < 5 {
    remoteControlAdapter.nextChannel()
}
print(remoteControl.currentChannel)
while remoteControl.currentChannel > 3 {
    remoteControlAdapter.prevChannel()
}
print(remoteControl.currentChannel)
remoteControl.switchChannelTo(20)
print(remoteControl.currentChannel)
