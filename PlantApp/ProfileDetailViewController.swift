//
//  ProfileDetailViewController.swift
//  PlantApp
//
//  Created by Ian Perfitt on 3/30/19.
//  Copyright © 2019 Ian Perfitt. All rights reserved.
//

import UIKit

class ProfileDetailViewController: UIViewController {
    
    @IBOutlet weak var nickname: UILabel!
    
    @IBOutlet weak var commonName: UILabel!
    
    @IBOutlet weak var Species: UILabel!
    
    @IBOutlet weak var Genus: UILabel!
    
    @IBOutlet weak var datePurchased: UILabel!
    
    @IBOutlet weak var lightNeeds: UILabel!
    
    @IBOutlet weak var waterNeeds: UILabel!
    
    @IBOutlet weak var fertilizerNeeds: UILabel!
    
    //var plantDetail: ProfileDetail?
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        print(myIndex)
//        print(plantPosts[myIndex].nickname)
//        nickname.text = plantPosts[myIndex].nickname
    }

}
