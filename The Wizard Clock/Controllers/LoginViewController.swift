//
//  LoginViewController.swift
//  The Wizard Clock
//
//  Created by Joshua Dean on 4/28/20.
//  Copyright © 2020 Daniel. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    
    // set optional var for Auth listener
    var authStateDidChangeListenerHandle: AuthStateDidChangeListenerHandle?
    

    // Function called right before view/screen is shown
    // Hide Top Navigation Bar
    // Code Sourced from StackOverflow
    // https://stackoverflow.com/questions/47150880/hide-navigation-bar-for-a-view-controller
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        // Hide Navigation Bar
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        // If Auth listener detects successful auth, send self to ThemeSelection
        authStateDidChangeListenerHandle = Auth.auth().addStateDidChangeListener { (auth, user) in
            if user != nil {
                // Hide the Navigation Bar
                self.performSegue(withIdentifier: "goToThemeSelection", sender: self)
            }
        }
    }
    
    // Function called right before view/screen disappears
    // Set Auth listener off when segue to different view/screen
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        Auth.auth().removeStateDidChangeListener(authStateDidChangeListenerHandle!)
        // Show the Navigation Bar
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    
    // Function logs user anonymously. Linked to UIButton Continue as Guest
    @IBAction func continuePressed(_ sender: UIButton) {
        Auth.auth().signInAnonymously { (authResult, error) in
            if let e = error {
                print(e.localizedDescription)
            }
        }
    }
    
}
