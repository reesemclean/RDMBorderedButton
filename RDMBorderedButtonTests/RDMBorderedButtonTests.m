//
//  RDMBorderedButtonTests.m
//  RDMBorderedButtonTests
//
//  Created by Reese McLean on 6/12/14.
//  Copyright (c) 2014 Reese McLean. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "RDMBorderedButton.h"

@interface RDMBorderedButtonTests : XCTestCase

@end

@implementation RDMBorderedButtonTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testCornerRadius
{
    
    RDMBorderedButton *button = [[RDMBorderedButton alloc] init];
    
    button.frame = CGRectMake(0, 0, 40.0, 60.0);
    
    XCTAssertTrue(button.cornerRadiusRatioToSmallestSide > 0, @"Corner radius ratio should default to non-zero");
    XCTAssertEqualWithAccuracy(button.cornerRadius, 40.0 * button.cornerRadiusRatioToSmallestSide, 1.0, @"Button corner radius should adjust on frame change.");
    XCTAssertEqual(button.layer.cornerRadius, button.cornerRadius, @"Button corner radius should adjust layer corner radius.");
    
    button.cornerRadius = 10;
    
    XCTAssertTrue(!button.adjustsCornerRadiusBasedOnFrame, @"Button should no longer adjust radius based on frame due to manual corner radius change.");
    XCTAssertEqual(button.layer.cornerRadius, 10.0, @"Button layer's corner radius should update on manual corner radius change");
    
    button.frame = CGRectMake(0, 0, 0, 0);
    
    XCTAssertEqual(button.cornerRadius, 10.0, @"A button should not change corner radius automatically after manual corner radius change.");
    
    RDMBorderedButton *nonAdjustingButton = [[RDMBorderedButton alloc] init];
    nonAdjustingButton.adjustsCornerRadiusBasedOnFrame = NO;
    
    XCTAssertTrue(nonAdjustingButton.cornerRadius == 0, @"A button initialized with CGRectZero should have corner radius of 0");
    
    nonAdjustingButton.frame = CGRectMake(0, 0, 40.0, 60.0);
    XCTAssertEqual(nonAdjustingButton.cornerRadius, 0, @"A button should not change corner radius when adjustsCornerRadiusBasedOnFrame is NO");
    
    nonAdjustingButton.adjustsCornerRadiusBasedOnFrame = YES;
    nonAdjustingButton.frame = CGRectMake(0, 0, 80.0, 60.0);
    XCTAssertEqualWithAccuracy(nonAdjustingButton.cornerRadius, 60.0 * button.cornerRadiusRatioToSmallestSide, 1.0, @"Button corner radius should adjust on frame change after setting adjustsCornerRadiusOnFrame to YES.");

}

- (void)testDisabledButtonColor {
    
    RDMBorderedButton *button = [[RDMBorderedButton alloc] init];

    UIColor *normalColor = [button titleColorForState:UIControlStateNormal];
    UIColor *disabledColor = [button titleColorForState:UIControlStateDisabled];
    
    XCTAssertNotNil(normalColor, @"Button should have a titleColor for normal state.");
    XCTAssertNotNil(disabledColor, @"Button should have a titleColor for disabled state.");
    
    XCTAssertEqualObjects(button.currentTitleColor, normalColor, @"Button should have normal color when enabled.");
    XCTAssertEqualObjects([UIColor colorWithCGColor:button.layer.borderColor], normalColor, @"Button border should have normal color when enabled.");
    
    [button setEnabled:NO];
    XCTAssertEqualObjects(button.currentTitleColor, disabledColor, @"Button should have disabled color when disabled.");
    XCTAssertEqualObjects([UIColor colorWithCGColor:button.layer.borderColor], disabledColor, @"Button border should have disabled color when disabled.");
    
    [button setTitleColor:[UIColor redColor] forState:UIControlStateDisabled];
    XCTAssertEqualObjects(button.currentTitleColor, [UIColor redColor], @"Button should have new disabled color when disabled.");
    XCTAssertEqualObjects([UIColor colorWithCGColor:button.layer.borderColor], [UIColor redColor], @"Button border should have new disabled color when disabled.");
    
    [button setEnabled:YES];
    XCTAssertEqualObjects(button.currentTitleColor, normalColor, @"Button should have normal color after reenabling.");
    XCTAssertEqualObjects([UIColor colorWithCGColor:button.layer.borderColor], normalColor, @"Button border should have normal color after reenabling.");
}

-(void) testHighlightedButtonColor {
    
    RDMBorderedButton *button = [[RDMBorderedButton alloc] init];

    UIColor *normalColor = [button titleColorForState:UIControlStateNormal];
    UIColor *highlightedColor = [button titleColorForState:UIControlStateHighlighted];
    
    XCTAssertNotNil(normalColor, @"Button should have a titleColor for normal state.");
    XCTAssertNotNil(highlightedColor, @"Button should have a titleColor for highlighted state.");
    
    XCTAssertEqualObjects(button.currentTitleColor, normalColor, @"Button should have normal color when normal.");
    XCTAssertEqualObjects(button.backgroundColor, [UIColor clearColor], @"Button background should have clear color when not highlighted.");
    
    [button setHighlighted:YES];
    XCTAssertEqualObjects(button.currentTitleColor, highlightedColor, @"Button should have highlighted color when highlighted.");
    XCTAssertEqualObjects(button.backgroundColor, normalColor, @"Button background should have normal color when highlighted.");
    
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    XCTAssertEqualObjects([UIColor redColor], button.tintColor, @"Button tint color should change when adjusting normal state title color.");
    XCTAssertEqualObjects(button.backgroundColor, [UIColor redColor], @"Button background should have new highlighted color when highlighted.");
    
    button.tintColor = [UIColor blackColor];
    XCTAssertEqualObjects(button.backgroundColor, button.tintColor, @"Button background should have new highlighted color when tint color is changed.");
    
    [button setHighlighted:NO];
    XCTAssertEqualObjects(button.currentTitleColor, button.tintColor, @"Button should have tint color when unhighlighted.");
    XCTAssertEqualObjects(button.backgroundColor, [UIColor clearColor], @"Button background should have clear color when unhighlighted.");
    
}

@end
