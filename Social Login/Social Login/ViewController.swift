//
//  ViewController.swift
//  Social Login
//
//  Created by Tolga Caner on 31/07/16.
//
//

import UIKit
import FBSDKLoginKit

class ViewController: UIViewController {
    
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
        // Do any additional setup after loading the view, typically from a nib.
    }
    
}

