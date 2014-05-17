//
//  YEViewController.h
//  Picnic
//
//  Created by Yuraima Estevez on 5/12/14.
//  Copyright (c) 2014 com.yestevez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import <FacebookSDK/FacebookSDK.h>

#import "YELoginViewController.h"
#import "YEEvent.h"

@interface YEViewController : UIViewController <PFLogInViewControllerDelegate, PFSignUpViewControllerDelegate>

@property (strong, nonatomic) YELoginViewController *loginViewController;
@property (strong, nonatomic) PFUser *user;

@end
