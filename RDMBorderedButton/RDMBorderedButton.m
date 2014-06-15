//
//  RDMBorderedButton.m
//  RDMBorderedButton
//
//  Created by Reese McLean on 6/12/14.
//  Copyright (c) 2014 Reese McLean. All rights reserved.
//

#import "RDMBorderedButton.h"

@implementation RDMBorderedButton

-(id) init {
    return [self initWithFrame:CGRectZero];
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self commonSetup];
    }
    return self;
}

-(id) initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self commonSetup];
    }
    return self;
}

-(void) commonSetup {
    
    [self setTitleColor:self.tintColor forState:UIControlStateNormal];
    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [self setTitleColor:[UIColor grayColor] forState:UIControlStateDisabled];
    
    _adjustsCornerRadiusBasedOnFrame = YES;
    _cornerRadiusRatioToSmallestSide = 1.0/6.0;
    [self adjustCornerRadius];
        
    self.layer.cornerRadius = _cornerRadius;
    self.layer.borderWidth = 1.0;
    self.layer.borderColor = self.tintColor.CGColor;
}

-(void) layoutSubviews {
    [super layoutSubviews];
    if (self.adjustsCornerRadiusBasedOnFrame) {
        [self adjustCornerRadius];
    }
}

-(void) tintColorDidChange {
    [super tintColorDidChange];
    [self setTitleColor:self.tintColor forState:UIControlStateNormal];
    [self updateBorderAndFill];
}

-(void) adjustCornerRadius {
    _cornerRadius = roundf(MIN(CGRectGetHeight(self.frame), CGRectGetWidth(self.frame)) * self.cornerRadiusRatioToSmallestSide);
    self.layer.cornerRadius = _cornerRadius;
}

-(void) setTitleColor:(UIColor *)color forState:(UIControlState)state {
    
    if ([[self titleColorForState:state] isEqual:color]) {
        return;
    }
    
    [super setTitleColor:color forState:state];
    
    if (state == UIControlStateNormal) {
        self.tintColor = color;
    }
    
    [self updateBorderAndFill];
}

-(void) setTintColor:(UIColor *)tintColor {
    
    if ([[self tintColor] isEqual:tintColor]) {
        return;
    }
    
    [super setTintColor:tintColor];
    [self setTitleColor:self.tintColor forState:UIControlStateNormal];
    [self updateBorderAndFill];
}

-(void) setCornerRadius:(CGFloat)cornerRadius {
    self.adjustsCornerRadiusBasedOnFrame = NO;
    _cornerRadius = cornerRadius;
    self.layer.cornerRadius = _cornerRadius;
}

-(void) setEnabled:(BOOL)enabled {

    [super setEnabled:enabled];
    [self updateBorderAndFill];
    
}

-(void) updateBorderAndFill {
    self.layer.borderColor = self.enabled ? self.tintColor.CGColor : [self titleColorForState:UIControlStateDisabled].CGColor;
    self.backgroundColor = self.highlighted ? self.tintColor : [UIColor clearColor];
}

-(void) setHighlighted:(BOOL)highlighted {
    
    if (self.highlighted == highlighted) {
        return;
    }
    
    [super setHighlighted:highlighted];
    
    [UIView animateWithDuration:0.2f
                          delay:0.0f
                        options:UIViewAnimationOptionAllowUserInteraction | UIViewAnimationOptionBeginFromCurrentState
                     animations:^{
                         self.backgroundColor = highlighted ? self.tintColor : [UIColor clearColor];
                     }
                     completion:nil];
    
}

@end
