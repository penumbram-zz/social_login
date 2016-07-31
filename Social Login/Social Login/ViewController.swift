//
//  ViewController.swift
//  Social Login
//
//  Created by Tolga Caner on 31/07/16.
//
//

import UIKit
import FBSDKLoginKit
import TwitterKit

class ViewController: UIViewController, GIDSignInUIDelegate, GoogleSignInHelperDelegate {
    var btnGoogleLogin : GIDSignInButton!
    var googleSignInHelper : GoogleSignInHelper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.lightGrayColor()
        //Facebook
        let btnFacebookLogin =  FBSDKLoginButton()
        btnFacebookLogin.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(btnFacebookLogin)
        let centerXConstraint = NSLayoutConstraint(item: btnFacebookLogin, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1.0, constant: 0.0)
        let centerYConstraint = NSLayoutConstraint(item: btnFacebookLogin, attribute: .CenterY, relatedBy: .Equal, toItem: self.view, attribute: .CenterY, multiplier: 1.0, constant: 0.0)
        self.view.addConstraints([centerXConstraint,centerYConstraint])
        
        btnFacebookLogin.readPermissions = ["public_profile","email","user_friends"]
        //Facebook
        //Twitter
        let btnTwitterLogin = TWTRLogInButton { (session, error) in
            if let unwrappedSession = session {
                let alert = UIAlertController(title: "Logged In",
                    message: "User \(unwrappedSession.userName) has logged in",
                    preferredStyle: UIAlertControllerStyle.Alert
                )
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
                self.presentViewController(alert, animated: true, completion: nil)
            } else {
                NSLog("Login error: %@", error!.localizedDescription);
                Twitter.sharedInstance().logInWithCompletion { session, error in
                    if (session != nil) {
                        print("signed in as \(session!.userName)");
                    } else if (error != nil) {
                        print("error: \(error!.localizedDescription)");
                    }
                }
            }
        }
        btnTwitterLogin.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(btnTwitterLogin)
        let twCenterXConstraint = NSLayoutConstraint(item: btnTwitterLogin, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1.0, constant: 0.0)
        let twYConstraint = NSLayoutConstraint(item: btnTwitterLogin, attribute: .Top, relatedBy: .Equal, toItem: btnFacebookLogin, attribute: .Bottom, multiplier: 1.0, constant: 20.0)
        self.view.addConstraints([twCenterXConstraint,twYConstraint])
        //Twitter
        //Google
        GIDSignIn.sharedInstance().uiDelegate = self
        self.btnGoogleLogin = GIDSignInButton(frame: CGRectMake(0,0,100,50))
        self.btnGoogleLogin.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(self.btnGoogleLogin)
        let gglCenterXConstraint = NSLayoutConstraint(item: self.btnGoogleLogin, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1.0, constant: 0.0)
        let gglYConstraint = NSLayoutConstraint(item: self.btnGoogleLogin, attribute: .Top, relatedBy: .Equal, toItem: btnTwitterLogin, attribute: .Bottom, multiplier: 1.0, constant: 20.0)
        self.view.addConstraints([gglCenterXConstraint,gglYConstraint])
        self.googleSignInHelper = GoogleSignInHelper(delegate: self)
        //Google
    }
    
    func didSuccessfullySignIn(val: Bool) {
        //self.btnGoogleLogin.hidden = val
        self.btnGoogleLogin.hidden = val
        if val {
            let googleSignOutButton = UIButton(frame: CGRectMake(0,0,100,50))
            googleSignOutButton.backgroundColor = UIColor.whiteColor()
            googleSignOutButton.setTitle("Sign Out", forState: .Normal)
            googleSignOutButton.setTitleColor(UIColor.blackColor(), forState: .Normal)
            googleSignOutButton.translatesAutoresizingMaskIntoConstraints = false
            googleSignOutButton.titleLabel?.adjustsFontSizeToFitWidth = true
            googleSignOutButton.tag = 101
            self.view.addSubview(googleSignOutButton)
            let gglCenterXConstraint = NSLayoutConstraint(item: googleSignOutButton, attribute: .CenterX, relatedBy: .Equal, toItem: self.btnGoogleLogin, attribute: .CenterX, multiplier: 1.0, constant: 0.0)
            let gglYConstraint = NSLayoutConstraint(item: googleSignOutButton, attribute: .Top, relatedBy: .Equal, toItem: self.btnGoogleLogin, attribute: .Top, multiplier: 1.0, constant: 0.0)
            self.view.addConstraints([gglCenterXConstraint,gglYConstraint])
            
            googleSignOutButton.addTarget(googleSignInHelper, action: #selector(GoogleSignInHelper.signOutGoogle), forControlEvents: .TouchUpInside)
        }
    }
    
    func didSignOut() {
        self.btnGoogleLogin.hidden = false
        self.view.viewWithTag(101)?.removeFromSuperview()
    }
}

