//
//  SecondVC.swift
//  SegueExample
//
//  Created by Shawon Ashraf on 7/21/18.
//  Copyright © 2018 Shawon Ashraf. All rights reserved.
//

import UIKit

class SecondVC: UIViewController {
    var textPassedOver: String?
    
    @IBOutlet var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        label.text = textPassedOver!
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
