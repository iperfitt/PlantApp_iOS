//
//  ProfileController.swift
//  PlantApp
//
//  Created by Ian Perfitt on 12/19/17.
//  Copyright © 2017 Ian Perfitt. All rights reserved.
//

import UIKit

class ProfileController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
     @IBOutlet var TableView: UITableView!
    
    @IBAction func addAPlant(_ sender: Any) {
        performSegue(withIdentifier: "AddAPlantSegue", sender: self)
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ProfileControllerTableViewCell
        
        // TODO
        //Update nickname, last water date
        //and image from firebase
        
        return cell
    }
    
    
    
    


}

