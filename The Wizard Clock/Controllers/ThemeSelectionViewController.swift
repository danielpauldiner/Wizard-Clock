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
    var themeName = "Nature"
    var greyscale = "Off"
    let currentUser = Auth.auth().currentUser!
    let db = Firestore.firestore()
    let themes = ["Nature", "Jersey", "Binary"]
    let cellReuseIdentifier = "cell"
    
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var ThemeSelectionTable: UITableView!
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

        self.ThemeSelectionTable.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        ThemeSelectionTable.delegate = self
        ThemeSelectionTable.dataSource = self
    }
    
    @IBAction func greyscaleChanged(_ sender: UIButton) {
        greyscaleYesButton.isSelected = false
        greyscaleNobutton.isSelected = false
        sender.isSelected = true
        greyscale = sender.currentTitle!
        print(displayName)
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
            headerLabel.text = "\(displayName)\'s Themes"
        }
    }
}
