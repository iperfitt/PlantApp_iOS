//
//  AddAPlantController.swift
//  PlantApp
//
//  Created by Ian Perfitt on 12/20/17.
//  Copyright © 2017 Ian Perfitt. All rights reserved.
//

import UIKit

class AddAPlantController: UIViewController {
    
    let nickName = UITextField(frame: CGRect(x: 20, y: 120, width: 300, height: 40))
    let commonName = UITextField(frame: CGRect(x: 20, y: 120, width: 300, height: 40))
    let species = UITextField(frame: CGRect(x: 20, y: 120, width: 300, height: 40))
    let genus = UITextField(frame: CGRect(x: 20, y: 120, width: 300, height: 40))
    let datePurchased = UITextField(frame: CGRect(x: 20, y: 120, width: 300, height: 40))
    let dateLastWatered = UITextField(frame: CGRect(x: 20, y: 120, width: 300, height: 40))
    let lightNeeds = UITextField(frame: CGRect(x: 20, y: 120, width: 300, height: 40))
    let waterNeeds = UITextField(frame: CGRect(x: 20, y: 120, width: 300, height: 40))
    let fertilizeNeeds = UITextField(frame: CGRect(x: 20, y: 120, width: 300, height: 40))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        AddTextFields()
    }
    
    func AddTextFields() {
        var textFields: [UITextField] = [nickName, commonName, species, genus, datePurchased, dateLastWatered,lightNeeds,waterNeeds,fertilizeNeeds]
        var placeholders: [String] = ["Nickname", "Common Name", "Species", "Genus", "Date Purchased", "Date Last Watered","Light Needs","Water Needs","Fertilization Needs"]
        //Set up Common Name textfield
        for i in 0...8 {
            textFields[i].placeholder = placeholders[i]
            textFields[i].font = UIFont.systemFont(ofSize: 15)
            textFields[i].borderStyle = UITextBorderStyle.roundedRect
            textFields[i].keyboardType = UIKeyboardType.default
            textFields[i].autocorrectionType = UITextAutocorrectionType.no
            textFields[i].returnKeyType = UIReturnKeyType.done
            textFields[i].clearButtonMode = UITextFieldViewMode.whileEditing
            textFields[i].contentVerticalAlignment = UIControlContentVerticalAlignment.center
            
            //Add to view
            self.view.addSubview(textFields[i])
        
            //Allow below constraints to function
            textFields[i].translatesAutoresizingMaskIntoConstraints = false
        
            //Add Constraints
            textFields[i].centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
            
            switch textFields[i] {
            
            case nickName:
                textFields[i].centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -250 ).isActive = true
                
            case commonName:
                textFields[i].centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -200 ).isActive = true
                
            case species:
                textFields[i].centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -150 ).isActive = true
                
            case genus:
                textFields[i].centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -100 ).isActive = true
                
            case datePurchased:
                textFields[i].centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -50 ).isActive = true
                
            case dateLastWatered:
                textFields[i].centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 0 ).isActive = true
                
            case lightNeeds:
                textFields[i].centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 50 ).isActive = true
                
            case waterNeeds:
                textFields[i].centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 100 ).isActive = true
                
            default:
                textFields[i].centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 150 ).isActive = true
            }
            
            textFields[i].widthAnchor.constraint(equalToConstant: 150).isActive = true
            textFields[i].heightAnchor.constraint(equalToConstant: 40).isActive = true
            
        }
    }
}
