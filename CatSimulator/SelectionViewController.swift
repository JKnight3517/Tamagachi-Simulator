//
//  SelectionViewController.swift
//  CatSimulator
//
//  Created by Justin Knight on 4/16/19.
//  Copyright © 2019 JustinKnight. All rights reserved.
//

import Foundation
import UIKit

class SelectionViewController: UIViewController {
    var selectedCat = true
    
    @IBAction func catButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "animalSelected", sender: nil)
    }
    
    
    @IBAction func monkeyButtonPressed(_ sender: Any) {
        selectedCat = false
        performSegue(withIdentifier: "animalSelected", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "animalSelected" {
            let vc = segue.destination as! TamagachiViewController
            vc.didChooseCat = selectedCat
        }
    }
    
    
}
