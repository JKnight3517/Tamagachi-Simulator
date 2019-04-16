//
//  ViewController.swift
//  CatSimulator
//
//  Created by Justin Knight on 4/15/19.
//  Copyright © 2019 JustinKnight. All rights reserved.
//

import UIKit


class TamagachiViewController: UIViewController {
    var hoursAlive = 0
    var petsGiven = 0
    var treatsGiven = 0
    let hourAliveString = "Hours Alive: "
    var emojiArray = [String]()
    let catEmojiArray =  ["😻","😹","😼","🙀","😾",]
    let monkeyEmojiArray = ["🐵","🙉","🐒","🙊","🙈"]
    var angerLevel = 0
    var didChooseCat = true
    
    @IBOutlet weak var emojiTextView: UITextView!
    @IBOutlet weak var hourAliveTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        if didChooseCat {
            emojiArray = catEmojiArray
        } else { emojiArray = monkeyEmojiArray}
        // Do any additional setup after loading the view.
        emojiTextView.text = emojiArray[0]
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
