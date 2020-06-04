//
//  ThemeSelectionViewController.swift
//  The Wizard Clock
//
//  Created by Joshua Dean on 4/28/20.
//  Copyright © 2020 Daniel. All rights reserved.
//

import UIKit
import Firebase

class ThemeSelectionViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    var displayName: String = ""
    // Name of the theme to be displayed. Sent to the theme results view
    var themeName = "Nature"
    // Boolean which determines if the theme should be drawn in greyscale. Sent to the theme results view
    var greyscale = "Off"
    let currentUser = Auth.auth().currentUser!
    let db = Firestore.firestore()
    // List of all possible themes which populate the theme table
    let themes = ["Nature", "Jersey", "Binary"]
    // Name of identifier for cells which is used in making the theme table
    let cellReuseIdentifier = "cell"
    
    @IBOutlet weak var headerLabel: UILabel!
    // Connects to the table for selecting themes in the storyboard
    @IBOutlet weak var ThemeSelectionTable: UITableView!
    
    // Connects to the buttons for selecting the greyscale option in the storyboard
    @IBOutlet weak var greyscaleYesButton: UIButton!
    @IBOutlet weak var greyscaleNobutton: UIButton!
    
    override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(true)
        // Hide the Navigation Back Button
        setDisplayName()
        self.navigationItem.hidesBackButton = true
        self.navigationItem.title = "Wizard Clock"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Set up a table for selecting the theme desired
        self.ThemeSelectionTable.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        ThemeSelectionTable.delegate = self
        ThemeSelectionTable.dataSource = self
        
        // Display a header at the top of the table
        let tableHeader = UILabel(frame: CGRect(x: 0, y: 0, width: ThemeSelectionTable.frame.width, height: 35))
        tableHeader.font = UIFont.systemFont(ofSize: 25.0)
        tableHeader.textAlignment = NSTextAlignment.center
        tableHeader.text = "Theme Options"
        ThemeSelectionTable.tableHeaderView = tableHeader
        
        // Highlights the first row of the table so that the user knows it is the default
        let indexPath = IndexPath(row: 0, section: 0)
        ThemeSelectionTable.selectRow(at: indexPath, animated: true, scrollPosition: .none)
    }
    
    // Controls the button selection for the greyscal option
    @IBAction func greyscaleChanged(_ sender: UIButton) {
        greyscaleYesButton.isSelected = false
        greyscaleNobutton.isSelected = false
        sender.isSelected = true
        greyscale = sender.currentTitle!
    }
    
    // Performs seque for going to the theme results page
    @IBAction func displayThemePressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: "goToResults", sender: self)
    }
    
    // Prepares seque for going to the theme results page
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResults" {
            let destinationVC = segue.destination as! ThemeResultsViewController
            destinationVC.themeName = themeName
            destinationVC.greyscale = greyscale
        }
    }
    
    // Sets the number of cells in the theme table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.themes.count
    }
    
    // Creates the cells for the theme table
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = (self.ThemeSelectionTable.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as UITableViewCell?)!

        cell.textLabel?.text = self.themes[indexPath.row]
        cell.textLabel?.textAlignment = .center
        return cell
    }
    
    // Sets the themeName parameter based on the table selection
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        themeName = self.themes[indexPath.row]
    }
    
    
    @IBAction func logoutPressed(_ sender: UIBarButtonItem) {
        do {
            try Auth.auth().signOut()
            navigationController?.popToRootViewController(animated: true)
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
    }
    
    func setDisplayName() {
        if currentUser.email != nil {
            db.collection("users").whereField("uid", isEqualTo: currentUser.uid).getDocuments { (QuerySnapshot, error) in
                if let e = error {
                    print(e.localizedDescription)
                } else {
                    for doc in QuerySnapshot!.documents {
                        let data = doc.data()
                        self.displayName = data["name"] as! String
                        self.headerLabel.text = "\(self.displayName)\'s Themes"
                    }
                }
            }
        } else {
            self.displayName = "Guest"
            headerLabel.text = "\(self.displayName)\'s Themes"
        }
    }

}
