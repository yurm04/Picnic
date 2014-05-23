//
//  YEEvent.m
//  Picnic
//
//  Created by Yuraima Estevez on 5/16/14.
//  Copyright (c) 2014 com.yestevez. All rights reserved.
//

#import "YEEvent.h"
#import <Parse/PFObject+Subclass.h>

@implementation YEEvent

// Dynamic for Parse
@dynamic name;
@dynamic startDate;
@dynamic endDate;
@dynamic guestList;
@dynamic eventList;

// Required Parse class method
+ (NSString *)parseClassName {
    return @"Event";
}





@end
