//
//  RDMBorderedButton.h
//  RDMBorderedButton
//
//  Created by Reese McLean on 6/12/14.
//  Copyright (c) 2014 Reese McLean. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE
@interface RDMBorderedButton : UIButton

///Adjusting corner radius manually turns off automatic corner radius updating.
@property (nonatomic, assign) IBInspectable CGFloat cornerRadius;

///Border width of button
@property (nonatomic, assign) IBInspectable CGFloat borderWidth;

///Determines whether the buttons corner radius is adjusting based on frame changes. Default = YES.
@property (nonatomic, assign) IBInspectable BOOL adjustsCornerRadiusBasedOnFrame;

///Approximate ratio of corner radius to smallest side of button frame. Default = 1.0/6.0.
@property (nonatomic, assign) IBInspectable CGFloat cornerRadiusRatioToSmallestSide;

@end
