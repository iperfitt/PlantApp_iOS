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

class ProfileController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
     @IBOutlet var TableView: UITableView!
    
    let databaseRef = Database.database().reference() as DatabaseReference!
    
    let userID = Auth.auth().currentUser!.uid
    
    var downloadLink : String!
    
    var downloadLinks = [String]()
    
    @IBAction func addAPlant(_ sender: Any) {
        performSegue(withIdentifier: "AddAPlantSegue", sender: self)
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ProfileControllerTableViewCell
        
        return cell
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        databaseRef?.child("users").child(userID).child("usersPhotos").observeSingleEvent(of: .value, with: { snapshot in
            // check if user has photo
            for photoURL in snapshot.children.allObjects as! [String] {
                self.downloadLinks.append(photoURL)
                
                }
            })
            
            
//            if snapshot.hasChild("userPhoto"){
//                // set image locatin
//                let filePath = "\(userID)/\("userPhoto")"
//                // Assuming a < 10MB file, though you can change that
//                self.storageRef.child(filePath).dataWithMaxSize(10*1024*1024, completion: { (data, error) in
//                    
//                    let userPhoto = UIImage(data: data!)
//                    self.userPhoto.image = userPhoto
//                })
//            }
//        })
//        
//    }
    

    }
}

