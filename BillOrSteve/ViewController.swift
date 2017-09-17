//
//  ViewController.swift
//  BillOrSteve
//
//  Created by James Campagno on 6/8/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var factLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var steveButton: UIButton!
    @IBOutlet weak var billButton: UIButton!
    
    var currentSteveOrBill = String()
    var randomFacts = [String : [String]]()
    var score = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        creatFacts()
        showFact()
    }
    
    func showFact() {
        let currentFactItem = getRandomFact()
        if let currentFactItem = currentFactItem {
            currentSteveOrBill = currentFactItem.name
            let currentFact = currentFactItem.fact
            factLabel.text = currentFact
        } else {
            factLabel.text = "No More Facts!"
            steveButton.isEnabled = false
            billButton.isEnabled = false
        }
    }
    
    @IBAction func steveButtonTapped(_ sender: UIButton) {
        if currentSteveOrBill == "Steve Jobs" {
            score += 1
            scoreLabel.text = "\(score)"
        }
        showFact()
    }
    
    @IBAction func billButtonTapped(_ sender: UIButton) {
        if currentSteveOrBill == "Bill Gates" {
            score += 1
            scoreLabel.text = "\(score)"
        }
        showFact()
    }
    
    
    // Helper Functions
    func randomIndex(fromArray array: [String]) -> Int {
        return Int(arc4random_uniform(UInt32(array.count)))
    }
    
    func randomPerson() -> String {
        let randomNumber = arc4random_uniform(2)
        
        if randomNumber == 0 {
            return "Steve Jobs"
        } else {
            return "Bill Gates"
        }
    }
    
    func creatFacts () {
        let steveJobsFacts = ["He took a calligraphy course, which he says was instrumental in the future company products' attention to typography and font.",
                              "Shortly after being shooed out of his company, he applied to fly on the Space Shuttle as a civilian astronaut (he was rejected) and even considered starting a computer company in the Soviet Union.",
                              "He actually served as a mentor for Google founders Sergey Brin and Larry Page, even sharing some of his advisers with the Google duo.",
                              "He was a pescetarian, meaning he ate no meat except for fish."]
        
        let billGatesFacts = ["He aimed to become a millionaire by the age of 30. However, he became a billionaire at 31.",
                              "He scored 1590 (out of 1600) on his SATs.",
                              "His foundation spends more on global health each year than the United Nation's World Health Organization.",
                              "The private school he attended as a child was one of the only schools in the US with a computer. The first program he ever used was a tic-tac-toe game.",
                              "In 1994, he was asked by a TV interviewer if he could jump over a chair from a standing position. He promptly took the challenge and leapt over the chair like a boss."]
        
        randomFacts["Steve Jobs"] = steveJobsFacts
        randomFacts["Bill Gates"] = billGatesFacts
    }
    
    func getRandomFact() -> (fact: String, name: String)? {
        if randomFacts.isEmpty {
            return nil
        }
        
        let steveOrBill = randomPerson()
        var randomFactsArray = randomFacts[steveOrBill]
        var randomFact = String()
        
        if var randomFactsArray = randomFactsArray {
            let randomFactIndex = randomIndex(fromArray: randomFactsArray)
            randomFact = randomFactsArray[randomFactIndex]
            randomFactsArray.remove(at: randomFactIndex)
            randomFacts[steveOrBill] = randomFactsArray
            
            if randomFacts[steveOrBill]!.isEmpty {
                randomFacts[steveOrBill] = nil
            }
            
            return (randomFact, steveOrBill)
        } else {
            switchCurrentSteveOrBill()
            randomFactsArray = randomFacts[currentSteveOrBill]
            
            if var randomFactsArray = randomFactsArray {
                let randomFactIndex = randomIndex(fromArray: randomFactsArray)
                randomFact = randomFactsArray[randomFactIndex]
                randomFactsArray.remove(at: randomFactIndex)
                randomFacts[steveOrBill] = randomFactsArray
                
                if randomFacts[steveOrBill]!.isEmpty {
                    randomFacts[steveOrBill] = nil
                }
                
                return (randomFact, steveOrBill)
            }
        }
        return (randomFact, steveOrBill)
    }
    
    func switchCurrentSteveOrBill() {
        if currentSteveOrBill == "Steve Jobs" {
            currentSteveOrBill = "Bill Gates"
        } else if currentSteveOrBill == "Bill Gates" {
            currentSteveOrBill = "Steve Jobs"
        }
    }
}
