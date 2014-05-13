//
//  YEAppDelegate.h
//  Picnic
//
//  Created by Yuraima Estevez on 5/12/14.
//  Copyright (c) 2014 com.yestevez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface YEAppDelegate : UIResponder <UIApplicationDelegate, PFLogInViewControllerDelegate,PFSignUpViewControllerDelegate>

@property (strong, nonatomic) UIWindow *window;

@end
