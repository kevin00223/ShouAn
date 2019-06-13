//
//  SAMessageViewController.m
//  ShouAn
//
//  Created by 李凯 on 2019/6/11.
//  Copyright © 2019 LK. All rights reserved.
//

#import "SAMessageViewController.h"
#import "SAMessageCell.h"
#import "SAMessageModel.h"

static NSString *messageCellID = @"messageCellID";

@implementation SAMessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initValues];
}

- (void)initValues {
    self.title = @"消息";
    [self.tableView registerClass:[SAMessageCell class] forCellReuseIdentifier:messageCellID];
    self.dataSource = [SAMessageModel messageModelWithPlistName:@"Message.plist"];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SAMessageCell *messageCell = [tableView dequeueReusableCellWithIdentifier:messageCellID forIndexPath:indexPath];
    messageCell.messageModel = self.dataSource[indexPath.row];
    messageCell.selectionStyle = UITableViewCellSelectionStyleNone;
    return messageCell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 130;
}

@end
