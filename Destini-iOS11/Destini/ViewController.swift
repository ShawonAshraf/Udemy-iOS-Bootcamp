//
//  ViewController.swift
//  Destini
//
//  Created by Philipp Muellauer on 01/09/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // Our strings
    let story1 = "Your car has blown a tire on a winding road in the middle of nowhere with no cell phone reception. You decide to hitchhike. A rusty pickup truck rumbles to a stop next to you. A man with a wide brimmed hat with soulless eyes opens the passenger door for you and asks: \"Need a ride?\"."
    let answer1a = "I\'ll hop in. Thanks for the help!"
    let answer1b = "Better ask him if he\'s a murderer first."
    
    
    let story2 = "He nods slowly, unphased by the question."
    let answer2a = "At least he\'s honest. I\'ll climb in."
    let answer2b = "Wait, I know how to change a tire."
    
    let story3 = "As you begin to drive, the stranger starts talking about his relationship with his mother. He gets angrier and angrier by the minute. He asks you to open the glovebox. Inside you find a bloody knife, two severed fingers, and a cassette tape of Elton John. He reaches for the glove box."
    let answer3a = "I love Elton John! Hand him the cassette tape."
    let answer3b = "It\'s him or me! You take the knife and stab him."
    
    let story4 = "What? Such a cop out! Did you know traffic accidents are the second leading cause of accidental death for most adult age groups?"
    let story5 = "As you smash through the guardrail and careen towards the jagged rocks below you reflect on the dubious wisdom of stabbing someone while they are driving a car you are in."
    let story6 = "You bond with the murderer while crooning verses of \"Can you feel the love tonight\". He drops you off at the next town. Before you go he asks you if you know any good places to dump bodies. You reply: \"Try the pier.\""
    
    
    // UI Elements linked to the storyboard
    @IBOutlet weak var topButton: UIButton!         // Has TAG = 1
    @IBOutlet weak var bottomButton: UIButton!      // Has TAG = 2
    @IBOutlet weak var storyTextView: UILabel!
    
    // TODO Step 5: Initialise instance variables here
    
    
    private var state: State = State()
    private var currentStory: String = ""
    private var storyFlow: [Int: String] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // TODO Step 3: Set the text for the storyTextView, topButton, bottomButton, and to T1_Story, T1_Ans1, and T1_Ans2
        
        storyFlow[1] = story1
        storyFlow[2] = story2
        storyFlow[3] = story3
        storyFlow[4] = story4
        storyFlow[5] = story5
        storyFlow[6] = story6
        
        storyTextView.text = story1
        bottomButton.setTitle(answer1b, for: .normal)
        topButton.setTitle(answer1a, for: .normal)
    }

    
    // User presses one of the buttons
    @IBAction func buttonPressed(_ sender: UIButton) {
    
        // TODO Step 4: Write an IF-Statement to update the views
        if !state.isComplete() {
            updateState(tag: sender.tag)
            updateStory()
            updateUI()
        } else {
            print("done")
        }
    }
    
    private func updateUI() {
        storyTextView.text = currentStory
        updateButtonTitle()
    }
    
    private func resetAll() {
        state = State()
        storyTextView.text = story1
        bottomButton.setTitle(answer1b, for: .normal)
        topButton.setTitle(answer1a, for: .normal)
    }
    
    private func updateButtonTitle() {
        if state.currentIndex == 2 {
            bottomButton.setTitle(answer2b, for: .normal)
            topButton.setTitle(answer2a, for: .normal)
        } else if state.currentIndex == 3 {
            bottomButton.setTitle(answer3b, for: .normal)
            topButton.setTitle(answer3a, for: .normal)
        } else {
            bottomButton.setTitle("", for: .disabled)
            topButton.setTitle("", for: .disabled)
        }
    }

    private func updateStory() {
        currentStory = storyFlow[state.currentIndex] ?? ""
    }
    
    private func updateState(tag: Int) {
        let currentQ = state.currentIndex
        switch tag {
        case 1:
            state.flow[currentQ] = "a"
        case 2:
            state.flow[currentQ] = "b"
        default:
            print("Default Action")
        }
        
        let index = currentQ
        let answer = state.flow[index]
        
        
        if index == 1 {
            switch answer {
            case "a":
                state.currentIndex = 3
            case "b":
                state.currentIndex = 2
            default:
                print("updateStory")
            }
        } else if index == 2 {
            switch answer {
            case "a":
                state.currentIndex = 3
            case "b":
                state.currentIndex = 4
            default:
                print("updateStory")
            }
        } else if index == 3 {
            switch answer {
            case "a":
                state.currentIndex = 6
            case "b":
                state.currentIndex = 5
            default:
                print("")
            }
        }

        if state.isComplete() {
            
            let alert = UIAlertController(title: "The End", message: "You've reached the end", preferredStyle: .alert)
            let startOverAction = UIAlertAction(title: "Start Over?", style: .default) { (action) in
                self.resetAll()
            }
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
                print("Canceled")
            }
            
            alert.addAction(startOverAction)
            alert.addAction(cancelAction)
            
            present(alert, animated: true)
        }
        
        print(state.currentIndex)
        print(state.flow)
    }

}

