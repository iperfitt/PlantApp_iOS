//
//  ViewController.swift
//  PlantApp
//
//  Created by Ian Perfitt on 12/19/17.
//  Copyright © 2017 Ian Perfitt. All rights reserved.
//

import UIKit

class LoginController: UIViewController {
    
    let username = UITextField(frame: CGRect(x: 20, y: 120, width: 300, height: 40))
    let password = UITextField(frame: CGRect(x: 20, y: 120, width: 300, height: 40))
    
    @IBAction func LogIn(_ sender: Any) {
        performSegue(withIdentifier: "ProfileSegue", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Set up password textfield
        username.placeholder = "Username"
        username.font = UIFont.systemFont(ofSize: 15)
        username.borderStyle = UITextBorderStyle.roundedRect
        username.keyboardType = UIKeyboardType.default
        username.autocorrectionType = UITextAutocorrectionType.no
        username.returnKeyType = UIReturnKeyType.done
        username.clearButtonMode = UITextFieldViewMode.whileEditing
        username.contentVerticalAlignment = UIControlContentVerticalAlignment.center
        
        //Add to view
        self.view.addSubview(username)
        
        //Allow below constraints to function
        username.translatesAutoresizingMaskIntoConstraints = false
        
        //Add Constraints
        username.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        username.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -250).isActive = true
        
        username.widthAnchor.constraint(equalToConstant: 150).isActive = true
        username.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
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
}
