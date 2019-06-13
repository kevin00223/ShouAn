//
//  SASettingView.m
//  ShouAn
//
//  Created by 李凯 on 2019/6/12.
//  Copyright © 2019 LK. All rights reserved.
//

#import "SASettingView.h"
#import "SABaseCell.h"

static NSString *settingCellID = @"settingCell";

@implementation SASettingView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self.tableView registerClass:[SABaseCell class] forCellReuseIdentifier:settingCellID];
    }
    return self;
}

- (void)setDataSource:(NSArray *)dataSource {
    [super setDataSource:dataSource];
    
    [self.tableView reloadData];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SABaseCell *settingCell = [tableView dequeueReusableCellWithIdentifier:settingCellID forIndexPath:indexPath];
    settingCell.titleLabel.text = self.dataSource[indexPath.row];
    settingCell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return settingCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.row == 0) {
        self.cellSelectedBlock();
    }
}

@end
