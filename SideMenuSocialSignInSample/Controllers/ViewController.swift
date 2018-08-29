//
//  ViewController.swift
//  SideMenuSocialSignInSample
//
//  Created by Evontech on 8/29/18.
//  Copyright © 2018 Evon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK:- IBAction
    // action will be called when user taps on Facebook button.
    @IBAction func buttonFacebookTapped(_ sender:UIButton){
        if FBManager.sharedFBService().isConnectedToFB() {
            fetchFbUserDetails()
        } else {
            FBManager.sharedFBService().loginTofacebook(presentOnVC: self, completion: { (loginSuccess, error) in
                guard error == nil else {
                    self.showAlert(message: error?.localizedDescription)
                    return
                }
                self.fetchFbUserDetails()
            })
        }
    }
    
    // action will be called when user taps on GooglePlus button.
    @IBAction func buttonGooglePlusTapped(_ sender:UIButton){
        GooglePlusManager.sharedGoogleClient.setupGoogleLogin(self) { (userData, error) in
            guard error == nil else {
               self.showAlert(message: error?.localizedDescription)
                return
            }
            self.performSegue(withIdentifier: kUserDetailSegue, sender: userData)
        }
    }
    
    /// action will be called to fetch facebook user information
    func fetchFbUserDetails(){
        FBManager.sharedFBService().fetchUseData(fbUserDetailCompletion: { (userData, error) in
            guard error == nil else {
               self.showAlert(message: error?.localizedDescription)
                return
            }
           self.performSegue(withIdentifier: kUserDetailSegue, sender: userData)
        })
    }
    
    // preparing seague; nagivating to new or destined controller with user info.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == kUserDetailSegue {
            let destination  = segue.destination as! UserDetailViewController
            destination.userInfo = sender as? User
        }
    }
}

