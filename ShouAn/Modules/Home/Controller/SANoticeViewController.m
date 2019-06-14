//
//  SANoticeViewController.m
//  ShouAn
//
//  Created by 李凯 on 2019/6/13.
//  Copyright © 2019 LK. All rights reserved.
//

#import "SANoticeViewController.h"
#import "SANoticeCell.h"
#import "SANoticeModel.h"

static NSString *noticeCellID = @"noticeCellID";

@interface SANoticeViewController ()

@end

@implementation SANoticeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initValues];
}

- (void)initValues {
    self.title = @"公示公告";
    [self.tableView registerClass:[SANoticeCell class] forCellReuseIdentifier:noticeCellID];
    self.dataSource = [SANoticeModel noticeModelWithPlistName:@"Notice.plist"];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SANoticeCell *noticeCell = [tableView dequeueReusableCellWithIdentifier:noticeCellID forIndexPath:indexPath];
    noticeCell.noticeModel = self.dataSource[indexPath.row];
    noticeCell.selectionStyle = UITableViewCellSelectionStyleNone;
    return noticeCell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 240;
}

@end
