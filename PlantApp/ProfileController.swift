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

class ProfileController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var TableView: UITableView!
    
    let databaseRef = Database.database().reference() as DatabaseReference!
    
    let userID = Auth.auth().currentUser!.uid
    
    var downloadLink : String!
    
    var downloadLinks = [String]()
    
    var photoArray = [UIImage]()
    
    var index  = 0
    
    @IBAction func addAPlant(_ sender: Any) {
        performSegue(withIdentifier: "AddAPlantSegue", sender: self)
    }
    
    @IBAction func changeView(_ sender: Any) {
        performSegue(withIdentifier: "CollectionViewSegue", sender: self)
    }
    
    @IBAction func goToCalendar(_ sender: Any) {
        performSegue(withIdentifier: "CalendarSegue", sender: self)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return downloadLinks.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ProfileControllerTableViewCell
        
        
        //cell.nickname =
        //cell.lastWaterDate =
        cell.plantImage.image = photoArray[index]
        index += 1
        
        return cell
    }
    
    func getPhotoURLS() {
        databaseRef?.child("users").child(userID).child("usersPhotos").observeSingleEvent(of: .value, with: { (snapshot) in
            //initialize photo download array
            for photoURL in snapshot.children.allObjects as! [String] {
                self.downloadLinks.append(photoURL)
                
            }
        })
    }
    
    func downloadPhotos() {
        
        
        for url in downloadLinks {
            let storageRef = Storage.storage().reference(forURL: url)
            storageRef.getData(maxSize: 1 * 1024 * 1024) { (data, error) -> Void in
                let pic = UIImage(data: data!)
                self.photoArray.append(pic!)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getPhotoURLS()
        downloadPhotos()
    }
}

