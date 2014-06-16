//
//  BorderedButton.swift
//  RDMBorderedButton
//
//  Created by Reese McLean on 6/15/14.
//  Copyright (c) 2014 Reese McLean. All rights reserved.
//

import UIKit

class BorderedButton: UIButton {
    
    var shouldAdjustCornerRadiusBasedOnFrame: Bool {
    didSet {
        if (shouldAdjustCornerRadiusBasedOnFrame) {
            self.adjustCornerRadiusBasedOnFrame()
        }
    }
    }
    
    var cornerRadiusRatioToSmallestSide: Float {
    didSet {
        if (shouldAdjustCornerRadiusBasedOnFrame) {
            self.adjustCornerRadiusBasedOnFrame()
        }
    }
    }
    
    var cornerRadius: CGFloat {
    didSet {
        self.layer.cornerRadius = cornerRadius
    }
    }
    
    init(coder aDecoder: NSCoder!)  {
        self.cornerRadius = 0
        self.shouldAdjustCornerRadiusBasedOnFrame = true
        self.cornerRadiusRatioToSmallestSide = 1.0/6.0
        
        super.init(coder: aDecoder)
        
        self.setTitleColor(self.tintColor, forState: UIControlState.Normal)
        self.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Highlighted)
        self.setTitleColor(UIColor.grayColor(), forState: UIControlState.Disabled)
        
        self.adjustCornerRadiusBasedOnFrame()
        self.layer.borderWidth = 1.0
        self.updateBorderAndFill()
    }
    
    init(frame: CGRect) {
        self.cornerRadius = 0
        self.shouldAdjustCornerRadiusBasedOnFrame = true
        self.cornerRadiusRatioToSmallestSide = 1.0/6.0
        
        super.init(frame: frame)
        
        self.setTitleColor(self.tintColor, forState: UIControlState.Normal)
        self.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Highlighted)
        self.setTitleColor(UIColor.grayColor(), forState: UIControlState.Disabled)
        
        self.adjustCornerRadiusBasedOnFrame()
        self.layer.borderWidth = 1.0
        self.updateBorderAndFill()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if (self.shouldAdjustCornerRadiusBasedOnFrame) {
            self.adjustCornerRadiusBasedOnFrame()
        }
    }
    
    override func tintColorDidChange()  {
        super.tintColorDidChange()
        self.setTitleColor(self.tintColor, forState: UIControlState.Normal)
        println(self.tintColor)
        self.updateBorderAndFill()
    }
    
    override func setTitleColor(color: UIColor!, forState state: UIControlState) {
        if (self.titleColorForState(state) == color) {
            return;
        }
        
        super.setTitleColor(color, forState: state)
        
        //Why do I need to use value here?
        if (state.value == UIControlState.Normal.value) {
            self.tintColor = color
        }
        
        self.updateBorderAndFill()
    }
    
    override var tintColor: UIColor! {
    didSet {
        if (oldValue == tintColor) {
            return
        }
        
        self.setTitleColor(tintColor, forState: UIControlState.Normal)
        self.updateBorderAndFill()
    }
    }
    
    override var enabled:Bool {
    didSet {
        self.updateBorderAndFill()
    }
    }
    
    override var highlighted:Bool {
    didSet {
        if (oldValue == self.highlighted) {
            return
        }
        UIView.animateWithDuration(0.2, animations: {
            self.updateBorderAndFill()
        } )
    }
    }
    
    func updateBorderAndFill () {
        self.layer.borderColor = self.enabled ? self.tintColor.CGColor : self.titleColorForState(UIControlState.Disabled).CGColor;
        self.backgroundColor = self.highlighted ? self.tintColor : UIColor.clearColor()
    }

    func adjustCornerRadiusBasedOnFrame() {
        self.cornerRadius = roundf(min(CGRectGetWidth(self.frame), CGRectGetHeight(self.frame)) * self.cornerRadiusRatioToSmallestSide)
    }
    
    

}
