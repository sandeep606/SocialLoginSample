//
//  UserDetailViewController.swift
//  SideMenuSocialSignInSample
//
//  Created by Evontech on 8/29/18.
//  Copyright © 2018 Evon. All rights reserved.
//

import UIKit

class UserDetailViewController: UIViewController {
    //MARK:- IBOutlet
    @IBOutlet weak var labelUserName:UILabel!
    //MARK:- Variable Declartion
    var userInfo:User? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUserInfo()
        self.title = welcomeTitle
        self.navigationItem.setHidesBackButton(true, animated: false)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //MARK:- IBAction
    
    // action will be called when user taps on logout button.
    // User will revert to previous/home screen.
    @IBAction func buttonLogoutTapped(_ sender: UIButton) {
        FBManager.sharedFBService().facebookLogOut()
        GooglePlusManager.sharedGoogleClient.logoutFromGoogle()
        self.navigationController?.popViewController(animated: false)
    }
    
    /// set user information in label
    func setupUserInfo(){
        labelUserName.text = detailMessage + (userInfo?.firstName)!
    }
}
