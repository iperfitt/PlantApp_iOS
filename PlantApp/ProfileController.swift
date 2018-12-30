//
//  ProfileController.swift
//  PlantApp
//
//  Created by Ian Perfitt on 12/19/17.
//  Copyright © 2017 Ian Perfitt. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth
import FirebaseStorage
import SwiftyJSON

class ProfileController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    
    let databaseRef = Database.database().reference() as DatabaseReference!
    
    let userID = Auth.auth().currentUser!.uid
    
    var photos = [Photo]()
    
    var index  = 0
    
    var imageDownloadURL : String?
    
    @IBAction func addAPlant(_ sender: Any) {
        performSegue(withIdentifier: "AddAPlantSegue", sender: self)
    }
    
    @IBAction func changeView(_ sender: Any) {
        performSegue(withIdentifier: "CollectionViewSegue", sender: self)
    }
    
    @IBAction func goToCalendar(_ sender: Any) {
        performSegue(withIdentifier: "CalendarSegue", sender: self)
    }
    

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PhotoCell", for: indexPath) as! ProfileControllerTableViewCell
        return cell
    }
    
    func downloadPhotos(snapshot: DataSnapshot) {
        
        let json =  JSON(snapshot.value!)
    
        if case self.imageDownloadURL = json["downloadURL"].stringValue {
                
                let imageStorageRef = Storage.storage().reference(forURL: imageDownloadURL!)
                
                imageStorageRef.getData(maxSize: 2 * 1024 * 1024, completion: { (data, error) in
                    if let error = error {
                        print(")))))))) ERROR DOWNLOADING IMAGE: \(error)")
                    }
                    else {
                    
                    if let imageData = data {
                        DispatchQueue.main.async {
                            let image = UIImage(data: imageData)
                            photo.image = image
                            
                        }
                    }
                }
            })
        }
    }
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Database.database().reference().child("Users").child((Auth.auth().currentUser?.uid)!).child("Plants") .observe(.childAdded, with: { (snapshot) in
            
            self.downloadPhotos(snapshot: snapshot)
            
            DispatchQueue.main.sync {
                
                self.tableView.reloadData()
                
            }
            
            
            
            
            
        })
        
        
    }
}

