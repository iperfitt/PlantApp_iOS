//
//  Photo.swift
//  PlantApp
//
//  Created by Ian Perfitt on 12/15/18.
//  Copyright © 2018 Ian Perfitt. All rights reserved.
//

import Foundation
import UIKit

class PlantPost: NSObject {
    var nickname: String
    var photoUrl: String
    
    init(nicknameText: String, photoUrlString: String) {
        nickname = nicknameText
        photoUrl = photoUrlString
    }
}
