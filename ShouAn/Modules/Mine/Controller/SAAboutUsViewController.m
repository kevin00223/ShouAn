//
//  SAAboutUsViewController.m
//  ShouAn
//
//  Created by 李凯 on 2019/6/12.
//  Copyright © 2019 LK. All rights reserved.
//

#import "SAAboutUsViewController.h"

@interface SAAboutUsViewController ()

@property (nonatomic, strong) UIImageView *iconView;

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UIView *shadowView;

@property (nonatomic, strong) UIView *containerView;

@property (nonatomic, strong) UILabel *aboutUsLabel;

@property (nonatomic, strong) UILabel *contactLabel;

@end

@implementation SAAboutUsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initValues];
    [self initSubviews];
}

- (void)initValues {
    self.title = @"关于我们";
}

- (void)initSubviews {
    
    [self.view addSubview:self.iconView];
    [self.view addSubview:self.titleLabel];
    [self.view addSubview:self.shadowView];
    [self.view addSubview:self.containerView];
    [self.containerView addSubview:self.aboutUsLabel];
    [self.view addSubview:self.contactLabel];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.view).offset(20);
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.iconView.mas_bottom).offset(10);
    }];
    
    [self.shadowView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(15);
        make.top.equalTo(self.titleLabel.mas_bottom).offset(20);
        make.right.equalTo(self.view).offset(-15);
        make.height.offset(150);
    }];
    
    [self.containerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.shadowView);
    }];
    
    [self.aboutUsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.containerView).offset(20);
        make.right.equalTo(self.containerView).offset(-20);
        make.top.equalTo(self.containerView).offset(30);
        make.bottom.equalTo(self.containerView).offset(-30);
    }];
    
    [self.contactLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.shadowView.mas_bottom).offset(50);
        make.left.right.equalTo(self.shadowView);
        make.height.offset(20);
    }];
}

#pragma mark - lazy loading

- (UIImageView *)iconView {
    if (!_iconView) {
        _iconView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"appIcon"]];
    }
    return _iconView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.text = @"寿安中学";
        _titleLabel.textColor = SAGreenColor;
        _titleLabel.font = [UIFont systemFontOfSize:30];
        [_titleLabel sizeToFit];
    }
    return _titleLabel;
}

- (UIView *)shadowView {
    if (!_shadowView) {
        _shadowView = [[UIView alloc]init];
        _shadowView.backgroundColor = [UIColor whiteColor];
        _shadowView.layer.shadowColor = [UIColor lightGrayColor].CGColor;
        _shadowView.layer.shadowOffset = CGSizeMake(5, 5);
        _shadowView.layer.shadowOpacity = 0.3;
        _shadowView.layer.shadowRadius = 8.0;
        _shadowView.layer.cornerRadius = 8.0;
        _shadowView.clipsToBounds = NO;
    }
    return _shadowView;
}

- (UIView *)containerView {
    if (!_containerView) {
        _containerView = [[UIView alloc]init];
        _containerView.backgroundColor = [UIColor whiteColor];
        _containerView.layer.cornerRadius = 8.0;
        _containerView.layer.masksToBounds = YES;
    }
    return _containerView;
}

- (UILabel *)aboutUsLabel {
    if (!_aboutUsLabel) {
        _aboutUsLabel = [[UILabel alloc]init];
        _aboutUsLabel.text = @"寿安中学家长端app是寿安中学推出的家校互动软件。方便家长用户通过手机及时了解孩子的学习和生活状况。是一个比较实用的家校沟通客";
        _aboutUsLabel.numberOfLines = 0;
        _aboutUsLabel.textColor = SAHexColor(0x646464);
        _aboutUsLabel.font = [UIFont systemFontOfSize:15];
        [_aboutUsLabel sizeToFit];
    }
    return _aboutUsLabel;
}

- (UILabel *)contactLabel {
    if (!_contactLabel) {
        _contactLabel = [[UILabel alloc]init];
        _contactLabel.text = @"联系电话：028-61412838";
        _contactLabel.textColor = SAHexColor(0x323232);
        _contactLabel.font = [UIFont systemFontOfSize:15];
    }
    return _contactLabel;
}

@end
