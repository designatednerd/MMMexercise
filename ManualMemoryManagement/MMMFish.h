//
//  MMMFish.h
//  ManualMemoryManagement
//
//  Created by Sean Wolter on 7/18/14.
//  Copyright (c) 2014 VOKAL. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MMMFish : NSObject
@property (nonatomic, readonly) NSString *name;

+ (instancetype)fish;

- (NSNumber *)countFromGarbageData;

@end
