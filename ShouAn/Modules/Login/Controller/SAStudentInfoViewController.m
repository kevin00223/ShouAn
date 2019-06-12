//
//  SAStudentInfoViewController.m
//  ShouAn
//
//  Created by 李凯 on 2019/6/11.
//  Copyright © 2019 LK. All rights reserved.
//

#import "SAStudentInfoViewController.h"
#import "SAStudentInfoTableView.h"

@interface SAStudentInfoViewController ()

@property (nonatomic, strong) SAStudentInfoTableView *studentInfoView;

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
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    [self.studentInfoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

#pragma mark - lazy loading

- (SAStudentInfoTableView *)studentInfoView {
    if (!_studentInfoView) {
        _studentInfoView = [[SAStudentInfoTableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _studentInfoView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
    }
    return _studentInfoView;
}

@end
