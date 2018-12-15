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
    
    var photos = [Photo]()
    
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
        return photos.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //////youtube
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let photo = photos[indexPath.row]
        cell.textLabel?.text = photo.nickname
        
        
        cell.imageView?.image = UIImage(named: "Plant")
        
        if let profileImageUrl = photo.profileImageUrl {
            let url = NSURL(string: profileImageUrl)
            URLSession.sharedSession().dataTaskWithURL(url: NSURL, completionHandler: {(data,  response, error) in
                
                if error != nil {
                    print(error)
                    return
                }
                dispatch_async(dispatch_get_main_queue(), {
                cell.imageView?.image = UIImage(data: data!)
                    })
            }).resume()
        }
        
        return cell
    }
    
    func getPhotos() {
        databaseRef?.child("Users").child((Auth.auth().currentUser?.uid)!).observe(.childAdded, with: { (snapshot) in
            if let dictionary = snapshot.value as? [String: AnyObject] {
                let photo = Photo()
                
                photo.setValuesForKeys(dictionary)
                self.photos.append(photo)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                })
                
            }
        }, withCancel: nil)
        
       }
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getPhotos()
        
    }
}

