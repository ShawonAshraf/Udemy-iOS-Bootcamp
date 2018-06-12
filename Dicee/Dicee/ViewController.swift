//
//  ViewController.swift
//  Dicee
//
//  Created by Shawon Ashraf on 6/12/18.
//  Copyright © 2018 Shawon Ashraf. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var diceImage: DiceImage?
    
    @IBOutlet weak var diceImageView1: UIImageView!
    @IBOutlet weak var diceImageView2: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // init diceImage
        diceImage = DiceImage()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func rollDiceOnClick(_ sender: UIButton) {
        updateDiceImages()
    }

    
    func updateDiceImages() {
        let images = diceImage?.getRandomDiceImages()
        
        if let imagesUnwrapped = images {
            let (image1, image2) = imagesUnwrapped
            
            // set images
            diceImageView1.image = image1
            diceImageView2.image = image2
        } else {
            // set default images
            diceImageView1.image = #imageLiteral(resourceName: "dice1")
            diceImageView2.image = #imageLiteral(resourceName: "dice1")
        }
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        updateDiceImages()
    }
}

