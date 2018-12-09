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
    
    @IBOutlet weak var fertilizerNeeds: UITextField!
    
    @IBOutlet var savePlant: UIButton!
    
    @IBOutlet var previewImage: UIImageView!
    
    @IBOutlet var addAPhoto: UIButton!
    
    @IBOutlet weak var chosenImage: UIImageView!
    
    let storageRef = Storage.storage().reference()
    
    let databaseRef = Database.database().reference() as DatabaseReference!
    
    let picker = UIImagePickerController()
    
    let uid = ""
    
    let userID = Auth.auth().currentUser!.uid

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerEditedImage] as? UIImage {
            previewImage.image = image
            addAPhoto.setTitle("Change Photo", for: .normal)
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
            let tDouble = Date()
            //convert time since reference date into a string
            let tString = String(format:"%.1f", tDouble.timeIntervalSinceReferenceDate as CVarArg)
            let metaData = StorageMetadata()
            data = UIImageJPEGRepresentation(chosenImage.image!, 0.8)!
            metaData.contentType = "image/jpg"
            self.storageRef.child(Auth.auth().currentUser?.uid as! String).child(tString).putData(data as Data, metadata: metaData){(metaData,error) in
                if let error = error {
                    return
                } else{
                    let downloadURL = metaData!.downloadURL()!.absoluteString
                    self.databaseRef?.child("Users").child(self.userID).child("Plants").child(tString.replacingOccurrences(of: ".", with: "-", options: .literal, range: nil)).updateChildValues(["downloadURL": downloadURL,
                        "nickName": self.nickName.text!, "commonName": self.commonName.text!, "species": self.species.text!, "genus": self.genus.text!, "datePurchased":self.datePurchased.text!,
                        "lightNeeds": self.lightNeeds.text!, "waterNeeds": self.waterNeeds.text!, "fertilizerNeeds": self.fertilizerNeeds.text!])
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        nickName.resignFirstResponder()
        commonName.resignFirstResponder()
        species.resignFirstResponder()
        genus.resignFirstResponder()
        datePurchased.resignFirstResponder()
        lightNeeds.resignFirstResponder()
        waterNeeds.resignFirstResponder()
        fertilizerNeeds.resignFirstResponder()
        return(true)
    }
    
    func setDelegates() {
       self.nickName.delegate = self as? UITextFieldDelegate
        self.commonName.delegate = self as? UITextFieldDelegate
        self.species.delegate = self as? UITextFieldDelegate
        self.genus.delegate = self as? UITextFieldDelegate
        self.datePurchased.delegate = self as? UITextFieldDelegate
        self.lightNeeds.delegate = self as? UITextFieldDelegate
        self.waterNeeds.delegate = self as? UITextFieldDelegate
        self.fertilizerNeeds.delegate = self as? UITextFieldDelegate
        picker.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegates()
        self.savePlant.layer.cornerRadius = 15
        self.addAPhoto.layer.cornerRadius = 15
    }
    
}
