//
//  ViewController.swift
//  SegueExample
//
//  Created by Shawon Ashraf on 7/21/18.
//  Copyright © 2018 Shawon Ashraf. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var textField: UITextField!
    @IBOutlet var btn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func navToSecondVC(_ sender: Any) {
        performSegue(withIdentifier: "goToSecondVC", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToSecondVC" {
            let destinationVC = segue.destination as! SecondVC
            
            if let text = textField.text {
                destinationVC.textPassedOver = text
            } else {
                destinationVC.textPassedOver = "🤣 Nothing! Bamboozled!"
            }
            
        }
    }
    
}

