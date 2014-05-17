//
//  YEHandler.h
//  Picnic
//
//  Created by Yuraima Estevez on 5/16/14.
//  Copyright (c) 2014 com.yestevez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>
#import "YEEvent.h"

@interface YEHandler : NSObject

@property (strong, nonatomic) YEEvent *event;

-(id)init;
- (void) pushEvent;

@end
