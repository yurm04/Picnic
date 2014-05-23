//
//  YEHandler.m
//  Picnic
//
//  Created by Yuraima Estevez on 5/16/14.
//  Copyright (c) 2014 com.yestevez. All rights reserved.
//

#import "YEHandler.h"

@implementation YEHandler

-(id)init
{
    if (self) {
        self = [super init];
        
        // Instantiate event object
        self.event = [YEEvent object];
    }
    return self;
}

// Push event to Parse
-(void)pushEvent
{
    // Setting owner of the given event to the current user
    [self.event saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error) {
            NSLog(@"save successful");
        } else {
            NSLog(@"something happened");
        }
    }];
}

// Add Guests and Items
- (void)addGuestsWithArray:(NSArray *)guests
{
    self.event.guestList = [NSArray arrayWithArray:guests];
    // Consider for-loop to iterate and set each guest with relationship "guest"
}

-(void)addItemsWithArray:(NSArray *)items
{
    self.event.eventList = [NSArray arrayWithArray:items];
}

-(void)setEventOwner
{
    // Creating owner ACL and Role
    PFRole *owner  = [PFRole roleWithName:@"Owner"];
    PFACL *eventACL = [PFACL ACL];
    [eventACL setWriteAccess:YES forRole:owner];
    self.event.ACL = eventACL;
    [self.event setObject:self.user forKey:@"owner"];
}

// Current User
- (PFUser *) user
{
    if (!_user) {
        _user = [PFUser currentUser];
    }
    return _user;
}






@end
