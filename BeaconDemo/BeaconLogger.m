//
//  BeaconLogger.m
//  BeaconDemo
//
//  Created by Julietta Yaunches on 4/1/16.
//  Copyright © 2016 julie.yaunches. All rights reserved.
//

#import "BeaconLogger.h"

@implementation BeaconLogger
+ (BeaconLogger *)shared {
    static BeaconLogger *logger = nil;
    if (!logger) {
        logger = [[BeaconLogger alloc] initWithTimestamps:YES];
    }
    return logger;
}

- (void)logMe:(NSString *)baseLog{
    [super log:baseLog];
}

- (NSString *)exportFilename {
    return @"beacon-field-log";
}

- (NSString *)subject {
    return @"Beacon Field Log";
}

- (NSString *)logDestinationEmail {
    return @"jmyaunch@gmail.com";
}

- (NSString *)messageBody {
    return @"Here are some field logs.";    
}

@end
