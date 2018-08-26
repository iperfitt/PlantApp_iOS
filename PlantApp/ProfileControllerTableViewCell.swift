//
//  ProfileControllerTableViewCell.swift
//  PlantApp
//
//  Created by Ian Perfitt on 8/26/18.
//  Copyright © 2018 Ian Perfitt. All rights reserved.
//

import UIKit

class ProfileControllerTableViewCell: UITableViewCell{
    
    
    
    @IBOutlet var plantImage: UIImageView!
    
    @IBOutlet var nickname: UILabel!
    
    @IBOutlet var lastWaterDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
