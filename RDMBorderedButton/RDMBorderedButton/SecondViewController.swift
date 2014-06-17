//
//  SecondViewController.swift
//  RDMBorderedButton
//
//  Created by Reese McLean on 6/15/14.
//  Copyright (c) 2014 Reese McLean. All rights reserved.
//

import UIKit
import QuartzCore

class SecondViewController: UIViewController {
    
    var frameAdjustingButton: BorderedButton!
    let firstFrame = CGRectMake(20.0, 80.0, 280.0, 120.0)
    let secondFrame = CGRectMake(20.0, 80.0, 100.0, 44.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.frameAdjustingButton = BorderedButton(frame: firstFrame)
        self.frameAdjustingButton.setTitle("Tap Me", forState: UIControlState.Normal)
        self.frameAdjustingButton.tintColor = UIColor.purpleColor()
        self.frameAdjustingButton.titleLabel.font = UIFont.systemFontOfSize(24.0)
        self.frameAdjustingButton.addTarget(self, action: "buttonTapped:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(self.frameAdjustingButton)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func buttonTapped(sender: UIButton!) {
        let newFrame = CGRectEqualToRect(self.frameAdjustingButton.frame, firstFrame) ? secondFrame : firstFrame
        let newCornerRadius = roundf(self.frameAdjustingButton.cornerRadiusRatioToSmallestSide * min(CGRectGetWidth(newFrame), CGRectGetHeight(newFrame)))
        let duration = 1.0
        let animation = CABasicAnimation(keyPath: "cornerRadius")
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        animation.fromValue = self.frameAdjustingButton.cornerRadius
        animation.toValue = newCornerRadius
        animation.duration = duration
        self.frameAdjustingButton.cornerRadius = newCornerRadius
        self.frameAdjustingButton.layer.addAnimation(animation, forKey:"cornerRadius")

        UIView.animateWithDuration(duration) { self.frameAdjustingButton.frame = newFrame }
        
    }

}
