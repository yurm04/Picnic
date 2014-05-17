//
//  YEViewController.m
//  Picnic
//
//  Created by Yuraima Estevez on 5/12/14.
//  Copyright (c) 2014 com.yestevez. All rights reserved.
//

#import "YEViewController.h"

@interface YEViewController ()
- (void) presentLoginViewController;
@end

@implementation YEViewController

-(void)viewDidAppear:(BOOL)animated
{
    NSLog(@"View appeared");
    if (![PFUser currentUser]) {
        [self presentLoginViewController];
    }
    self.user = [PFUser currentUser];
    NSLog(@"%@", self.user.username);
    
    
}

-(void)presentLoginViewController
{
    self.loginViewController = [[YELoginViewController alloc]init];
    self.loginViewController.fields = PFLogInFieldsUsernameAndPassword | PFLogInFieldsSignUpButton | PFLogInFieldsLogInButton | PFLogInFieldsFacebook;
    self.loginViewController.delegate = self;
    self.loginViewController.signUpController.delegate = self;
    
    [self presentViewController:self.loginViewController animated:YES completion:nil];
}

-(void)logInViewController:(PFLogInViewController *)logInController didLogInUser:(PFUser *)user
{
    [self dismissViewControllerAnimated:YES completion:NULL];

}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
