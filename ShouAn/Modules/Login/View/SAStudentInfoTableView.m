//
//  SAStudentInfoTableView.m
//  ShouAn
//
//  Created by 李凯 on 2019/6/11.
//  Copyright © 2019 LK. All rights reserved.
//

#import "SAStudentInfoTableView.h"
#import "SAStudentInfoCell.h"

static NSString *infoCellID = @"infoCell";

@interface SAStudentInfoTableView () <UITableViewDataSource>

@property (nonatomic, copy) NSArray *studentInfoArray;

@property (nonatomic, strong) UIView *footerView;

@property (nonatomic, strong) UIButton *confirmButton;

@end

@implementation SAStudentInfoTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.dataSource = self;
        [self registerClass:[SAStudentInfoCell class] forCellReuseIdentifier:infoCellID];
        [self initSubviews];
    }
    return self;
}

- (void)initSubviews {
    [self.footerView addSubview:self.confirmButton];
    self.tableFooterView = self.footerView;
    [self setSeparatorStyle:UITableViewCellSeparatorStyleNone];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self.confirmButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.footerView).offset(20);
        make.right.equalTo(self.footerView).offset(-20);
        make.height.offset(45);
        make.top.equalTo(self.footerView).offset(30);
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.studentInfoArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SAStudentInfoCell *infoCell = [tableView dequeueReusableCellWithIdentifier:infoCellID forIndexPath:indexPath];
    infoCell.titleLabel.text = self.studentInfoArray[indexPath.row];
    return infoCell;
}

#pragma mark - private method

- (void)confirmButtonClicked: (UIButton *)confirmButton {
    NSLog(@"confirmButtonClicked");
}

#pragma mark - lazy loading

- (NSArray *)studentInfoArray {
    if (!_studentInfoArray) {
        _studentInfoArray = @[@"学生姓名:", @"学生学号:", @"学生性别:", @"学生班级:", @"您的姓名:", @"您的电话:", @"与学生关系:", @"第二联系人:", @"与学生关系:", @"第二联系电话:"];
    }
    return _studentInfoArray;
}

- (UIView *)footerView {
    if (!_footerView) {
        _footerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 100)];
    }
    return _footerView;
}

- (UIButton *)confirmButton {
    if (!_confirmButton) {
        _confirmButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _confirmButton.layer.cornerRadius = 22.0;
        _confirmButton.layer.masksToBounds = YES;
        [_confirmButton setTitle:@"确认" forState:UIControlStateNormal];
        [_confirmButton setBackgroundColor:SAGreenColor];
        [_confirmButton addTarget:self action:@selector(confirmButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _confirmButton;
}

@end
