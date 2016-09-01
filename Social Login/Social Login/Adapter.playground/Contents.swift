import Foundation

protocol RemoteControlProtocol {
    var currentChannel: Int {get set}
    init(channel:Int)
}

protocol OldRemoteControlProtocol : RemoteControlProtocol {
    //This is an old remote control's model, which has only next and previous channel controls, at the time, it wasn't supposed to change to a specific channel
    func nextChannel()
    func prevChannel()
}

protocol NewRemoteControlProtocol : RemoteControlProtocol {
    func switchChannelTo(channel: Int)
}

//This is the old remote control, which conforms to the OldRemoteControlProtocol.
class OldRemoteControl : OldRemoteControlProtocol {
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
final class RemoteControl : NewRemoteControlProtocol {
    
    var currentChannel: Int
    
    init(channel:Int) {
        self.currentChannel = channel
    }
    
    func switchChannelTo(channel: Int) {
        self.currentChannel = channel
    }
}

// Adapter
class RemoteControlAdapter: OldRemoteControl {
    private var target : RemoteControl!
    init(_ target:RemoteControl) {
        self.target = target
        super.init(channel: target.currentChannel)
    }
    
    required init(channel: Int) {
        super.init(channel: channel)
    }
    
    override func nextChannel() {
        target.switchChannelTo(target.currentChannel + 1)
    }
    
    override func prevChannel() {
        currentChannel -= 1
    }
}

var remoteControl = RemoteControl(channel: 0)
let remoteControlAdapter = RemoteControlAdapter(remoteControl)
while remoteControl.currentChannel != 5 {
    remoteControlAdapter.nextChannel()
}
print(remoteControl.currentChannel)
remoteControl.switchChannelTo(20)
print(remoteControl.currentChannel)
