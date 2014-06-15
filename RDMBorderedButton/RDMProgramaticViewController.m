//
//  RDMProgramaticViewController.m
//  RDMBorderedButton
//
//  Created by Reese McLean on 6/14/14.
//  Copyright (c) 2014 Reese McLean. All rights reserved.
//

#import "RDMProgramaticViewController.h"

#import "RDMBorderedButton.h"

@interface RDMProgramaticViewController ()

@property (nonatomic, strong) RDMBorderedButton *frameAdjustingButton;

@end

@implementation RDMProgramaticViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

#define firstFrame CGRectMake(20, 40, 280, 120)
#define secondFrame CGRectMake(20, 40, 100, 44)
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.frameAdjustingButton = [[RDMBorderedButton alloc] initWithFrame:firstFrame];
    [self.frameAdjustingButton setTitle:@"Tap Me"
                               forState:UIControlStateNormal];
    self.frameAdjustingButton.tintColor = [UIColor purpleColor];
    [self.frameAdjustingButton.titleLabel setFont:[UIFont systemFontOfSize:24.0]];
    [self.frameAdjustingButton addTarget:self action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.frameAdjustingButton];
}

-(void) buttonTapped:(id) sender {
    
    CGRect newFrame;
    
    newFrame = CGRectEqualToRect(self.frameAdjustingButton.frame, firstFrame) ? secondFrame : firstFrame;

    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"cornerRadius"];
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animation.fromValue = [NSNumber numberWithFloat:self.frameAdjustingButton.cornerRadius];
    animation.toValue = [NSNumber numberWithFloat:MIN(newFrame.size.height, newFrame.size.width) * self.frameAdjustingButton.cornerRadiusRatioToSmallestSide];
    animation.duration = .25;
    self.frameAdjustingButton.cornerRadius = MIN(newFrame.size.height, newFrame.size.width) * self.frameAdjustingButton.cornerRadiusRatioToSmallestSide;
    [self.frameAdjustingButton.layer addAnimation:animation forKey:@"cornerRadius"];
    
    [UIView animateWithDuration:.25
                     animations:^{
                         self.frameAdjustingButton.frame = newFrame;
                     }];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
