//
//  SAExamSearchViewController.m
//  ShouAn
//
//  Created by 李凯 on 2019/6/15.
//  Copyright © 2019 LK. All rights reserved.
//

#import "SAExamSearchViewController.h"
#import "SAExamSearchCell.h"

static NSString *examSearchCellID = @"examSearchCell";

@interface SAExamSearchViewController ()

@end

@implementation SAExamSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initValues];
}

- (void)initValues {
    self.title = @"考试查询";
    [self.tableView registerClass:[SAExamSearchCell class] forCellReuseIdentifier:examSearchCellID];
    self.dataSource = @[@"第一次月考", @"第三次月考", @"期中考试", @"期末考试"];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SAExamSearchCell *examSearchCell = [tableView dequeueReusableCellWithIdentifier:examSearchCellID forIndexPath:indexPath];
    examSearchCell.titleText = self.dataSource[indexPath.row];
    examSearchCell.selectionStyle = UITableViewCellSelectionStyleNone;
    return examSearchCell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 90;
}

@end
