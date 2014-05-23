//
//  YEHandler.h
//  Picnic
//
//  Created by Yuraima Estevez on 5/16/14.
//  Copyright (c) 2014 com.yestevez. All rights reserved.
//
//  Abstract:Handles all communications with Parse

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>
#import "YEEvent.h"

@interface YEHandler : NSObject

@property (strong, nonatomic) PFUser *user;
@property (strong, nonatomic) YEEvent *event;

- (id)init;

- (void) pushEvent;

- (void) addGuestsWithArray: (NSArray *) guests;

- (void) addItemsWithArray: (NSArray *) items;

- (void) setEventOwner;

@end
