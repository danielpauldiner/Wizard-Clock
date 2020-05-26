//
//  LoginViewController.swift
//  The Wizard Clock
//
//  Created by Joshua Dean on 4/28/20.
//  Copyright © 2020 Daniel. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    // Hide/Show Top Navigation Bar
    // Code Sourced from StackOverflow
    // https://stackoverflow.com/questions/47150880/hide-navigation-bar-for-a-view-controller
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
            // Hide the Navigation Bar
            self.navigationController?.setNavigationBarHidden(true, animated: true)
        }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
            // Show the Navigation Bar
            self.navigationController?.setNavigationBarHidden(false, animated: false)
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func continuePressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: "goToThemeSelection", sender: self)
    }
    
}
