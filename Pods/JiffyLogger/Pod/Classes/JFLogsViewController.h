//
//  JFLogsScreenViewController.h
//  JiffyLogger
//
//  Created by Julietta Yaunches on 9/11/15.
//  Copyright © 2015 jyaunches. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JFFileLogger;

@interface JFLogsViewController : UIViewController
@property(nonatomic, strong) UITextView *textScrollView;
@property(nonatomic, strong) JFFileLogger<JFLogExportProtocol> *logger;
- (void)showActionOptions;
- (id)initWithLogger:(JFFileLogger <JFLogExportProtocol> *)logger;
- (void)reloadData;
@end
