//
//  RegisterViewController.swift
//  The Wizard Clock
//
//  Created by Joshua Dean on 5/18/20.
//  Copyright © 2020 Daniel. All rights reserved.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {

    // Variable to shorten call to Firestore
    let db = Firestore.firestore()
    // Optional variable to set UITextfields as active
    var activeTextField : UITextField? = nil
    // Textfield variables to send name, email, and password strings
    @IBOutlet weak var nameTextfield: UITextField!
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    // Error label that shows error from textfield registrations
    @IBOutlet weak var errorLabel: UILabel!
    
    // Function called when view is shown
    override func viewDidLoad() {
        super.viewDidLoad()
        setViewDidLoad()
    }
    
    // All functions needed when viewDidLoad() is called
    func setViewDidLoad() {
        // Sets navigation title
        self.navigationItem.title = "Register"
        // Hides errorLabel until error from registration textfields is displayed
        errorLabel.alpha = 0
        setTextfieldDelegates()
        setObservers()
    }
    
    // Sets all registration textfields as delegates
    private func setTextfieldDelegates() {
        nameTextfield.delegate = self
        emailTextfield.delegate = self
        passwordTextfield.delegate = self
    }
    
    // Adds observer functions to listen for notification of keyboard hiding/unhiding
    func setObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(RegisterViewController.keyboardDidAppear), name: UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(RegisterViewController.keyboardDidDisappear), name: UIResponder.keyboardDidHideNotification, object: nil)
    }
    
    // Setting up textfields so the keyboard's return key can navigate to the next textfield when necessary
    // sourced from stackoverflow
    // https://stackoverflow.com/questions/31766896/switching-between-text-fields-on-pressing-return-key-in-swift/48180129
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
      if textField == nameTextfield {
         textField.resignFirstResponder()
         emailTextfield.becomeFirstResponder()
      } else if textField == emailTextfield {
         textField.resignFirstResponder()
         passwordTextfield.becomeFirstResponder()
      } else if textField == passwordTextfield {
         textField.resignFirstResponder()
      }
     return true
    }
    
    
    // Objective-C function called when keyboard notification appears
    // If keyboard covers textfield, shift view up to uncover textfield the keyboard would have covered
    // sourced from fluffy.es
    // https://fluffy.es/move-view-when-keyboard-is-shown/
    @objc func keyboardDidAppear(notification: NSNotification) {
        
        guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
            // if keyboard size is not available for some reason, dont do anything
           return
        }
        
        var shouldMoveViewUp = false
        
        // if active text field is not nil
        if let activeTextField = activeTextField {
            
            let bottomOfTextField = activeTextField.convert(activeTextField.bounds, to: self.view).maxY;
            let topOfKeyboard = self.view.frame.height - keyboardSize.height
            
            if bottomOfTextField > topOfKeyboard {
                shouldMoveViewUp = true
            }
        }
        
        // Shifts view up based on half the height of the keyboard
        if(shouldMoveViewUp) {
            self.view.frame.origin.y = 0 - (keyboardSize.height / 3)
        }
    }

    // Objective-c function that reshifts view back to normal when keyboard is hidden
    // sourced from fluffy.es
    // https://fluffy.es/move-view-when-keyboard-is-shown/
    @objc func keyboardDidDisappear(notification: NSNotification) {
        self.view.frame.origin.y = 0
    }
    
    
    // Function sends registration request to Auth in Firebase and alerts user upon success
    // Alert code sourced from c-sharpcorner
    // https://www.c-sharpcorner.com/article/display-alert-box-in-swift2/
    @IBAction func registerPressed(_ sender: UIButton) {
        // Function validates nametextfield requirements are fulfilled
        // if not, tells user error
        if nameTextfield.text == nil || nameTextfield.text == "" {
            self.errorLabel.alpha = 1
            self.errorLabel.text = "Name Text Field must be filled"
            return
        }
        // Function requests registration based on given name, email, and password
        if let name = nameTextfield.text?.firstUppercased, let email = emailTextfield.text, let password = passwordTextfield.text {
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let e = error {
                    self.errorLabel.alpha = 1
                    self.errorLabel.text = (e.localizedDescription)
                    print(e.localizedDescription)
                } else {
                    // If registration is successful, add nametextfield string to Firestore database
                    self.db.collection("users").addDocument(data: ["name":name, "uid": authResult!.user.uid])
                    // Alerts user that registration is successful based on given name, email, and password
                    let alertController = UIAlertController(title: "Success!", message: "Email \(email) with display name \(name) was successfully registered. Tap \"OK\" to continue", preferredStyle: .alert)
                    let OKAction = UIAlertAction(title: "OK", style: .default) {
                        (action: UIAlertAction!) in
                        //Navi to the ChatViewController
                        self.performSegue(withIdentifier: "RegisterAccount", sender: self)
                    }
                    alertController.addAction(OKAction)
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
    }
    
    // If screen is tapped anywhere in view besides textfields and keyboard, hide keyboard if keyboard is shown
    @IBAction func tapPressed(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
}

// Extension to Uppercase first letter of a string
extension StringProtocol {
    var firstUppercased: String { prefix(1).uppercased() + dropFirst() }
}

// Extension to assist with textfield enter key navigation as well as
// workaround to remove iCloud's strong password suggestion bug
// Sources from fluffy.es and stackoverflow
// https://fluffy.es/move-view-when-keyboard-is-shown/
// https://stackoverflow.com/questions/53097620/expo-disable-autofill-strong-password-autofill-on-ios-12
extension RegisterViewController : UITextFieldDelegate {
    // If current textfield is passwordTextfield, set SecureTextEntry true
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if (textField == self.passwordTextfield
            && !self.passwordTextfield.isSecureTextEntry) {
            self.passwordTextfield.isSecureTextEntry = true
        }
        return true
    }
    
    // Set current textfield as active
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.activeTextField = textField
    }
    
    //Set current textfield as inactive
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.activeTextField = nil
    }
}
