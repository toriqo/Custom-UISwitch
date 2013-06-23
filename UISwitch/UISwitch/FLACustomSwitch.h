//
//  FLACustomSwitch.h
//  custom switch
//
//  Created by Flavius Andrei on 6/23/13.
//  Copyright (c) 2013 Flavius Andrei. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "FLAAppDelegate.h"

@interface FLACustomSwitch : UIControl  {
    UIImageView *nob, *onNob, *onBg, *offBg, *offNob;
    UISwipeGestureRecognizer *swipeToLeft, *swipeToRight;
    UITapGestureRecognizer *tap;
}

@property(nonatomic, readwrite, assign, getter = isOn, setter = setOn:) BOOL on;

- (void)initCommon;

@end
