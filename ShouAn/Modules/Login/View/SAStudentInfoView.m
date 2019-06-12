//
//  SAStudentInfoView.m
//  ShouAn
//
//  Created by 李凯 on 2019/6/11.
//  Copyright © 2019 LK. All rights reserved.
//

#import "SAStudentInfoView.h"
#import "SAStudentInfoCell.h"

static NSString *infoCellID = @"infoCell";

@interface SAStudentInfoView () <UITableViewDataSource>

@property (nonatomic, copy) NSArray *studentInfoArray;

@end

@implementation SAStudentInfoView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.tableView.dataSource = self;
        [self.tableView registerClass:[SAStudentInfoCell class] forCellReuseIdentifier:infoCellID];
    }
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.studentInfoArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SAStudentInfoCell *infoCell = [tableView dequeueReusableCellWithIdentifier:infoCellID forIndexPath:indexPath];
    infoCell.titleLabel.text = self.studentInfoArray[indexPath.row];
    infoCell.selectionStyle = UITableViewCellSelectionStyleNone;
    return infoCell;
}

#pragma mark - lazy loading

- (NSArray *)studentInfoArray {
    if (!_studentInfoArray) {
        _studentInfoArray = @[@"学生姓名:", @"学生学号:", @"学生性别:", @"学生班级:", @"您的姓名:", @"您的电话:", @"与学生关系:", @"第二联系人:", @"与学生关系:", @"第二联系电话:"];
    }
    return _studentInfoArray;
}

@end
