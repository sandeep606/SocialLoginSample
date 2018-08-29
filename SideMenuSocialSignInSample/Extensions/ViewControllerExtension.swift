//
//  ViewControllerExtension.swift
//  SideMenuSocialSignInSample
//
//  Created by Evontech on 8/29/18.
//  Copyright © 2018 Evon. All rights reserved.
//

import Foundation
import UIKit

// UIViewController extension; one can add more methods that can be accessible by any UIViewController.
extension UIViewController {
    /// show an alert for error or give some information to the user
    ///
    /// - Parameter message: error message
    func showAlert(message: String!) {
        let alertController = UIAlertController(title: alertTitle, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: alertDismissButton, style: UIAlertActionStyle.default, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
}
