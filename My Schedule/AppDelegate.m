//
//  AppDelegate.m
//  Mitt Schema
//
//  Created by Team SEA: Amelie Sjöstrand Gereholt, Ashraf Jibrael, Emma Boquist,
//  Jens Hagfeldt, Joanna Hemmingsson, Kristoffer Bergkvist. All rights reserved.
//

#import "AppDelegate.h"

#import "MasterViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    MasterViewController *masterViewController = [[MasterViewController alloc] initWithNibName:@"MasterViewController"
                                                                                        bundle:nil];
    self.navigationController = [[UINavigationController alloc] initWithRootViewController:masterViewController];
    self.window.rootViewController = self.navigationController;
    [self.window makeKeyAndVisible];
    
    self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:0.267
                                                                        green:0.506
                                                                         blue:0.486
                                                                        alpha:1];
    
    return YES;
}


@end