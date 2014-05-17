//
//  YENewEventViewController.h
//  Picnic
//
//  Created by Yuraima Estevez on 5/17/14.
//  Copyright (c) 2014 com.yestevez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YEEvent.h"
#import "YEHandler.h"
#import <Parse/Parse.h>

@interface YENewEventViewController : UIViewController <UITextFieldDelegate>

//@property (strong, nonatomic) YEHandler *handler;

// UI properties
@property (weak, nonatomic) IBOutlet UITextField *eventNameField;

- (IBAction)saveButtonHandler:(id)sender;

//- (void) handleEvent;
@end
