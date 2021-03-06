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
    
    @IBAction func goToPlantDetails(_ sender: Any) {
        performSegue(withIdentifier: "ProfileDetailSegue", sender: self)
    }
    
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ProfileControllerTableViewCell
        cell.nickName.setTitle(plantPosts[indexPath.row].nickname, for: .normal)
        print(indexPath.row)
        cell.lastWateredDate.text = "temp"
        //cell.waterPlant.tag = indexPath.row
        //cell.waterPlant.addTarget(self, action: Selector(("waterPlant")), for: .touchUpInside)
        let imageStorageRef = Storage.storage().reference(forURL: plantPosts[indexPath.row].photoUrl)
        imageStorageRef.getData(maxSize: 2 * 1024 * 1024, completion: {(data, error) in
        if let error = error {
            print(error.localizedDescription)
            } else {
            if let imageData = data {
            let imageToSet = UIImage(data: imageData)
                cell.plantPhoto.setImage(imageToSet, for: .normal)
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
        self.tableView.rowHeight = 200.0
        tableView.dataSource = self
        loadPosts()
//        let longPressRec = UILongPressGestureRecognizer(target: self, action: #selector(UIViewController.waterPlant(press: )))
//        longPressRec.minimumPressDuration = 2.0
//        waterPlant.addGestureRecognizer(longPressRec)

   }
    
//    @objc func waterPlant(press:UILongPressGestureRecognizer) {
//        if press.state == .began {
//
//        }
//    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let plantDetail = ProfileDetail(nicknameText: "hello", commonNameString: "hello",
                        speciesText: "hello", genusText: "hello", datePurchasedText: "hello",
                        lightNeedsText: "text", waterNeedsText: "text", fertilizerNeedsText: "text")
        
        // Create a new variable to store the instance of PlayerTableViewController
        let destinationVC = segue.destination as! ProfileDetailViewController
        destinationVC.plantDetail = plantDetail
    }
}



