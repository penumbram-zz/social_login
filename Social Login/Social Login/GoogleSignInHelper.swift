//
//  GoogleSignInHelper.swift
//  Social Login
//
//  Created by Tolga Caner on 31/07/16.
//
//

import Foundation

protocol GoogleSignInHelperDelegate : class {
    func didSuccessfullySignIn(val : Bool)
    func didSignOut()
}

class GoogleSignInHelper: NSObject, GIDSignInDelegate {
    
    weak var delegate : GoogleSignInHelperDelegate!
    
    init(delegate: GoogleSignInHelperDelegate) {
        super.init()
        self.delegate = delegate
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance().clientID = NSMutableDictionary(contentsOfFile: NSBundle.mainBundle().pathForResource("GoogleService-Info", ofType: "plist")!)?.objectForKey("CLIENT_ID") as! String
    }
    
    //MARK: google sign in
    
    func signIn(signIn: GIDSignIn!, didSignInForUser user: GIDGoogleUser!,
                withError error: NSError!) {
        if (error == nil) {
            // Perform any operations on signed in user here.
            /*
             let userId = user.userID                  // For client-side use only!
             let idToken = user.authentication.idToken // Safe to send to the server
             let fullName = user.profile.name
             let givenName = user.profile.givenName
             let familyName = user.profile.familyName
             let email = user.profile.email
             */
        } else {
            print("\(error.localizedDescription)")
        }
        self.delegate.didSuccessfullySignIn(error == nil)
    }
    func signIn(signIn: GIDSignIn!, didDisconnectWithUser user:GIDGoogleUser!,
                withError error: NSError!) {
    }
    
    func signOutGoogle(sender:UIButton)
    {
        GIDSignIn.sharedInstance().signOut()
        self.delegate.didSignOut()
    }
}
