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
    
    var nicknameText : String?
    
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
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        print(indexPath.row)
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ProfileControllerTableViewCell
        cell.nickName.setTitle(plantPosts[indexPath.row].nickname, for: .normal)
        cell.lastWateredDate.text = ""
        //Declare Storage Reference based off of plant photo url
        let imageStorageRef = Storage.storage().reference(forURL: plantPosts[indexPath.row].photoUrl)
        //Retreive Plant photo
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
        //Retrieve nickname, photo URL storage string from database and store in dict
        Database.database().reference().child("Users").child((Auth.auth().currentUser?.uid)!)
        .child("Plants").observe(.childAdded, with: { (snapshot) in
        if let dict = snapshot.value as? [String: Any] {
        let nicknameText = dict["nickName"] as! String
        let photoUrlString = dict["downloadURL"] as! String
        //Create a new PlantPost using plant specific nickname and URL
        let plantPost = PlantPost(nicknameText: nicknameText, photoUrlString: photoUrlString)
        //Append to plantPosts array
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
   }
    
    //Prepare plant specific data to be sent to ProfileDetailController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let plantDetail = ProfileDetail(nicknameText: self.nicknameText ?? "N/A", commonNameString: "hello",
                        speciesText: "hello", genusText: "hello", datePurchasedText: "hello",
                        lightNeedsText: "hello", waterNeedsText: "hello", fertilizerNeedsText: "hello")
        
        // Create a new variable to store the instance of ProfileDetailController
        let destinationVC = segue.destination as! ProfileDetailViewController
        destinationVC.plantDetail = plantDetail
    }
}



