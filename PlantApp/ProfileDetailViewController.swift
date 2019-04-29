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
    
    var plantDetail: ProfileDetail?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(plantDetail!.nickname as String)
        nickname.text = plantDetail!.nickname as String
        commonName.text = plantDetail!.commonName as String
        Species.text = plantDetail!.species as String
        Genus.text = plantDetail!.genus as String
        datePurchased.text = plantDetail!.datePurchased as String
        lightNeeds.text = plantDetail!.lightNeeds as String
        waterNeeds.text = plantDetail!.waterNeeds as String
        fertilizerNeeds.text = plantDetail!.fertilizerNeeds as String
    }

}
