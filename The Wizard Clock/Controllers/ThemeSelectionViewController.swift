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

    // Init var for display name based on user's login
    var displayName: String = ""
    // Name of the theme to be displayed. Sent to the theme results view
    var themeName = "Nature"
    // Boolean which determines if the theme should be drawn in greyscale. Sent to the theme results view
    var greyscale = "Off"
    // Variable to shorten call for Auth's current user
    let currentUser = Auth.auth().currentUser!
    // Variable to shorten call for Firestore
    let db = Firestore.firestore()
    // List of all possible themes which populate the theme table
    let themes = ["Nature", "Jersey", "Binary"]
    // Name of identifier for cells which is used in making the theme table
    let cellReuseIdentifier = "cell"
    
    // Header label as a variable from UIBuilder in storyboard
    @IBOutlet weak var headerLabel: UILabel!
    // Connects to the table for selecting themes in the storyboard
    @IBOutlet weak var ThemeSelectionTable: UITableView!
    
    // Connects to the buttons for selecting the greyscale option in the storyboard
    @IBOutlet weak var greyscaleYesButton: UIButton!
    @IBOutlet weak var greyscaleNobutton: UIButton!
    
    // Function called before view/screen appears
    override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(true)
        // Hide the Navigation Back Button
        setDisplayName()
        self.navigationItem.hidesBackButton = true
        self.navigationItem.title = "Wizard Clock"
    }
    
    // Function called when view/screen appears
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
    
    
    // Function logs out Auth's current user, both anonymous and registered email
    // linked with navbar's logout button
    @IBAction func logoutPressed(_ sender: UIBarButtonItem) {
        do {
            try Auth.auth().signOut()
            navigationController?.popToRootViewController(animated: true)
        } catch let signOutError as NSError {
            // print to console if any error in loggin out Auth's current user
            print ("Error signing out: %@", signOutError)
        }
    }
    
    // Function call's current user's ref id and pulls stored name and is passed to headerLabel
    func setDisplayName() {
        // If Auth's current user is a registered user, get name
        if currentUser.email != nil {
            db.collection("users").whereField("uid", isEqualTo: currentUser.uid).getDocuments { (QuerySnapshot, error) in
                if let e = error {
                    // print error to console if failed
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
            // If Auth's current user is anonymous, set name to Guest
            self.displayName = "Guest"
            headerLabel.text = "\(self.displayName)\'s Themes"
        }
    }

}
