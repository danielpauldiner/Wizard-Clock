//
//  SignInViewController.swift
//  The Wizard Clock
//
//  Created by Joshua Dean on 5/18/20.
//  Copyright © 2020 Daniel. All rights reserved.
//

import UIKit
import Firebase

class SignInViewController: UIViewController {

    // Optional variable to set UITextfields as active
    var activeTextField : UITextField? = nil
    // Textfields used for signing user in
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    // Label that displays user error from textfield
    @IBOutlet weak var errorLabel: UILabel!
    
    // Function called when view is shown
    override func viewDidLoad() {
        super.viewDidLoad()
        setViewDidLoad()
    }
    
    // All functions needed when viewDidLoad() is called
    func setViewDidLoad() {
        // Indicates to the system that the view controller status bar attributes have changed
        setNeedsStatusBarAppearanceUpdate()
        // Sets navigation title
        self.navigationItem.title = "Sign In"
        // Hides errorLabel until error from registration textfields is displayed
        errorLabel.alpha = 0
        setTextfieldDelegates()
        setObservers()
    }
    
    // Sets all registration textfields as delegates
    private func setTextfieldDelegates() {
        emailTextfield.delegate = self
        passwordTextfield.delegate = self
    }
    
    // Adds observer functions to listen for notification of keyboard hiding/unhiding
    func setObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(SignInViewController.keyboardDidAppear), name: UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(SignInViewController.keyboardDidDisappear), name: UIResponder.keyboardDidHideNotification, object: nil)
    }
    
    // Setting up textfields so the keyboard's return key can navigate to the next textfield when necessary
    // sourced from stackoverflow
    // https://stackoverflow.com/questions/31766896/switching-between-text-fields-on-pressing-return-key-in-swift/48180129
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailTextfield {
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
        
        // Shifts view up based on a quarter of the height of the keyboard
        if(shouldMoveViewUp) {
            self.view.frame.origin.y = 0 - (keyboardSize.height / 4)
        }
    }

    // Objective-c function that reshifts view back to normal when keyboard is hidden
    // sourced from fluffy.es
    // https://fluffy.es/move-view-when-keyboard-is-shown/
    @objc func keyboardDidDisappear(notification: NSNotification) {
        self.view.frame.origin.y = 0
    }
    
    // Signin button that sends sign in request to Auth
    @IBAction func signInPressed(_ sender: UIButton) {
        // If error, print error to errorLabel
        if let email = emailTextfield.text, let password = passwordTextfield.text {
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                if let e = error {
                    self.errorLabel.alpha = 1
                    self.errorLabel.text = e.localizedDescription
                    print(e.localizedDescription)
                } else {
                    // Navi to the LoginViewController if successful
                    self.performSegue(withIdentifier: "SignInAccount", sender: self)
                }
            }
        }
    }
}

// Extension to assist with textfield enter key navigation
// Sources from fluffy.es
// https://fluffy.es/move-view-when-keyboard-is-shown/
extension SignInViewController : UITextFieldDelegate {
    
    // Set current textfield as active
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.activeTextField = textField
    }
    
    //Set current textfield as inactive
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.activeTextField = nil
    }
}
