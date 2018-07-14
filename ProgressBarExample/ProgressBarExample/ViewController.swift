//
//  ViewController.swift
//  ProgressBarExample
//
//  Created by Shawon Ashraf on 7/15/18.
//  Copyright © 2018 Shawon Ashraf. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var hitButton: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var countLabel: UILabel!
    
    private var noClicks: Int = 0
    private var progress: Float = 0
    private let alpha: Float = 0.1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        progressBar.progressViewStyle = .bar
        progressBar.setProgress(progress, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func updateCount(_ sender: Any) {
        if progress <= 1 {
            updateUI()
        } else {
            showMessage()
        }
    }
    
    func updateUI() {
        noClicks = noClicks + 1
        self.countLabel.text = "Clicks : \(self.noClicks)"
        
        progress = progress + alpha
        progressBar.setProgress(progress, animated: true)
    }
    
    func showMessage() {
        let alert = UIAlertController(title: "End of the road!", message: "You just hit the limit!", preferredStyle: .alert)
        
        let startOverAction = UIAlertAction(title: "Star over?", style: .default) { (_) in
            self.resetUI()
        }
        alert.addAction(startOverAction)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
            ProgressHUD.showSuccess("Welp! You decided to stay!")
            print(action)
        }
        alert.addAction(cancelAction)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func resetUI() {
        self.noClicks = 0
        self.countLabel.text = "Clicks : \(self.noClicks)"
        
        self.progress = 0
        self.progressBar.setProgress(progress, animated: true)
    }
    
}

