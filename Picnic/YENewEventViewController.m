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
    YEHandler *handler = [[YEHandler alloc]init];
    handler.event.name = self.eventNameField.text;
    handler.event.guestList = @[@"Me",@"Kara",@"Drue",@"Jason",@"Rachel"];
    handler.event.eventList = @[@"Beer",@"Cheese",@"Wine",@"Chips",@"Tequila"];
    handler.event.startDate = [NSDate date];
    handler.event.endDate = [NSDate date];
    
    [handler pushEvent];
}

//- (void) handleEvent
//{
//    self.handler.event.name = self.eventNameField.text;
//}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.eventNameField.delegate = self;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)textFieldDidEndEditing:(UITextField *)textField{
    [textField resignFirstResponder];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
