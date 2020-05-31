//
//  ThemeSelectionViewController.swift
//  The Wizard Clock
//
//  Created by Joshua Dean on 4/28/20.
//  Copyright © 2020 Daniel. All rights reserved.
//

import UIKit

class ThemeSelectionViewController: UIViewController {

    var themeName = "Nature"
    var greyscale = "Off"
    
    @IBOutlet weak var themeNatureButton: UIButton!
    @IBOutlet weak var themeJerseyButton: UIButton!
    @IBOutlet weak var themeBinaryButton: UIButton!
    
    @IBOutlet weak var bgDefaultButton: UIButton!
    

    @IBOutlet weak var greyscaleYesButton: UIButton!
    @IBOutlet weak var greyscaleNobutton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func themeChange(_ sender: UIButton) {
        themeNatureButton.isSelected = false
        themeJerseyButton.isSelected = false
        themeBinaryButton.isSelected = false
        sender.isSelected = true
        themeName = sender.currentTitle!
    }

    
    @IBAction func greyscaleChanged(_ sender: UIButton) {
        greyscaleYesButton.isSelected = false
        greyscaleNobutton.isSelected = false
        sender.isSelected = true
        greyscale = sender.currentTitle!
        print(greyscale)
    }
    
    @IBAction func displayThemePressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: "goToResults", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResults" {
            let destinationVC = segue.destination as! ThemeResultsViewController
            destinationVC.themeName = themeName
            destinationVC.greyscale = greyscale
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
