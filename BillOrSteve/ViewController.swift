//
//  ViewController.swift
//  BillOrSteve
//
//  Created by James Campagno on 6/8/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var score: UILabel!
    
    @IBOutlet weak var billbutton: UIButton!
    
    @IBOutlet weak var steveButton: UIButton!
    
    @IBOutlet weak var currentFact: UILabel!
    
    var currentPerson : String = ""
    
    var currentScore : Int = 0
    
    var billOrSteveDic : [String: [String]] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createFacts()
        
        doTheFacts()
        
    }
    
    func doTheFacts() {
        
        if let whoIsIt = getRandomFacts() {
            
            showFacts(whoIsIt.fact, aPerson: whoIsIt.who)
            
        }
    }

    func randomNumberFromZeroTo(number: Int) -> Int {
        return Int(arc4random_uniform(UInt32(number)))
    }
    
    func randomPerson() -> String {
        let randomNumber = arc4random_uniform(2)
        
        if randomNumber == 0 {
            return "Steve Jobs"
        } else {
            return "Bill Gates"
        }
    }
    
    func createFacts() {
        
        let steveFacts = [
            "He took a calligraphy course, which he says was instrumental in the future company products' attention to typography and font.",
            "Shortly after being shooed out of his company, he applied to fly on the Space Shuttle as a civilian astronaut (he was rejected) and even considered starting a computer company in the Soviet Union.",
            "He actually served as a mentor for Google founders Sergey Brin and Larry Page, even sharing some of his advisers with the Google duo.",
            "He was a pescetarian, meaning he ate no meat except for fish."]
        
        let billFacts = [
            "He aimed to become a millionaire by the age of 30. However, he became a billionaire at 31.",
            "He scored 1590 (out of 1600) on his SATs.",
            "His foundation spends more on global health each year than the United Nation's World Health Organization.",
            "The private school he attended as a child was one of the only schools in the US with a computer. The first program he ever used was a tic-tac-toe game.",
            "In 1994, he was asked by a TV interviewer if he could jump over a chair from a standing position. He promptly took the challenge and leapt over the chair like a boss."]
        
        billOrSteveDic.updateValue(steveFacts, forKey: "Steve Jobs")
        billOrSteveDic.updateValue(billFacts, forKey: "Bill Gates")
        
    }
    
    func getRandomFacts() -> (who: String, fact: String)? {
        // Make string for fact return
        var fact : String = ""
        
        // Get random person
        var person = randomPerson()
        
        // Get access to person's array
        // Unwrap person since they are an optional
        if var currentPerson = billOrSteveDic[person] {
            
            // Get the count of the array
            // Put that count of array in randomNumber
            var arrayCount = randomNumberFromZeroTo(currentPerson.count)
           
            
            
            // Get index of string using arrouncount
            fact = currentPerson[arrayCount]
            
        }
        print(fact)
        
        return (person, fact)
    }
    
    @IBAction func billAction(sender: AnyObject) {
        
        doTheFacts()
        
        if currentPerson == "Bill Gates" {
            
            currentScore = currentScore + 1
            score.text = ("\(currentScore)")

            
            print("It is Bill!")
        
        } else {
        
            print("You are wrong!")
        
        }
        
    }
    
    @IBAction func steveAction(sender: AnyObject) {
        
        doTheFacts()
        
        if currentPerson == "Steve Jobs" {
        
            print("It is Steve!")
            currentScore = currentScore + 1
            score.text = ("\(currentScore)")

       
        } else {
        
            print("You are wrong!")
        
        }
        
        
    }
    
    func showFacts(aFact: String, aPerson: String) {
        
        currentFact.text = aFact
        
        currentPerson = aPerson
    }
    
}
