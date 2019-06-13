//
//  SAChangePwdView.m
//  ShouAn
//
//  Created by 李凯 on 2019/6/12.
//  Copyright © 2019 LK. All rights reserved.
//

#import "SAChangePwdView.h"
#import "SATextFieldCell.h"

static NSString *changePwdCellID = @"changePwdCell";

@implementation SAChangePwdView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self.tableView registerClass:[SATextFieldCell class] forCellReuseIdentifier:changePwdCellID];
    }
    return self;
}

- (void)setDataSource:(NSArray *)dataSource {
    [super setDataSource:dataSource];
    
    [self.tableView reloadData];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SATextFieldCell *changePwdCell = [tableView dequeueReusableCellWithIdentifier:changePwdCellID forIndexPath:indexPath];
    changePwdCell.titleLabel.text = self.dataSource[indexPath.row];
    changePwdCell.selectionStyle = UITableViewCellSelectionStyleNone;
    return changePwdCell;
}

@end
