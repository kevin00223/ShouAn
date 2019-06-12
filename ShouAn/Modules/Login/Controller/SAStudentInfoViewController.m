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
    }
    return _studentInfoView;
}

@end
