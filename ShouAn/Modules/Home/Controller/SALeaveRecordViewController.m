//
//  SALeaveRecordViewController.m
//  ShouAn
//
//  Created by 李凯 on 2019/6/15.
//  Copyright © 2019 LK. All rights reserved.
//

#import "SALeaveRecordViewController.h"
#import "SALeaveRecordCell.h"
#import "SALeaveRecordModel.h"

static NSString *leaveRecordCellID = @"leaveRecordCell";

@interface SALeaveRecordViewController ()

@end

@implementation SALeaveRecordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initValues];
}

- (void)initValues {
    self.title = @"请假记录";
    [self.tableView registerClass:[SALeaveRecordCell class] forCellReuseIdentifier: leaveRecordCellID];
    self.dataSource = [SALeaveRecordModel leaveRecordModelWithDict:@{
                                                                     @"month" : @"5",
                                                                     @"day" : @"20",
                                                                     @"name" : @"王月月",
                                                                     @"leaveType" : @"事假",
                                                                     @"startTime" : @"2019-05-20  08:00",
                                                                     @"endTime" : @"2019-05-20  18:00"
                                                                     }];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SALeaveRecordCell *leaveRecordCell = [tableView dequeueReusableCellWithIdentifier:leaveRecordCellID forIndexPath:indexPath];
    leaveRecordCell.leaveRecordModel = self.dataSource[indexPath.row];
    leaveRecordCell.selectionStyle = UITableViewCellSelectionStyleNone;
    return leaveRecordCell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 190;
}

@end
