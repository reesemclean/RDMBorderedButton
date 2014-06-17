//
//  BorderedButton.swift
//  RDMBorderedButton
//
//  Created by Reese McLean on 6/15/14.
//  Copyright (c) 2014 Reese McLean. All rights reserved.
//

import UIKit

class BorderedButton: UIButton {
    
    @IBInspectable var shouldAdjustCornerRadiusBasedOnFrame: Bool {
    didSet {
        if (shouldAdjustCornerRadiusBasedOnFrame) {
            self.adjustCornerRadiusBasedOnFrame()
        }
    }
    }
    
    @IBInspectable var cornerRadiusRatioToSmallestSide: Float {
    didSet {
        if (shouldAdjustCornerRadiusBasedOnFrame) {
            self.adjustCornerRadiusBasedOnFrame()
        }
    }
    }
    
    //We should not set corner radius ourselves, instead we should set the layer's corner radius — this setter is exclusively for outside callers.
    @IBInspectable var cornerRadius: CGFloat {
    get {
        return self.layer.cornerRadius
    }
    set {
        self.shouldAdjustCornerRadiusBasedOnFrame = false
        self.layer.cornerRadius = newValue
    }
    }
    
    init(coder aDecoder: NSCoder!)  {
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
        self.updateBorderAndFill()
    }
    
    override func setTitleColor(color: UIColor!, forState state: UIControlState) {
        if (self.titleColorForState(state).isEqual(color) ) {
            return;
        }
        
        super.setTitleColor(color, forState: state)
        
        if (UIControlState.Normal.value == state.value && !self.tintColor.isEqual(color)) {
            self.tintColor = color
        }
        
        self.updateBorderAndFill()
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
        self.layer.borderColor = self.enabled ? self.titleColorForState(UIControlState.Normal).CGColor : self.titleColorForState(UIControlState.Disabled).CGColor;
        self.backgroundColor = self.highlighted ? self.titleColorForState(UIControlState.Normal) : UIColor.clearColor()
    }

    func adjustCornerRadiusBasedOnFrame() {
        self.layer.cornerRadius = roundf(min(CGRectGetWidth(self.frame), CGRectGetHeight(self.frame)) * self.cornerRadiusRatioToSmallestSide)
    }

}
