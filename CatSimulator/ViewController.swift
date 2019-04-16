//
//  ViewController.swift
//  CatSimulator
//
//  Created by Justin Knight on 4/15/19.
//  Copyright © 2019 JustinKnight. All rights reserved.
//

import UIKit

// TODO:
//1. make sure current behavior is okay. See if there is a better way for the switch statement to be managed
//2. Add a first view controller that allows the selection of four different pets
//3. Create classes for each pet and implement them here
//4. Add a history table view for how well you did
//5. Add another option other than treats given and pets given
//6. Add diminishing returns and UI that shows that when a user gives too many of any one item
//7. Add a timer that a user has to respond to


class InitialViewController: UIViewController {
    var hoursAlive = 0
    var petsGiven = 0
    var treatsGiven = 0
    let hourAliveString = "Hours Alive: "
    let emojiArray = ["😻","😹","😼","🙀","😾"]
    var angerLevel = 0
    
    @IBOutlet weak var emojiTextView: UITextView!
    @IBOutlet weak var hourAliveTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func hourButtonPressed(_ sender: Any) {
        hoursAlive += 1
        // Round down here so that it takes atleast 2 of any combination of petsGiven and treatsGiven
        var average = floor(Double((treatsGiven + petsGiven)/2))
        // Check to see if anger level is not at the end bounds of the emoji array before increasing or descreasing the angerLevel
        if angerLevel < emojiArray.count-1 && average == 0 {angerLevel += 1}
        else if angerLevel > 0 && average >= 2 {angerLevel -= 1}
        print(angerLevel)
        emojiTextView.text = emojiArray[angerLevel]
        treatsGiven = 0
        petsGiven = 0
        hourAliveTextView.text = hourAliveString + String(hoursAlive)
    }
    
    @IBAction func petButtonPressed(_ sender: Any) {
        petsGiven += 1
    }
    
    @IBAction func feedButtonPressed(_ sender: Any) {
        treatsGiven += 1
    }
    
}
