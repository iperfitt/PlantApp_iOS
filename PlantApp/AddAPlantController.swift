//
//  AddAPlantController.swift
//  PlantApp
//
//  Created by Ian Perfitt on 12/20/17.
//  Copyright © 2017 Ian Perfitt. All rights reserved.
//

import UIKit

import Firebase


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
    
    var chosenImage : UIImage
    
    let storageRef = Storage.storage().reference()
    
    var ref: DatabaseReference!
    
    ref = Database.database().reference()

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerEditedImage] as? UIImage {
            self.previewImage.image = image
            addAPhoto.isHidden = true
            savePlant.isHidden = false
            chosenImage = image
            
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func selectPhoto(_ sender: Any) {
        picker.allowsEditing = true
        picker.sourceType = .photoLibrary
        
        self.present(picker, animated: true, completion: nil)
    }
    
    @IBAction func postPlant(_ sender: Any) {
        
            var data = NSData()
            data = UIImageJPEGRepresentation(chosenImage, 0.8)! as NSData
            let filePath = "\(Auth.auth().currentUser!.uid)/\("userPhoto")"
            let metaData = StorageMetadata()
            metaData.contentType = "image/jpg"
            self.storageRef.child(filePath).putData(data as Data, metadata: metaData){(metaData,error) in
                if let error = error {
                    print(error.localizedDescription)
                    return
                }else{
                    //store downloadURL
                    let downloadURL = metaData!.downloadURL()!.absoluteString
                    //store downloadURL at database
                    self.databaseRef.child("users").child(Auth.auth()!.currentUser!.uid).updateChildValues(["userPhoto": downloadURL])
            }
        }
    }
    
        
        
    
    let picker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.delegate = self
    }
    
}
