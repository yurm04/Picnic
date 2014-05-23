//
//  YEHomeViewController.m
//  Picnic
//
//  Created by Yuraima Estevez on 5/13/14.
//  Copyright (c) 2014 com.yestevez. All rights reserved.
//

#import "YEHomeViewController.h"

@interface YEHomeViewController ()

@end

@implementation YEHomeViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
}

-(void)viewDidAppear:(BOOL)animated
{
    if ([PFUser currentUser]) {
        NSLog(@"user already logged in");
        UIAlertView *loggedIn = [[UIAlertView alloc]initWithTitle:@"Logged In" message:@"Successfully Logged In" delegate:self cancelButtonTitle:@"Log out" otherButtonTitles:nil, nil];
        [loggedIn show];
        [PFUser logOut];
    }
    
    // Log In view if no user is logged in
    if (![PFUser currentUser]) {
        YELoginViewController *logInView = [[YELoginViewController alloc]init];
        logInView.delegate = self;
        logInView.fields = PFLogInFieldsFacebook;
        [self presentViewController:logInView animated:YES completion:nil];
    }
}

#pragma mark - PFLoginviewController Delegate Mehtods

-(void)logInViewController:(PFLogInViewController *)logInController didLogInUser:(PFUser *)user
{
    // If the current user has just signed up with Facebook, their Facebook ID will be saved
    if ([PFUser currentUser].isNew) {
        NSLog(@"New User");
        [FBRequestConnection startForMeWithCompletionHandler:^(FBRequestConnection *connection, id result, NSError *error) {
            if (!error){
                // Get Facebook ID
                NSString *facebookID = [result objectForKey:@"id"];
                [[PFUser currentUser] setObject:facebookID forKey:@"facebookID"];
                
                // Get Profile picture URL
                NSString *profilePicURL = [NSString stringWithFormat:@"https://graph.facebook.com/%@/picture?type=large&return_ssl_resources=1", facebookID];
                [[PFUser currentUser] setObject:profilePicURL forKey:@"profilePictureURL"];
                
                // Save User
                [[PFUser currentUser] saveEventually];
            }
        }];
    }

    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)logInViewController:(PFLogInViewController *)logInController didFailToLogInWithError:(NSError *)error
{
    [self dismissViewControllerAnimated:YES completion:^{
        NSLog(@"Failed to log in user");
    }];
}

-(void)logInViewControllerDidCancelLogIn:(PFLogInViewController *)logInController
{
    [self dismissViewControllerAnimated:YES completion:^{
        NSLog(@"User cancelled log in");
    }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
 
 - (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
 {
 self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
 if (self) {
 // Custom initialization
 }
 return self;
 }
 
 - (void)didReceiveMemoryWarning
 {
 [super didReceiveMemoryWarning];
 // Dispose of any resources that can be recreated.
 }
 
*/

@end
