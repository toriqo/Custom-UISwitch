//
//  FLAViewController.h
//  UISwitch
//
//  Created by Flavius Andrei on 6/24/13.
//  Copyright (c) 2013 Flavius Andrei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FLACustomSwitch.h"

#define kCustomSwitchKey   @"customSwitch"

@interface FLAViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *customSwitchValue;

@property (strong, nonatomic) FLACustomSwitch *customSwitch;
- (IBAction)switch:(FLACustomSwitch *)sender;

@end
