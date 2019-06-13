//
//  SAStudentInfoView.m
//  ShouAn
//
//  Created by 李凯 on 2019/6/11.
//  Copyright © 2019 LK. All rights reserved.
//

#import "SAStudentInfoView.h"
#import "SATextFieldCell.h"

static NSString *infoCellID = @"infoCell";

@interface SAStudentInfoView ()

@end

@implementation SAStudentInfoView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self.tableView registerClass:[SATextFieldCell class] forCellReuseIdentifier:infoCellID];
    }
    return self;
}

- (void)setDataSource:(NSArray *)dataSource {
    [super setDataSource:dataSource];
    
    [self.tableView reloadData];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SATextFieldCell *infoCell = [tableView dequeueReusableCellWithIdentifier:infoCellID forIndexPath:indexPath];
    infoCell.titleLabel.text = self.dataSource[indexPath.row];
    infoCell.selectionStyle = UITableViewCellSelectionStyleNone;
    return infoCell;
}

@end
