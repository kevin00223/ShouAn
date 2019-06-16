//
//  SADayOffViewController.m
//  ShouAn
//
//  Created by 李凯 on 2019/6/16.
//  Copyright © 2019 LK. All rights reserved.
//

#import "SADayOffViewController.h"

@interface SADayOffViewController ()

@property (nonatomic, strong) UIView *containerView;

@property (nonatomic, strong) UIButton *bottomButton;

@end

@implementation SADayOffViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initValues];
    [self initSubviews];
}

- (void)initValues {
    self.title = @"学生请假";
}

- (void)initSubviews {
    self.tableView.tableFooterView = self.containerView;
    [self.containerView addSubview:self.bottomButton];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    [self.bottomButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.containerView);
        make.left.equalTo(self.containerView).offset(30);
        make.right.equalTo(self.containerView).offset(-30);
    }];
}

- (void)bottomButtonClicked: (UIButton *)button {
    NSLog(@"点击了提交");
}

- (UIView *)containerView {
    if (!_containerView) {
        _containerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 100)];
    }
    return _containerView;
}

- (UIButton *)bottomButton {
    if (!_bottomButton) {
        _bottomButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_bottomButton setImage:[UIImage imageNamed:@"commit"] forState:UIControlStateNormal];
        [_bottomButton addTarget:self action:@selector(bottomButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
        return _bottomButton;
}

@end
