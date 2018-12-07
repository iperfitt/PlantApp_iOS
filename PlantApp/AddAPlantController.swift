//
//  AddAPlantController.swift
//  PlantApp
//
//  Created by Ian Perfitt on 12/20/17.
//  Copyright © 2017 Ian Perfitt. All rights reserved.
//

import UIKit

import Firebase
import FirebaseDatabase


class AddAPlantController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var nickName: UITextField!
    
    @IBOutlet var commonName: UITextField!
    
    @IBOutlet weak var species: UITextField!

    @IBOutlet weak var genus: UITextField!
    
    @IBOutlet weak var datePurchased: UITextField!
    
    @IBOutlet weak var lightNeeds: UITextField!
   
    @IBOutlet weak var waterNeeds: UITextField!
    
    @IBOutlet weak var fertilizeNeeds: UITextField!
    
    @IBOutlet var savePlant: UIButton!
    
    @IBOutlet var previewImage: UIImageView!
    
    @IBOutlet var addAPhoto: UIButton!
    
    @IBOutlet weak var chosenImage: UIImageView!
    
    let storageRef = Storage.storage().reference()
    
    let databaseRef = Database.database().reference() as DatabaseReference!
    
    let picker = UIImagePickerController()
    
    let filePath = "/users/usersPhotos"

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerEditedImage] as? UIImage {
            previewImage.image = image
            addAPhoto.isHidden = true
            savePlant.isHidden = false
            chosenImage.image = image
            
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func selectPhoto(_ sender: Any) {
        picker.allowsEditing = true
        picker.sourceType = .photoLibrary
        
        self.present(picker, animated: true, completion: nil)
    }
    
    @IBAction func postPlant(_ sender: Any) {
            var data = Data()
            data = UIImageJPEGRepresentation(chosenImage.image!, 0.8)!
            let metaData = StorageMetadata()
            metaData.contentType = "image/jpg"
            self.storageRef.child(filePath).putData(data as Data, metadata: metaData){(metaData,error) in
                if let error = error {
                    print(error.localizedDescription)
                    return
                } else{
                    let downloadURL = metaData!.downloadURL()!.absoluteString
                    self.databaseRef?.child("users").child(Auth.auth().currentUser!.uid).updateChildValues(["usersPhotos": downloadURL,
                        "nickName": self.nickName.text!, "commonName": self.commonName.text!, "species": self.species.text!, "genus": self.genus.text!, "datePurchased":self.datePurchased.text!,
                        "lightNeeds": self.lightNeeds.text!, "waterNeeds": self.waterNeeds.text!, "fertilizeNeeds": self.fertilizeNeeds.text!])
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.delegate = self
        self.savePlant.layer.cornerRadius = 15
        self.addAPhoto.layer.cornerRadius = 15
    }
    
}
