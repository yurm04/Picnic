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
        self.event = [YEEvent object];
    }
    return self;
}
-(void)pushEvent
{
    [self.event saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error) {
            NSLog(@"save successful");
        }
    }];
}

-(YEEvent *)event
{
    if (!_event) {
        _event = [YEEvent object];
    }
    return _event;
}

@end
