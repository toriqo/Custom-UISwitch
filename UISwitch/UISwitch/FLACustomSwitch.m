//
//  FLACustomSwitch.m
//  custom switch
//
//  Created by Flavius Andrei on 6/23/13.
//  Copyright (c) 2013 Flavius Andrei. All rights reserved.
//

#import "FLACustomSwitch.h"

@interface FLACustomSwitch ()
    - (void)addGestures;
@end

@implementation FLACustomSwitch

#pragma mark -
#pragma mark init methods

- (void)initCommon
{
    // ON (blue) background for the switch
    CGRect onBgRect = CGRectMake(0, 0, 200, 106);
    onBg = [[UIImageView alloc] initWithFrame:onBgRect];
    onBg.image = [UIImage imageNamed:@"onBg@2"];
    [self addSubview:onBg];
    
    // OFF (red) background for the switch
    CGRect offBgRect = CGRectMake(23, 0, 200, 106);
    offBg = [[UIImageView alloc] initWithFrame:offBgRect];
    offBg.image = [UIImage imageNamed:@"offBg@2"];
    [self addSubview:offBg];
    
    // Initialize the switch
    if ([self isOn]) {
        onBg.alpha = 1.0;
        offBg.alpha = 0.0;
        nob = [[UIImageView alloc] initWithFrame:CGRectMake(72, 28, 127, 68)];
        nob.image = [UIImage imageNamed:@"onNob@2"];
    } else {
        offBg.alpha = 1.0;
        onBg.alpha = 0.0;
        nob = [[UIImageView alloc] initWithFrame:CGRectMake(24, 28, 127, 68)];
        nob.image = [UIImage imageNamed:@"offNob@2"];
    }
    
    [self addSubview:nob];
    [self addGestures];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        [self initCommon];
    }
    
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initCommon];
    }
    
    return self;
}

#pragma mark -
#pragma mark Gesture methods

- (void)addGestures
{
    // Added two swipe gestures so the switch won't react to right swipe when it's already on the right and viceversa
    swipeToLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self
                                                 action:@selector(swipe:)];
    swipeToRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self
                                                            action:@selector(swipe:)];
    
    [swipeToLeft setDirection:UISwipeGestureRecognizerDirectionLeft];
    [swipeToRight setDirection:UISwipeGestureRecognizerDirectionRight];
    
    // Respond to tap
    tap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                  action:@selector(tap:)];
    tap.numberOfTapsRequired = 1;
    
    [self addGestureRecognizer:swipeToLeft];
    [self addGestureRecognizer:swipeToRight];
    [self addGestureRecognizer:tap];
}

- (void)swipe:(UISwipeGestureRecognizer *)swipeGesture
{
    [UIView animateWithDuration:0.25
                     animations:^{
                         if (onBg.alpha == 1.0 && [self isOn]) {
                             if (swipeGesture.direction == UISwipeGestureRecognizerDirectionLeft) {
                                 offBg.alpha = 1.0;
                                 onBg.alpha = 0.0;
                                 [nob setCenter:CGPointMake(87, 62)];
                                 nob.image = [UIImage imageNamed:@"offNob@2"];
                             }
                         } else {
                             if (swipeGesture.direction == UISwipeGestureRecognizerDirectionRight) {
                                 onBg.alpha = 1.0;
                                 offBg.alpha = 0.0;
                                 [nob setCenter:CGPointMake(136, 62)];
                                 nob.image = [UIImage imageNamed:@"onNob@2"];
                             }
                         }
                     }
                     completion:^(BOOL finished) {
                         [self sendActionsForControlEvents:UIControlEventValueChanged];
                         [self sendActionsForControlEvents:UIControlEventTouchUpInside];
                     }];
}

- (void)tap:(UITapGestureRecognizer *)tap
{
    [UIView animateWithDuration:0.25
                     animations:^{
                         if (onBg.alpha == 1.0 && [self isOn]) {
                             offBg.alpha = 1.0;
                             onBg.alpha = 0.0;
                             [nob setCenter:CGPointMake(87, 62)];
                             nob.image = [UIImage imageNamed:@"offNob@2"];
                         } else {
                             onBg.alpha = 1.0;
                             offBg.alpha = 0.0;
                             [nob setCenter:CGPointMake(136, 62)];
                             nob.image = [UIImage imageNamed:@"onNob@2"];
                         }
                     }
                     completion:^(BOOL finished) {
                         [self sendActionsForControlEvents:UIControlEventValueChanged];
                         [self sendActionsForControlEvents:UIControlEventTouchDragInside];
                     }];
}

#pragma mark -
#pragma mark Touch tracking methods for the Switch

- (BOOL)beginTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event
{
    self.highlighted = YES;
	[self sendActionsForControlEvents:UIControlEventTouchDown];
    
	return YES;
}

- (BOOL)continueTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event
{
    if (nob.center.x < onBg.center.x) {
        [self setOn:NO];
    } else {
        [self setOn:YES];
    }
    
	[self sendActionsForControlEvents:UIControlEventTouchDragInside];
    
	return YES;
}

- (void)endTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event
{
    [self finishedEvent];
}

- (void)cancelTrackingWithEvent:(UIEvent *)event
{
    [self finishedEvent];
}

- (void)finishedEvent
{
    self.highlighted = NO;
    if (nob.center.x < onBg.center.x) {
        [self setOn:NO];
    } else {
        [self setOn:YES];
    }
}

#pragma mark -
#pragma mark Switch draw

- (void)drawRect:(CGRect)rect
{
    if ([self isOn]) {
        onBg.alpha = 1.0;
        offBg.alpha = 0.0;
        [nob setCenter:CGPointMake(136, 62)];
        nob.image = [UIImage imageNamed:@"onNob@2"];
    } else {
        offBg.alpha = 1.0;
        onBg.alpha = 0.0;
        [nob setCenter:CGPointMake(87, 62)];
        nob.image = [UIImage imageNamed:@"offNob@2"];
    }
}

@end
