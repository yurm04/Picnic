//
//  YECommunications.h
//  Picnic
//
//  Created by Yuraima Estevez on 5/13/14.
//  Copyright (c) 2014 com.yestevez. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol YECommunicationsDelegate <NSObject>
@optional
- (void) communicationsDidLogin:(BOOL)loggedIn;
@end

@interface Comms : NSObject
+ (void) login:(id<YECommunicationsDelegate>)delegate;
@end
