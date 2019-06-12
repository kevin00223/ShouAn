//
//  SAChangePwdViewController.m
//  ShouAn
//
//  Created by 李凯 on 2019/6/12.
//  Copyright © 2019 LK. All rights reserved.
//

#import "SAChangePwdViewController.h"
#import "SAChangePwdView.h"

@interface SAChangePwdViewController ()

@property (nonatomic, strong) SAChangePwdView *changePwdView;

@end

@implementation SAChangePwdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initValues];
    [self initSubviews];
}

- (void)initValues {
    self.title = @"修改密码";
}

- (void)initSubviews {
    [self.view addSubview:self.changePwdView];
    
    self.changePwdView.confirmButtonClickedBlock = ^{
        NSLog(@"确认修改密码");
    };
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    [self.changePwdView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

#pragma mark - lazy loading

- (SAChangePwdView *)changePwdView {
    if (!_changePwdView) {
        _changePwdView = [[SAChangePwdView alloc]init];
        _changePwdView.dataSource = @[@"账号:", @"旧密码:", @"新密码:", @"确认新密码:"];
    }
    return _changePwdView;
}

@end
