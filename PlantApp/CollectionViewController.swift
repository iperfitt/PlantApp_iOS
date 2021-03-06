//
//  CollectionViewController.swift
//  PlantApp
//
//  Created by nooch boi on 11/18/18.
//  Copyright © 2018 Ian Perfitt. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth
import FirebaseStorage



class CollectionViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
        
        let reuseIdentifier = "cell" // also enter this string as the cell identifier in the storyboard
    
//        var items = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48"]
    
    let databaseRef = Database.database().reference()
    
    let userID = Auth.auth().currentUser?.uid
    
    var downloadLinks = [String]()
    
    var photoArray = [UIImage]()
        
        
        // MARK: - UICollectionViewDataSource protocol
        
        // tell the collection view how many cells to make
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return self.photoArray.count
        }
        
        // make a cell for each cell index path
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            
            // get a reference to our storyboard cell
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! MyCollectionViewCell
            
            // Use the outlet in our custom class to get a reference to the UILabel in the cell
            
            //cell.label.text = self.items[indexPath.item]
            //cell.backgroundColor = UIColor.cyan // make cell more visible in our example project
            cell.image = self.photoArray[indexPath.item]
            
            return cell
        }
    
    func getPhotoURLS() {
        
        databaseRef.child("users").child(userID!).child("usersPhotos").observeSingleEvent(of: .value, with: { (snapshot) in
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

    
        // MARK: - UICollectionViewDelegate protocol
        
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            // handle tap events
            print("You selected cell #\(indexPath.item)!")
        }
    }

