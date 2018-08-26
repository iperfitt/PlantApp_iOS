//
//  ViewController.swift
//  PlantApp
//
//  Created by Ian Perfitt on 12/19/17.
//  Copyright © 2017 Ian Perfitt. All rights reserved.
//

import UIKit

import Firebase


class LoginController: UIViewController {
    
    
    
    let email = UITextField(frame: CGRect(x: 20, y: 120, width: 300, height: 40))
    let password = UITextField(frame: CGRect(x: 20, y: 120, width: 300, height: 40))
    
     @IBOutlet var loginLabel: UILabel!
    
    @IBAction func logIn(_ sender: Any) {
        if let email = self.email.text, let password = self.password.text {
            
            Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
                
                if let error = error {
                    self.loginLabel.text = "Incorrect Credentials. Please Try Again"
                }
                else {
                    self.performSegue(withIdentifier: "ProfileSegue", sender: self)
                }
            }
        }
        
        
    }
    
    @IBAction func Register(_ sender: Any) {
        if let email = self.email.text, let password = self.password.text {
        Auth.auth().createUser(withEmail: email, password: password, completion: { (user: User?, error: Error?) in
            
            if error != nil {
                self.loginLabel.text = error?.localizedDescription as? String
                print(error)
                return
                
            }
            
//            guard let uid = user?.uid else {
//                return
//            }
    })
        }
    }


func addTextFields() {
    //Set up password textfield
    email.placeholder = "email"
    email.font = UIFont.systemFont(ofSize: 15)
    email.borderStyle = UITextBorderStyle.roundedRect
    email.keyboardType = UIKeyboardType.default
    email.autocorrectionType = UITextAutocorrectionType.no
    email.returnKeyType = UIReturnKeyType.done
    email.clearButtonMode = UITextFieldViewMode.whileEditing
    email.contentVerticalAlignment = UIControlContentVerticalAlignment.center
    
    //Add to view
    self.view.addSubview(email)
    
    //Allow below constraints to function
    email.translatesAutoresizingMaskIntoConstraints = false
    
    //Add Constraints
    email.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
    email.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -250).isActive = true
    
    email.widthAnchor.constraint(equalToConstant: 150).isActive = true
    email.heightAnchor.constraint(equalToConstant: 40).isActive = true
    
    //Same procedure for password textfield
    password.placeholder = "Password"
    password.font = UIFont.systemFont(ofSize: 15)
    password.borderStyle = UITextBorderStyle.roundedRect
    password.keyboardType = UIKeyboardType.default
    password.autocorrectionType = UITextAutocorrectionType.no
    password.returnKeyType = UIReturnKeyType.done
    password.clearButtonMode = UITextFieldViewMode.whileEditing
    password.contentVerticalAlignment = UIControlContentVerticalAlignment.center
    
    self.view.addSubview(password)
    
    password.translatesAutoresizingMaskIntoConstraints = false
    
    password.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
    password.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -150).isActive = true
    
    password.widthAnchor.constraint(equalToConstant: 150).isActive = true
    password.heightAnchor.constraint(equalToConstant: 40).isActive = true
}
        
override func viewDidLoad() {
    super.viewDidLoad()
    addTextFields()
    }

}

