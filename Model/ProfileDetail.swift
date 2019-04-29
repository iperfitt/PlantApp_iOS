//
//  ProfileDetail.swift
//  PlantApp
//
//  Created by Ian Perfitt on 4/28/19.
//  Copyright © 2019 Ian Perfitt. All rights reserved.
//

import Foundation
import UIKit

class ProfileDetail: NSObject {
    
    var nickname: String
    
    var commonName: String
    
    var species: String
    
    var genus: String
    
    var datePurchased: String
    
    var lightNeeds: String
    
    var waterNeeds: String
    
    var fertilizerNeeds: String
    
    init(nicknameText: String, commonNameString: String, speciesText: String,
         genusText: String, datePurchasedText: String, lightNeedsText: String,
         waterNeedsText: String, fertilizerNeedsText: String) {
        
        nickname = nicknameText
        commonName = commonNameString
        species = speciesText
        genus = genusText
        datePurchased = datePurchasedText
        lightNeeds = lightNeedsText
        waterNeeds = waterNeedsText
        fertilizerNeeds = fertilizerNeedsText

        
    }
}
