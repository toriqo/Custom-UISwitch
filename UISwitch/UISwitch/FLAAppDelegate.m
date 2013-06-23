//
//  FLAAppDelegate.m
//  UISwitch
//
//  Created by Flavius Andrei on 6/24/13.
//  Copyright (c) 2013 Flavius Andrei. All rights reserved.
//

#import "FLAAppDelegate.h"

#import "FLAViewController.h"

@implementation FLAAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    // Set the defaults for the Settings Bundle (Settings > Custom Switch
    
    NSDictionary *appDefaults = @{kCustomSwitchKey: @YES};
    [[NSUserDefaults standardUserDefaults] registerDefaults:appDefaults];
    
    self.viewController = [[FLAViewController alloc] initWithNibName:@"FLAViewController" bundle:nil];
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Used twice for ios7 DP which doesn't reflect the change otherwise (if the setting is changed in Settings > Custom Switch)
    // Usually only having the syncronize only once here would be enough
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    self.viewController.customSwitch.on = [defaults boolForKey:kCustomSwitchKey];
    self.viewController.customSwitchValue.text = [NSString stringWithFormat:@"%@",
                                                  ([defaults boolForKey:kCustomSwitchKey]) ? @"ON" : @"OFF"];
    [defaults synchronize];
    
    [self.viewController.customSwitch setNeedsDisplay];
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Used twice for ios7 DP which doesn't reflect the change otherwise (if the setting is changed in Settings > Custom Switch)
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    self.viewController.customSwitch.on = [defaults boolForKey:kCustomSwitchKey];
    self.viewController.customSwitchValue.text = [NSString stringWithFormat:@"%@",
                                                  ([defaults boolForKey:kCustomSwitchKey]) ? @"ON" : @"OFF"];
    [defaults synchronize];
    
    [self.viewController.customSwitch setNeedsDisplay];
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
