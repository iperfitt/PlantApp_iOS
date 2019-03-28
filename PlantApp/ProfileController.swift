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
    
    var plantPosts = [PlantPost]()
    
    var photos = [UIImage]()
    
    var downloadURLS = [String]()
    
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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return plantPosts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = plantPosts[indexPath.row].nickname
        return cell
    }
    
    func loadPosts() {
        Database.database().reference().child("Users").child((Auth.auth().currentUser?.uid)!).child("Plants").observe(.childAdded, with: { (snapshot) in
            if let dict = snapshot.value as? [String: Any] {
            let nicknameText = dict["nickName"] as! String
            let photoUrlString = dict["downloadURL"] as! String
            let plantPost = PlantPost(nicknameText: nicknameText, photoUrlString: photoUrlString)
            self.plantPosts.append(plantPost)
            self.tableView.reloadData()
            
        }
        })
    }
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        loadPosts()
//        var post = PlantPost(nicknameText: "test", photoUrlString: "url")
//        print(post.nickname)
//        print(post.photoUrl)
        
//        Database.database().reference().child("Users").child((Auth.auth().currentUser?.uid)!).observe(.childAdded, with: { (snapshot) in
//
//
//
//            if let dictionary = snapshot.value as? [String: Any] {
//
//
//                for i in snapshot.children.allObjects as! [DataSnapshot] {
//                    let dic2 = i.value as! [String: String]
//                    self.downloadURLS.append(dic2["downloadURL"] as! String)
//
//
//                }
//
//            }
//
//            for i in self.downloadURLS {
//                let imageStorageRef = Storage.storage().reference(forURL: i)
//
//                imageStorageRef.getData(maxSize: 2 * 1024 * 1024, completion: {(data, error) in
//
//                    if let error = error {
//                        print("ERROR DOWNLOADING IMAGE")
//                    } else {
//                        if let imageData = data {
//                                let image = UIImage(data: imageData)
//                                self.photos.append(image!)
//                                self.tableView.reloadData()
//
//                        }
//                    }
//
//                })
//            }
//
//        })
//
//
   }
}


