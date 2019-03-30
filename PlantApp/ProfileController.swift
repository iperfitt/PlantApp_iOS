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
        let imageStorageRef = Storage.storage().reference(forURL: plantPosts[indexPath.row].photoUrl)
        imageStorageRef.getData(maxSize: 2 * 1024 * 1024, completion: {(data, error) in
        if let error = error {
            print("ERROR DOWNLOADING IMAGE")
            } else {
            if let imageData = data {
            let image = UIImage(data: imageData)
                cell.imageView?.image = image
                self.tableView.reloadData()
            
                }
            }
        })
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
        
        let longPressRec = UILongPressGestureRecognizer(target: self, action: #selector(waterPlant(press:)))
        longPressRec.minimumPressDuration = 2.0
        //waterPlant.addGestureRecognizer(longPressRec)

   }
    
    func waterPlant(press:UILongPressGestureRecognizer) {
        if press.state == .began {
            
        }
    }
}


