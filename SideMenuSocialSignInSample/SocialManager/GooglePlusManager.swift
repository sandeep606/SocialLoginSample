//
//  GoogleManager.swift
//  SideMenuSocialSignInSample
//
//  Created by Evontech on 8/29/18.
//  Copyright © 2018 Evon. All rights reserved.
//


import Foundation
import UIKit
import UIKit
import  GoogleSignIn
import ObjectMapper


class GooglePlusManager: NSObject,GIDSignInDelegate,GIDSignInUIDelegate {
    //MARK:- varible Declaration
    var googleUserCompletionhandler:userDetailComletion? = nil
    //    var googleLoggedUserObserver  = Observable.create(λ)
    private var onViewController:UIViewController?
    
    //MARK:- Shared instance created
    static var sharedGoogleClient: GooglePlusManager = {
        let sharedGoogleObject = GooglePlusManager()
        GIDSignIn.sharedInstance().delegate = sharedGoogleObject
        GIDSignIn.sharedInstance().uiDelegate = sharedGoogleObject
        return sharedGoogleObject
    }()
    
    //MARK:- Googlemanager startup method
    func setupGoogleLogin(_ viewController:UIViewController,completion:@escaping userDetailComletion) {
        onViewController = viewController
        GIDSignIn.sharedInstance().shouldFetchBasicProfile = true
        GIDSignIn.sharedInstance().signIn()
        googleUserCompletionhandler  = completion
    }
    
    //MARK:Google signIn delegate
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        createGoogleUserDict(user:  user,error: error)
    }
    
    // Present a view that prompts the user to sign in with Google
    func sign(_ signIn: GIDSignIn!,
              present viewController: UIViewController!) {
        onViewController?.present(viewController, animated: true,completion: nil)
    }
    // Dismiss the "Sign in with Google"
    func sign(_ signIn: GIDSignIn!,
              dismiss viewController: UIViewController!) {
        onViewController?.dismiss(animated: true, completion: nil)
    }
    
    //MARK:- Other methods
    
    ///Create user dicationary to post on server
    ///
    /// - Parameters:
    ///   - user: user Object i.e GIDGoogleUser
    ///   - error: Error
    func createGoogleUserDict(user:GIDGoogleUser?,error:Error?) {
        if error == nil {
            let googleLoginParam = ["email":(user?.profile.email)!,"first_name":(user?.profile.givenName)!,"last_name":(user?.profile.familyName)!,"social_id":user?.userID!] as [String:Any]
             let user : User? = Mapper<User>().map(JSON: googleLoginParam)
            googleUserCompletionhandler!(user,nil)
        } else {
            googleUserCompletionhandler!(nil,error)
        }
    }
    /// Logout user from google plus
    func logoutFromGoogle(){
        GIDSignIn.sharedInstance().signOut()
    }
    
}
