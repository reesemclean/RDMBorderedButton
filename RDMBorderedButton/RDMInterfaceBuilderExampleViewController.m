//
//  RDMInterfaceBuilderExampleViewController.m
//  RDMBorderedButton
//
//  Created by Reese McLean on 6/14/14.
//  Copyright (c) 2014 Reese McLean. All rights reserved.
//

#import "RDMInterfaceBuilderExampleViewController.h"

@interface RDMInterfaceBuilderExampleViewController ()

- (IBAction)showAlertButtonPushed:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *toggleRedButtonButton;
- (IBAction)toggleRedButtonPushed:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *redButton;

@end

@implementation RDMInterfaceBuilderExampleViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showAlertButtonPushed:(id)sender {
    
    [self.toggleRedButtonButton setTitleColor:[UIColor grayColor] forState:UIControlStateDisabled];
    
    NSString *title = @"Alert!";
    NSString *message = @"Notice that the button borders desaturate as they should.";
    NSString *buttonTitle = @"Nice!";
    
    if ([UIAlertController class]) {
        
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:buttonTitle style:UIAlertActionStyleDefault handler:nil];
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
        [alertController addAction:okAction];
        
        [self presentViewController:alertController animated:YES completion:nil];
        
    } else {
        
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle: title
                                                            message:message
                                                           delegate:nil
                                                  cancelButtonTitle:nil
                                                  otherButtonTitles:buttonTitle, nil];
        [alertView show];
        
    }
    
}
- (IBAction)toggleRedButtonPushed:(id)sender {
    
    if (self.redButton.enabled) {
        self.redButton.enabled = NO;
        [self.toggleRedButtonButton setTitle:@"Enable Red Button" forState:UIControlStateNormal];
    } else {
        self.redButton.enabled = YES;
        [self.toggleRedButtonButton setTitle:@"Disable Red Button" forState:UIControlStateNormal];
    }
    
}

@end
