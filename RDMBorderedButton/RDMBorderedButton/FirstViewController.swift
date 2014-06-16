//
//  FirstViewController.swift
//  RDMBorderedButton
//
//  Created by Reese McLean on 6/15/14.
//  Copyright (c) 2014 Reese McLean. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
                            
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet var redButton : BorderedButton
    @IBOutlet var toggleButton : BorderedButton

    @IBAction func disableRedButtonPushed(sender : UIButton) {
        
        if (self.redButton.enabled) {
            self.redButton.enabled = false
            self.toggleButton.setTitle("Enable Red Button", forState: UIControlState.Normal)
        } else {
            self.redButton.enabled = true
            self.toggleButton.setTitle("Disable Red Button", forState: UIControlState.Normal)
        }
        
    }
    
    @IBAction func showAlertButtonPushed(sender : UIButton) {
        
        let okayAction = UIAlertAction(title: "Okay",
                                       style: UIAlertActionStyle.Default,
                                     handler: nil)
        let alertViewController = UIAlertController(title: "Alert!",
                                        message: "Notice that the button borders desaturate as they should.",
                                 preferredStyle: UIAlertControllerStyle.Alert)
        alertViewController.addAction(okayAction)
        self.presentViewController(alertViewController, animated: true, completion: nil)
        
    }
    
}

