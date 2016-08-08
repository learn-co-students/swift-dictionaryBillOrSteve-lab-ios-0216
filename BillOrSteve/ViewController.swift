//
//  ViewController.swift
//  BillOrSteve
//
//  Created by James Campagno on 6/8/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

var randomFacts : [String : [String]] = [:]
var number : Int  = 0



class ViewController: UIViewController {
  
    @IBOutlet weak var factLabel: UILabel!
    @IBOutlet weak var scoreCounterLabel: UILabel!
    
    @IBOutlet weak var billButton: UIButton!
    @IBOutlet weak var SteveButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        creatFacts()
        getRandomFact()
        showFact()
        
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
    
    
    func creatFacts() {
        
        let billGatesFacts = ["He aimed to become a millionaire by the age of 30. However, he became a billionaire at 31.", "He scored 1590 (out of 1600) on his SATs.", "His foundation spends more on global health each year than the United Nation's World Health Organization.", "The private school he attended as a child was one of the only schools in the US with a computer. The first program he ever used was a tic-tac-toe game.","In 1994, he was asked by a TV interviewer if he could jump over a chair from a standing position. He promptly took the challenge and leapt over the chair like a boss."]
        let steveJobsFacts = [ "He took a calligraphy course, which he says was instrumental in the future company products' attention to typography and font.", "Shortly after being shooed out of his company, he applied to fly on the Space Shuttle as a civilian astronaut (he was rejected) and even considered starting a computer company in the Soviet Union.", "He actually served as a mentor for Google founders Sergey Brin and Larry Page, even sharing some of his advisers with the Google duo.", "He was a pescetarian, meaning he ate no meat except for fish."]
        
        
        randomFacts["Steve Jobs"] = steveJobsFacts
        randomFacts["Bill Gates"] = billGatesFacts
        
        
    }
    
    
    func getRandomFact() -> (String , String) {

        let fact = randomFacts[randomPerson()]!
        let randomThing = fact[randomNumberFromZeroTo((randomFacts[randomPerson()]?.count)!)]
        let person = randomPerson()
        return (person, randomThing)
        
    }
    
    func showFact() {
       
        var factsArray : [String] = []
   
        if factsArray.count < 10 {
            
            factsArray.append(getRandomFact().1)
            self.factLabel.text = getRandomFact().1
        } else if factsArray.count == 10 {
            factsArray.removeAll()
            self.factLabel.text = "Start New Game"
        }
        
        
    }
    
    @IBAction func steveButtonTapped(sender: AnyObject) {
        

        
        let correctAnswer = getRandomFact().0
    
        if correctAnswer == "Steve Jobs" {
            
            scoreCounterLabel.text = "\(number + 1) / 9"
            
            if number == 9 {
                scoreCounterLabel.text = "0 / 9"
            } else {
                
                factLabel.text = "You guessed wrong"
            }
        }
        
        
        creatFacts()
        getRandomFact()
        showFact()
    }
    
    @IBAction func billButtonTapped(sender: AnyObject) {
        
        
        
        let correctAnswer = getRandomFact().0
        
        if correctAnswer == "Bill Gates" {
            
            scoreCounterLabel.text = "\(number + 1) / 9"
            
            if number == 9 {
                scoreCounterLabel.text = "0 / 9"
            }else {
                scoreCounterLabel.text = "\(number - 1) / 9"
                
                factLabel.text = "You guessed wrong"
            }

        }
        
        creatFacts()
        getRandomFact()
        showFact()

    }
    
    
    
}
