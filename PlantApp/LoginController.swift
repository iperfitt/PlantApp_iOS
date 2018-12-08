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
    
    
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet var loginLabel: UILabel!
    
    @IBOutlet weak var login: UIButton!
    
    @IBOutlet weak var register: UIButton!
    
    @IBAction func logIn(_ sender: Any) {
        if let email = self.email.text, let password = self.password.text {
            
            Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
                if error != nil {
                    self.loginLabel.text = error?.localizedDescription
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
                self.loginLabel.text = error?.localizedDescription
                print(error!)
                }
            })
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    email.resignFirstResponder()
    password.resignFirstResponder()
    return(true)
    }
    
override func viewDidLoad() {
    super.viewDidLoad()
    self.email.delegate = self as? UITextFieldDelegate
    self.password.delegate = self as? UITextFieldDelegate
    self.login.layer.cornerRadius = 15
    self.register.layer.cornerRadius = 15
    
    }

}
