//
//  ThemeSelectionViewController.swift
//  The Wizard Clock
//
//  Created by Joshua Dean on 4/28/20.
//  Copyright © 2020 Daniel. All rights reserved.
//

import UIKit
import Firebase

class ThemeSelectionViewController: UIViewController {

    var themeName = "Nature"
    var bgName = "Default"
    var hrName = "Trees"
    var minName = "Sun"
    var userName: String?
    
    @IBOutlet weak var themeNatureButton: UIButton!
    @IBOutlet weak var themeJerseyButton: UIButton!
    @IBOutlet weak var themeBinaryButton: UIButton!
    
    @IBOutlet weak var bgDefaultButton: UIButton!
    
    @IBOutlet weak var hrTreesButton: UIButton!
    
    @IBOutlet weak var minSunButton: UIButton!
    @IBOutlet weak var minBirdButton: UIButton!
    
    // Hide/Show Top Navigation Bar
    // Code Sourced from StackOverflow
    // https://stackoverflow.com/questions/47150880/hide-navigation-bar-for-a-view-controller
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
            // Hide the Navigation Back Button
            self.navigationItem.hidesBackButton = true
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: nil)

        // Do any additional setup after loading the view.
    }
    
    @IBAction func themeChange(_ sender: UIButton) {
        themeNatureButton.isSelected = false
        themeJerseyButton.isSelected = false
        themeBinaryButton.isSelected = false
        sender.isSelected = true
        themeName = sender.currentTitle!
        print(Auth.auth().currentUser?.email ?? "guest")
    }
    
    @IBAction func bgChanged(_ sender: UIButton) {
        bgDefaultButton.isSelected = false
        sender.isSelected = true
        bgName = sender.currentTitle!
    }
    
    @IBAction func hrChanged(_ sender: UIButton) {
        hrTreesButton.isSelected = false
        sender.isSelected = true
        hrName = sender.currentTitle!
    }
    
    @IBAction func minChanged(_ sender: UIButton) {
        minSunButton.isSelected = false
        minBirdButton.isSelected = false
        sender.isSelected = true
        minName = sender.currentTitle!
    }
    
    @IBAction func displayThemePressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: "goToResults", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResults" {
            let destinationVC = segue.destination as! ThemeResultsViewController
            destinationVC.themeName = themeName
        }
    }
    
    @IBAction func logoutPressed(_ sender: UIBarButtonItem) {
        do {
            try Auth.auth().signOut()
            navigationController?.popToRootViewController(animated: true)
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
