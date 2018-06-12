//
//  DiceImage.swift
//  Dicee
//
//  Created by Shawon Ashraf on 6/12/18.
//  Copyright © 2018 Shawon Ashraf. All rights reserved.
//

import Foundation
import UIKit

class DiceImage {
    private var diceImageArray: [UIImage]
    
    init() {
        // init dice image array
        self.diceImageArray = []
        self.initDiceImageArray()
    }
    
    // init array with elements
    private func initDiceImageArray() {
        for i in 1...6 {
            let imageName = "dice\(i)"
            if let image = UIImage(named: imageName) {
                self.diceImageArray.append(image)
            }
        }
    }
    
    // generate random index for dice images
    private func generateRandomDiceIndex() -> (Int, Int) {
        let randomDiceIndex1 = Int(arc4random_uniform(6))
        let randomDiceIndex2 = Int(arc4random_uniform(6))
        
        return (randomDiceIndex1, randomDiceIndex2)
    }
    
    // get random dice images
    public func getRandomDiceImages() -> (UIImage, UIImage) {
        let (randomDiceIndex1, randomDiceIndex2) = self.generateRandomDiceIndex()
        
        let image1 = self.diceImageArray[randomDiceIndex1]
        let image2 = self.diceImageArray[randomDiceIndex2]
        
        return (image1, image2)
    }
}
