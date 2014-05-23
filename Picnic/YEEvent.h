//
//  YEEvent.h
//  Picnic
//
//  Created by Yuraima Estevez on 5/16/14.
//  Copyright (c) 2014 com.yestevez. All rights reserved.
//
//  Abstract:

#import <Parse/Parse.h>

@interface YEEvent : PFObject <PFSubclassing>

+ (NSString *)parseClassName;

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSDate *startDate;
@property (strong, nonatomic) NSDate *endDate;

@property (strong, nonatomic) NSArray *guestList;
@property (strong, nonatomic) NSArray *eventList;



@end
