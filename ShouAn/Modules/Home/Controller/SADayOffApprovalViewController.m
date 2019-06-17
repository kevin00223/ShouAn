//
//  SADayOffApprovalViewController.m
//  ShouAn
//
//  Created by 李凯 on 2019/6/17.
//  Copyright © 2019 LK. All rights reserved.
//

#import "SADayOffApprovalViewController.h"

@interface SADayOffApprovalViewController ()

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UILabel *contentLabel;

@end

@implementation SADayOffApprovalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initValues];
    [self initSubviews];
}

- (void)initValues {
    self.title = @"请假审批";
}

- (void)initSubviews {
    [self.view addSubview:self.titleLabel];
    [self.view addSubview:self.contentLabel];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(15);
        make.top.equalTo(self.view).offset(30);
    }];
    
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleLabel);
        make.top.equalTo(self.titleLabel.mas_bottom).offset(10);
        make.right.equalTo(self.view).offset(-15);
    }];
}

- (void)setNameText:(NSString *)nameText {
    _nameText = nameText;
    
    self.titleLabel.text = [NSString stringWithFormat:@"您好  %@妈妈", _nameText];
}

#pragma mark - lazy loading

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.font = [UIFont systemFontOfSize:14];
        _titleLabel.textColor = SAHexColor(0x323232);
        [_titleLabel sizeToFit];
    }
    return _titleLabel;
}

- (UILabel *)contentLabel {
    if (!_contentLabel) {
        _contentLabel = [[UILabel alloc]init];
        _contentLabel.numberOfLines = 2;
        _contentLabel.text = @"你的请假审批已经提交，老师将于24小时内给予你回复。请你耐性等待。";
        _contentLabel.font = [UIFont systemFontOfSize:14];
        _contentLabel.textColor = SAHexColor(0x323232);
        [_contentLabel sizeToFit];
    }
    return _contentLabel;
}

@end
