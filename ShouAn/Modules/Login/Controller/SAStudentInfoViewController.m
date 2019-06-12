//
//  SAStudentInfoViewController.m
//  ShouAn
//
//  Created by 李凯 on 2019/6/11.
//  Copyright © 2019 LK. All rights reserved.
//

#import "SAStudentInfoViewController.h"
#import "SAStudentInfoView.h"

@interface SAStudentInfoViewController ()

@property (nonatomic, strong) SAStudentInfoView *studentInfoView;

@property (nonatomic, copy) NSArray *studentInfoArray;

@end

@implementation SAStudentInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initValues];
    [self initSubviews];
}

- (void)initValues {
    self.title = @"学生信息";
}

- (void)initSubviews {
    [self.view addSubview:self.studentInfoView];
    self.studentInfoView.confirmButtonClickedBlock = ^{
        NSLog(@"点击了确认按钮");
    };
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    [self.studentInfoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

#pragma mark - lazy loading

- (SAStudentInfoView *)studentInfoView {
    if (!_studentInfoView) {
        _studentInfoView = [[SAStudentInfoView alloc]init];
        _studentInfoView.dataSource = self.studentInfoArray;
    }
    return _studentInfoView;
}

- (NSArray *)studentInfoArray {
    if (!_studentInfoArray) {
        _studentInfoArray = @[@"学生姓名:", @"学生学号:", @"学生性别:", @"学生班级:", @"您的姓名:", @"您的电话:", @"与学生关系:", @"第二联系人:", @"与学生关系:", @"第二联系电话:"];
    }
    return _studentInfoArray;
}

@end
