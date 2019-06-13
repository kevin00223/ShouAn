//
//  SANoticeViewController.m
//  ShouAn
//
//  Created by 李凯 on 2019/6/13.
//  Copyright © 2019 LK. All rights reserved.
//

#import "SANoticeViewController.h"

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
//    [self.tableView registerClass:[SAMessageCell class] forCellReuseIdentifier:messageCellID];
//    self.dataSource = [SAMessageModel messageModelWithPlistName:@"Message.plist"];
}

//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    SAMessageCell *messageCell = [tableView dequeueReusableCellWithIdentifier:messageCellID forIndexPath:indexPath];
//    messageCell.messageModel = self.dataSource[indexPath.row];
//    messageCell.selectionStyle = UITableViewCellSelectionStyleNone;
//    return messageCell;
//}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 240;
}

@end
