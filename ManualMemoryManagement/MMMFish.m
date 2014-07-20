//
//  MMMFish.m
//  ManualMemoryManagement
//
//  Created by Sean Wolter on 7/18/14.
//  Copyright (c) 2014 VOKAL. All rights reserved.
//

#import "MMMFish.h"

@interface MMMFish ()
@property (nonatomic, readwrite, assign) NSString *name;
@property (nonatomic, retain) NSArray *garbageData;
@end

@implementation MMMFish

+ (instancetype)fish
{
    //Why autorelease this? What do we expect from convenience constructor methods like this?
    id fish = [[[self alloc] init] autorelease];
    return fish;
}

- (NSNumber *)countFromGarbageData
{
    return @([self.garbageData count]);
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _name = [self randomName]; //Should we do anything with this string?
        _garbageData = [@[[NSDate date],
                          [NSDate date],
                          [NSDate date],
                          [NSDate date],
                          [NSDate date],
                          [NSDate date],
                          [NSDate date],
                          [NSDate date],
                          [NSDate date],
                          [NSDate date],
                          [NSDate date],
                          [NSDate date],
                          [NSDate date],
                          [NSDate date],
                          ] retain]; //Why retain this array? What does @[] return?
        [self retain];
    }
    return self;
}

- (NSString *)randomName
{
    NSArray *nameArray = @[@"Bill",
                           @"Frank",
                           @"Linda",
                           @"Mopey",
                           @"Grungar",
                           @"Elvis",
                           @"Peter",
                           @"Treeper",
                           @"Potato",
                           @"Austin",
                           @"Bananaman",
                           @"You",
                           @"Me",
                           ];
    //Is the nameArray being released correctly?
    NSString *randomString = nameArray[arc4random_uniform((int)[nameArray count])];
    return randomString;
}

- (void)dealloc
{
    NSLog(@"DEALLOCATING THIS OBJECT");
    //What's missing here and why doesn't it matter?
    [_garbageData release];
    [super dealloc];
}

@end
