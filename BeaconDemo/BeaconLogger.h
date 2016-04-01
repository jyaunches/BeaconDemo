//
//  BeaconLogger.h
//  BeaconDemo
//
//  Created by Julietta Yaunches on 4/1/16.
//  Copyright © 2016 julie.yaunches. All rights reserved.
//

#import "JiffyLogger/JFFileLogger.h"
#import "JiffyLogger/JFLogExportProtocol.h"
#import "JiffyLogger/JFLogsViewController.h"

@interface BeaconLogger : JFFileLogger<JFLogExportProtocol>
- (void)logMe:(NSString *)baseLog;
@end
