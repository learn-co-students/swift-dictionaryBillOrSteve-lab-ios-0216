//
//  ViewController.swift
//  BillOrSteve
//
//  Created by James Campagno on 6/8/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var facts = [String: [String]]()
    var currentperson = String()
    var currentFact = String()
    var points = Int()
    
    @IBOutlet weak var factLabel: UILabel!
    @IBOutlet weak var scoreCounter: UILabel!
    @IBOutlet weak var steveButton: UIButton!
    @IBOutlet weak var billButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createFacts()
        showFact()
        scoreCounter.text = "\(points)"
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
    
    func createFacts(){
        
        facts = ["Steve Jobs":["He took a calligraphy course, which he says was instrumental in the future company products' attention to typography and font.", "Shortly after being shooed out of his company, he applied to fly on the Space Shuttle as a civilian astronaut (he was rejected) and even considered starting a computer company in the Soviet Union.", "He actually served as a mentor for Google founders Sergey Brin and Larry Page, even sharing some of his advisers with the Google duo.", "He was a pescetarian, meaning he ate no meat except for fish.", "He had alopacia"],
                 
                 "Bill Gates":["He aimed to become a millionaire by the age of 30. However, he became a billionaire at 31.", "He scored 1590 (out of 1600) on his SATs.", "His foundation spends more on global health each year than the United Nation's World Health Organization.", "The private school he attended as a child was one of the only schools in the US with a computer. The first program he ever used was a tic-tac-toe game.", "In 1994, he was asked by a TV interviewer if he could jump over a chair from a standing position. He promptly took the challenge and leapt over the chair like a boss."]]
    }
    
    func getRandomfact()->(person:String, fact: String)?{
        
        let person = randomPerson()
        let factNumber = randomNumberFromZeroTo(4)
        let allFacts = facts[person]
        
        if let allFacts = allFacts{
            
            let singleFact = allFacts[factNumber]
            
            return (person, singleFact)
        }
        
        return (nil)
        
    }
    @IBAction func steveTapped(sender: UIButton) {
        
        let compareFact = facts["Steve Jobs"]
        
        if let unwrappedFacts = compareFact{
            
            if unwrappedFacts.contains(currentFact){
                
                points += 1
                scoreCounter.text = "\(points)"
                
            }
        }
        showFact()
    }
    
    @IBAction func billTapped(sender: UIButton) {
        
        let compareFact = facts["Bill Gates"]
        
        if let unwrappedFacts = compareFact{
            
            if unwrappedFacts.contains(currentFact){
                
                points += 1
                scoreCounter.text = "\(points)"
            }
        }
        showFact()
    }
    
    func showFact(){
        
        let randoPerson = getRandomfact()?.person
        let randoFact = getRandomfact()?.fact
        if let fact = randoFact{
            
            if let person = randoPerson{
                
                currentFact = fact
                currentperson = person
                factLabel.text = currentFact
            }
        }
        
        
    }
    
}








