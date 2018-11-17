//
//  AddAPlantController.swift
//  PlantApp
//
//  Created by Ian Perfitt on 12/20/17.
//  Copyright © 2017 Ian Perfitt. All rights reserved.
//

import UIKit

class AddAPlantController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var nickName: UITextField!
    
    @IBOutlet var commonName: UIView!
    
    @IBOutlet weak var species: UITextField!

    @IBOutlet weak var genus: UITextField!
    
    @IBOutlet weak var datePurchased: UITextField!
    
    @IBOutlet weak var dateLastWatered: UITextField!
    
    @IBOutlet weak var lightNeeds: UITextField!
   
    @IBOutlet weak var waterNeeds: UITextField!
    
    @IBOutlet weak var fertilizeNeeds: UITextField!
    
    @IBOutlet var savePlant: UIButton!
    
    @IBOutlet var previewImage: UIImageView!
    
    @IBOutlet var addAPhoto: UIButton!
    
    let storageRef = storage.reference()
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerEditedImage] as? UIImage {
            self.previewImage.image = image
            addAPhoto.isHidden = true
            savePlant.isHidden = false
            
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func selectPhoto(_ sender: Any) {
        picker.allowsEditing = true
        picker.sourceType = .photoLibrary
        
        self.present(picker, animated: true, completion: nil)
    }
    
    @IBAction func postPlant(_ sender: Any) {
    }
    
    let picker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.delegate = self
    }
    
}
