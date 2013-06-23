//
//  FLAViewController.m
//  UISwitch
//
//  Created by Flavius Andrei on 6/24/13.
//  Copyright (c) 2013 Flavius Andrei. All rights reserved.
//

#import "FLAViewController.h"

@interface FLAViewController ()

@end

@implementation FLAViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.customSwitchValue.textColor = [UIColor whiteColor];
    self.customSwitchValue.textAlignment = NSTextAlignmentCenter;
    
    // Custom switch init
    CGRect switchContainer = CGRectMake(50, 200, 223, 105);
    
    self.customSwitch = [[FLACustomSwitch alloc] initWithFrame:switchContainer];
    self.customSwitch.backgroundColor = [UIColor clearColor];
    
    // Restore custom switch state from user defaults
    // Just to show the the button also works with user defaults :)
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [self.customSwitch setOn:[defaults boolForKey:kCustomSwitchKey]];
    [defaults synchronize];
    
    self.customSwitchValue.text = [NSString stringWithFormat:@"%@",
                                   ([self.customSwitch isOn]) ? @"ON" : @"OFF"];
    
    [self.view addSubview:self.customSwitch];
    
    // Adding constraints to the custom switch
    // Also just as a demo
    self.customSwitch.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *horizontalConstraint = [NSLayoutConstraint constraintWithItem:self.customSwitch
                                                                            attribute:NSLayoutAttributeCenterX
                                                                            relatedBy:NSLayoutRelationEqual
                                                                               toItem:self.view
                                                                            attribute:NSLayoutAttributeCenterX
                                                                           multiplier:1.0
                                                                             constant:0.0];
    NSLayoutConstraint *verticalConstraint = [NSLayoutConstraint constraintWithItem:self.customSwitch
                                                                          attribute:NSLayoutAttributeCenterY
                                                                          relatedBy:NSLayoutRelationEqual
                                                                             toItem:self.view
                                                                          attribute:NSLayoutAttributeCenterY
                                                                         multiplier:1.0
                                                                           constant:0.0];
    NSLayoutConstraint *widthConstraint = [NSLayoutConstraint constraintWithItem:self.customSwitch
                                                                       attribute:NSLayoutAttributeWidth
                                                                       relatedBy:NSLayoutRelationEqual
                                                                          toItem:nil
                                                                       attribute:NSLayoutAttributeNotAnAttribute
                                                                      multiplier:1.0
                                                                        constant:switchContainer.size.width];
    NSLayoutConstraint *heightConstraint = [NSLayoutConstraint constraintWithItem:self.customSwitch
                                                                        attribute:NSLayoutAttributeHeight
                                                                        relatedBy:NSLayoutRelationEqual
                                                                           toItem:nil
                                                                        attribute:NSLayoutAttributeNotAnAttribute
                                                                       multiplier:1.0
                                                                         constant:switchContainer.size.height];
    [self.view addConstraint:horizontalConstraint];
    [self.view addConstraint:verticalConstraint];
    [self.view addConstraint:widthConstraint];
    [self.view addConstraint:heightConstraint];
    
    // Add the action method
    [self.customSwitch addTarget:self action:@selector(switch:)
                forControlEvents:UIControlEventValueChanged];
}

- (IBAction)switch:(FLACustomSwitch *)sender
{
    self.customSwitchValue.text = [NSString stringWithFormat:@"%@",
                                   (sender.on == YES) ? @"ON" : @"OFF"];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setBool:sender.on forKey:kCustomSwitchKey];
    [defaults synchronize];
}

@end
