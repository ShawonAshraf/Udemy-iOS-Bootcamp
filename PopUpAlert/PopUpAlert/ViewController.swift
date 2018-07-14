//
//  ViewController.swift
//  PopUpAlert
//
//  Created by Shawon Ashraf on 7/15/18.
//  Copyright © 2018 Shawon Ashraf. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var pressMeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showPopUpAlert(_ sender: Any) {
        let popUpMessage = "Hello hooman!"
        let alert = UIAlertController(title: "Greetings", message: popUpMessage, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Hey!", style: .destructive) { (action) in
            print(action)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
            print(action)
        }
        
        alert.addAction(action)
        alert.addAction(cancelAction)
        
        self.present(alert, animated: true)
    }
    
}

