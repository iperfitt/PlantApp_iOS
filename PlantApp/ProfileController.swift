//
//  ProfileController.swift
//  PlantApp
//
//  Created by Ian Perfitt on 12/19/17.
//  Copyright © 2017 Ian Perfitt. All rights reserved.
//

import UIKit

class ProfileController: UIViewController {
    
    @IBOutlet weak var myPlants: UIButton!
    @IBOutlet weak var Two: UIButton!
    @IBOutlet weak var addAPlant: UIButton!
    @IBOutlet weak var More: UIButton!
    
    var myPlantsCenter : CGPoint!
    var twoCenter : CGPoint!
    var addAPlantCenter : CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myPlantsCenter = myPlants.center
        twoCenter = Two.center
        addAPlantCenter = addAPlant.center
        
        myPlants.center = More.center
        Two.center = More.center
        addAPlant.center = More.center
        
        
    }
    
    @IBAction func moreClicked(_ sender: UIButton) {
        
        if More.backgroundColor == UIColor.white {
            UIView.animate(withDuration: 0.3, animations: {
                self.myPlants.alpha = 1
                self.Two.alpha = 1
                self.addAPlant.alpha = 1
                
                self.myPlants.center = self.myPlantsCenter
                self.Two.center = self.twoCenter
                self.addAPlant.center = self.addAPlantCenter
            })
            
        } else {
            UIView.animate(withDuration: 0.3, animations: {
                self.myPlants.alpha = 0
                self.Two.alpha = 0
                self.addAPlant.alpha = 0
                
                self.myPlants.center = self.More.center
                self.Two.center = self.More.center
                self.addAPlant.center = self.More.center
            })
        }
        
        toggleButton(button: sender)
    }
    
    @IBAction func myPlants(_ sender: UIButton) {
        toggleButton(button: sender)
        performSegue(withIdentifier: "MyPlantsSegue", sender: self)
    }
    
    @IBAction func Two(_ sender: UIButton) {
        toggleButton(button: sender)
    }
    
    @IBAction func addAPlant(_ sender: UIButton) {
        toggleButton(button: sender)
        performSegue(withIdentifier: "AddAPlantSegue", sender: self)
    }
    
    
    func toggleButton(button: UIButton) {
        if button.backgroundColor == UIColor.white {
            button.backgroundColor = UIColor.black
        } else {
            button.backgroundColor = UIColor.white
        }
    }
}
