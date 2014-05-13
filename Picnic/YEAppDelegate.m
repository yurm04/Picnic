//
//  YEAppDelegate.m
//  Picnic
//
//  Created by Yuraima Estevez on 5/12/14.
//  Copyright (c) 2014 com.yestevez. All rights reserved.
//

#import "YEAppDelegate.h"

@implementation YEAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    
    // Parse set up
    [Parse setApplicationId:@"ywj5Z2v5dQ5aF1mtFUbkeBMQXLc1s3fXm8UV61W9"
                  clientKey:@"zQv0oCGRdw4haLx3aTnjtVGTZlKLV6WaqPybtpbg"];
    [PFAnalytics trackAppOpenedWithLaunchOptions:launchOptions];
    [PFFacebookUtils initializeFacebook];
    
    if (![PFUser currentUser]) { // User not currently logged in
        // Create login view controller
        PFLogInViewController *loginViewController = [[PFLogInViewController alloc]init];
        loginViewController.delegate = self;
        loginViewController.fields = PFLogInFieldsFacebook;
        [self.window setRootViewController:loginViewController];
        [self.window.rootViewController presentViewController:loginViewController animated:YES completion:NULL];
    }
    
    return YES;
}

// Parse-Facebook Handlers
- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation {
    return [FBAppCall handleOpenURL:url
                  sourceApplication:sourceApplication
                        withSession:[PFFacebookUtils session]];
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    [FBAppCall handleDidBecomeActiveWithSession:[PFFacebookUtils session]];
}



/* Other Stuff */

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
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
