//
//  BeaconLoggerVC.m
//  BeaconDemo
//
//  Created by Julietta Yaunches on 4/1/16.
//  Copyright © 2016 julie.yaunches. All rights reserved.
//

#import "BeaconLoggerVC.h"
#import "BeaconLogger.h"

@interface BeaconLoggerVC ()

@end

@implementation BeaconLoggerVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.logger = [[BeaconLogger alloc] initWithTimestamps:YES];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
