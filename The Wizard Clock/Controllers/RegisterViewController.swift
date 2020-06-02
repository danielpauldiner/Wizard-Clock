//
//  RegisterViewController.swift
//  The Wizard Clock
//
//  Created by Joshua Dean on 5/18/20.
//  Copyright © 2020 Daniel. All rights reserved.
//

import UIKit
import Firebase

extension StringProtocol {
    var firstUppercased: String { prefix(1).uppercased() + dropFirst() }
}
class RegisterViewController: UIViewController {

    let db = Firestore.firestore()
    @IBOutlet weak var nameTextfield: UITextField!
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Register"
        errorLabel.alpha = 0
    }
    
    @IBAction func registerPressed(_ sender: UIButton) {
        if nameTextfield.text == nil || nameTextfield.text == "" {
            self.errorLabel.alpha = 1
            self.errorLabel.text = "Name Text Field must be filled"
            return
        }
        if let name = nameTextfield.text?.firstUppercased, let email = emailTextfield.text, let password = passwordTextfield.text {
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let e = error {
                    self.errorLabel.alpha = 1
                    self.errorLabel.text = (e.localizedDescription)
                    print(e.localizedDescription)
                } else {
                    self.db.collection("users").addDocument(data: ["name":name, "uid": authResult!.user.uid])
                    let alertController = UIAlertController(title: "Success!", message: "Email \(email) with display name \(name) was successfully registered. Tap \"OK\" to continue", preferredStyle: .alert)
                    let OKAction = UIAlertAction(title: "OK", style: .default) {
                        (action: UIAlertAction!) in
                        // Code in this block will trigger when OK button tapped.
                        //Navi to the ChatViewController
                        self.performSegue(withIdentifier: "RegisterAccount", sender: self)
                    }
                    alertController.addAction(OKAction)
                    self.present(alertController, animated: true, completion: nil)
                }
            }
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
