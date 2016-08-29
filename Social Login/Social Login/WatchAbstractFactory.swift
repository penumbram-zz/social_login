//
//  WatchAbstractFactory.swift
//  Social Login
//
//  Created by Tolga Caner on 29/08/16.
//
//

import UIKit

//Enums

enum BandType : String {
    case Milanese = "Milanese",
    Classic = "Classic",
    Leather = "Leather",
    Modern = "Modern",
    LinkBracelet = "LinkBracelet",
    SportBand = "SportBand"
}

enum MaterialType: String {
    case Aluminium = "Aluminium",
    StainlessSteel = "Stainless Steel",
    Gold = "Gold"
}

enum WatchSize: String {
    case _38mm = "38mm", _42mm = "42mm"
}

enum BandSize: String {
    case SM = "SM", ML = "ML"
}

//Product Interfaces

protocol IWatchBand {
    var color: UIColor{get set}
    var size: BandSize{get set}
    var type: BandType{get set}
    init(size: BandSize)
}

protocol IWatchDial {
    var material: MaterialType{get set}
    var size: WatchSize{get set}
    init(size: WatchSize)
}

// Concrete Products
// Bands

class MilaneseBand: IWatchBand {
    var color = UIColor.yellowColor() //Cause Milanese bands are always yellow? Anyone seen a Milanese band before?
    var type = BandType.Milanese
    var size: BandSize
    required init(size _size: BandSize) {
        size = _size
    }
}

class Classic: IWatchBand {
    var color = UIColor.yellowColor()
    var size: BandSize
    var type = BandType.Classic
    required init(size _size: BandSize) {
        size = _size
    }
}
class Leather:IWatchBand{
    var color = UIColor.yellowColor()
    var size:BandSize
    var type = BandType.Leather
    required init(size _size: BandSize) {
        size = _size
    }
}
class Modern: IWatchBand {
    var color = UIColor.yellowColor()
    var size: BandSize
    var type = BandType.Modern
    required init(size _size: BandSize) {
        size = _size
    }
}

class LinkBracelet: IWatchBand {
    var color = UIColor.yellowColor()
    var size: BandSize
    var type = BandType.LinkBracelet
    required init(size _size: BandSize) {
        size = _size
    }
}
class SportBand: IWatchBand {
    var color = UIColor.yellowColor()
    var size: BandSize
    var type = BandType.SportBand
    required init(size _size: BandSize) {
        size = _size
    }
}

// Dials
class AluminiumDial: IWatchDial {
    var material: MaterialType = MaterialType.Aluminium
    var size: WatchSize
    required init(size _size:WatchSize){
        size = _size
    }
}

class StainlessSteelDial: IWatchDial {
    var material: MaterialType = MaterialType.StainlessSteel
    var size: WatchSize
    required init(size _size:WatchSize){
        size = _size
    }
}

class GoldDial: IWatchDial {
    var material: MaterialType = MaterialType.Gold
    var size: WatchSize
    required init(size _size:WatchSize){
        size = _size
    }
}

//Our AbstractFactory
class WatchFactory {
    
    func createBand(bandType: BandType) -> IWatchBand {
        NotImplementedException().Throw()
        fatalError("Stopped!")
    }
    
    func createDial(materialtype: MaterialType) -> IWatchDial{
        NotImplementedException().Throw()
        fatalError("Stopped!")
    }
    
    //our static method that return the appropriated factory.
    final class func getFactory(size: WatchSize) -> WatchFactory{
        var factory: WatchFactory?
        switch(size){
        case ._38mm:
            factory = Watch38mmFactory()
        case ._42mm:
            factory = Watch42mmFactory()
        }
        return factory!
    }
}

// Concrete Factory 1 for 42 mm
class Watch42mmFactory: WatchFactory {
    override func createBand(bandType: BandType) -> IWatchBand {
        switch bandType {
        case .Milanese:
            return MilaneseBand(size: .ML)
        case .Classic:
            return Classic(size: .ML)
        case .Leather:
            return Leather(size: .ML)
        case .LinkBracelet:
            return LinkBracelet(size: .ML)
        case .Modern:
            return Modern(size: .ML)
        case .SportBand:
            return SportBand(size: .ML)
        }
    }
    
    override func createDial(materialtype: MaterialType) -> IWatchDial {
        switch materialtype{
        case MaterialType.Gold:
            return GoldDial(size: ._42mm)
        case MaterialType.StainlessSteel:
            return StainlessSteelDial(size: ._42mm)
        case MaterialType.Aluminium:
            return AluminiumDial(size: ._42mm)
        }
    }
}

//Concrete Factory 2 for 38mm
class Watch38mmFactory: WatchFactory{
    override func createBand(bandType:BandType) -> IWatchBand {
        switch bandType {
        case .Milanese:
            return MilaneseBand(size: .SM)
        case .Classic:
            return Classic(size: .SM)
        case .Leather:
            return Leather(size: .SM)
        case .LinkBracelet:
            return LinkBracelet(size: .SM)
        case .Modern:
            return Modern(size: .SM)
        case .SportBand:
            return SportBand(size: .SM)
        }
    }
    
    override func createDial(materialtype: MaterialType) -> IWatchDial {
        switch materialtype{
        case MaterialType.Gold:
            return GoldDial(size: ._38mm)
        case MaterialType.StainlessSteel:
            return StainlessSteelDial(size: ._38mm)
        case MaterialType.Aluminium:
            return AluminiumDial(size: ._38mm)
        }
    }
}

