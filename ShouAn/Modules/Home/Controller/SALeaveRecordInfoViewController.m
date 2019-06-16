//
//  SALeaveRecordInfoViewController.m
//  ShouAn
//
//  Created by 李凯 on 2019/6/15.
//  Copyright © 2019 LK. All rights reserved.
//

#import "SALeaveRecordInfoViewController.h"

@interface SALeaveRecordInfoViewController ()

@end

@implementation SALeaveRecordInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initValues];
}

- (void)initValues {
    self.title = @"学生请假";
    self.tableView.tableFooterView = [UIView new];
}

@end
