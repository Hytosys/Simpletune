//
//  STAppDelegate.m
//  Simpletune
//
//  Created by Skyler on 2/7/13.
//  Copyright (c) 2013 Skyler. All rights reserved.
//

#import "STAppDelegate.h"
#import "STViewController.h"

@implementation STAppDelegate

- (void)dealloc {
  [_window release];
  [_viewController release];
  [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
  self.viewController = [[[STViewController alloc] initWithNibName:@"STViewController" bundle:nil] autorelease];
  self.window.rootViewController = self.viewController;
  [self.window makeKeyAndVisible];
  
  return YES;
}

@end
