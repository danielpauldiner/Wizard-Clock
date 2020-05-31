//
//  ThemeSelectionViewController.swift
//  The Wizard Clock
//
//  Created by Joshua Dean on 4/28/20.
//  Copyright © 2020 Daniel. All rights reserved.
//

import UIKit

class ThemeSelectionViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    var themeName = "Nature"
    var greyscale = "Off"
    let themes = ["Nature", "Jersey", "Binary"]
    let cellReuseIdentifier = "cell"
    
    @IBOutlet weak var ThemeSelectionTable: UITableView!
    
    @IBOutlet weak var greyscaleYesButton: UIButton!
    @IBOutlet weak var greyscaleNobutton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.ThemeSelectionTable.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        ThemeSelectionTable.delegate = self
        ThemeSelectionTable.dataSource = self
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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.themes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = (self.ThemeSelectionTable.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as UITableViewCell?)!

        cell.textLabel?.text = self.themes[indexPath.row]
        cell.textLabel?.textAlignment = .center
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        themeName = self.themes[indexPath.row]
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
