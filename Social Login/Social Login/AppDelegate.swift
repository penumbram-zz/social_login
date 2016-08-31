//
//  AppDelegate.swift
//  Social Login
//
//  Created by Tolga Caner on 31/07/16.
//
//

import UIKit
import FBSDKCoreKit
import Fabric
import TwitterKit
import Firebase;

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    //MARK: url methods
    func application(app: UIApplication, openURL url: NSURL, options: [String : AnyObject]) -> Bool {
        if Twitter.sharedInstance().application(app, openURL:url, options: options) {
            return true
        } else if FBSDKApplicationDelegate.sharedInstance().application(app, openURL: url,  sourceApplication: options["UIApplicationOpenURLOptionsSourceApplicationKey"] as! String,
                                                                        annotation: nil) {
            return true
        } else if GIDSignIn.sharedInstance().handleURL(url,
                                                       sourceApplication: options[UIApplicationOpenURLOptionsSourceApplicationKey] as? String,
                                                       annotation: options[UIApplicationOpenURLOptionsAnnotationKey]) {
            return true
        }
        return false
    }
    //MARK: application methods
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        Fabric.with([Twitter.self])
        FIRApp.configure()
        // Design tests
        _ = AbstractFactoryUser()
        let watchFactory = WatchFactory.getFactory(WatchSize._38mm)
        watchFactory.createDial(MaterialType.Gold)
        let c = CardFactory.createCard(.FacelessManipulator)
        print(c?.toString())

        var taco : Taco = EmptyTaco()
        print(taco.description)
        taco = BeefedTaco(decoratedTaco: taco)
        print(taco.description)
        taco = SaucedTaco(decoratedTaco: taco)
        print(taco.description)
        return true
    }
    
    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    
    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    
    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    
}

