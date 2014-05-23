//
//  YENewEventViewController.m
//  Picnic
//
//  Created by Yuraima Estevez on 5/17/14.
//  Copyright (c) 2014 com.yestevez. All rights reserved.
//

#import "YENewEventViewController.h"

@interface YENewEventViewController ()

@end

@implementation YENewEventViewController

- (IBAction)saveButtonHandler:(id)sender {
    [self validateEventForm];
}

-(void)validateEventForm
{
    if (![self.eventNameField text]) {
        // Form denied, highlight fields
        NSLog(@"Missing Fields");
    } else {
        [self handlePush];
    }
    
}

- (void) handlePush
{
    YEHandler *handler = [[YEHandler alloc]init];
    handler.event.name = self.eventNameField.text;
    handler.event.startDate = [NSDate date];
    handler.event.endDate = [NSDate date];
    [handler addGuestsWithArray:@[@"Me",@"Kara",@"Drue",@"Jason",@"Rachel"]];
    [handler addItemsWithArray:@[@"Beer",@"Cheese",@"Wine",@"Chips",@"Tequila"]];
    [handler setEventOwner];
    
    [handler pushEvent];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.eventNameField.delegate = self;
}

// Resigns keyboard
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 
 - (void)didReceiveMemoryWarning
 {
 [super didReceiveMemoryWarning];
 // Dispose of any resources that can be recreated.
 }
 
 */

@end
