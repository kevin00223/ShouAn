//
//  SALoginChildViewController.m
//  ShouAn
//
//  Created by 李凯 on 2019/6/11.
//  Copyright © 2019 LK. All rights reserved.
//

#import "SALoginChildViewController.h"
#import "SATabBarController.h"

@interface SALoginChildViewController ()

// 学号
@property (nonatomic, strong) UIView *studentNoContainerView;
@property (nonatomic, strong) UITextField *studentNoTextField;

// 密码
@property (nonatomic, strong) UIView *pwdContainerView;
@property (nonatomic, strong) UITextField *pwdTextField;

@property (nonatomic, strong) UIButton *loginButton;

@end

@implementation SALoginChildViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initSubviews];
}

- (void)initSubviews {
    [self.view addSubview:self.studentNoContainerView];
    [self.view addSubview:self.pwdContainerView];
    [self.view addSubview:self.loginButton];
    
    [self.studentNoContainerView addSubview:self.studentNoTextField];
    [self.pwdContainerView addSubview:self.pwdTextField];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    [self.studentNoContainerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self.view).offset(20);
        make.right.equalTo(self.view).offset(-20);
        make.height.offset(45);
    }];
    
    [self.pwdContainerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.studentNoContainerView);
        make.top.equalTo(self.studentNoContainerView.mas_bottom).offset(25);
        make.height.offset(45);
    }];
    
    [self.studentNoTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.studentNoContainerView).offset(10);
        make.top.equalTo(self.studentNoContainerView).offset(5);
        make.right.equalTo(self.studentNoContainerView).offset(-10);
        make.bottom.equalTo(self.studentNoContainerView).offset(-5);
    }];
    
    [self.pwdTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.pwdContainerView).offset(10);
        make.top.equalTo(self.pwdContainerView).offset(5);
        make.right.equalTo(self.pwdContainerView).offset(-10);
        make.bottom.equalTo(self.pwdContainerView).offset(-5);
    }];
    
    [self.loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.pwdContainerView);
        make.top.equalTo(self.pwdContainerView.mas_bottom).offset(30);
        make.height.offset(45);
    }];
}

#pragma mark - private method

- (void)loginButtonClicked: (UIButton *)loginButton {
    
    if ([self.studentNoTextField.text isEqualToString:@"160601"] && [self.pwdTextField.text isEqualToString:@"123123"]) {
        
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        [userDefaults setObject:@"160601" forKey:@"studentNo"];
        [userDefaults setObject:@"123123" forKey:@"password"];
        
        SATabBarController *tabBarVC = [[SATabBarController alloc]init];
        [UIApplication sharedApplication].delegate.window.rootViewController = tabBarVC;
    }else{
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"信息有误, 请检查后重新输入" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleCancel handler:nil];
        [alert addAction:action];
        [self presentViewController:alert animated:YES completion:nil];
    }
    
}

#pragma mark - lazy loading

- (UIView *)studentNoContainerView {
    if (!_studentNoContainerView) {
        _studentNoContainerView = [[UIView alloc]init];
        _studentNoContainerView.layer.cornerRadius = 22.0;
        _studentNoContainerView.layer.masksToBounds = YES;
        _studentNoContainerView.layer.borderWidth = 1.0;
        _studentNoContainerView.layer.borderColor = SAHexColor(0xDCDCDC).CGColor;
    }
    return _studentNoContainerView;
}

- (UITextField *)studentNoTextField {
    if (!_studentNoTextField) {
        _studentNoTextField = [[UITextField alloc]init];
        _studentNoTextField.font = [UIFont systemFontOfSize:15];
        _studentNoTextField.placeholder = @"请输入学号";
    }
    return _studentNoTextField;
}

- (UIView *)pwdContainerView {
    if (!_pwdContainerView) {
        _pwdContainerView = [[UIView alloc]init];
        _pwdContainerView.layer.cornerRadius = 22.0;
        _pwdContainerView.layer.masksToBounds = YES;
        _pwdContainerView.layer.borderWidth = 1.0;
        _pwdContainerView.layer.borderColor = SAHexColor(0xDCDCDC).CGColor;
    }
    return _pwdContainerView;
}

- (UITextField *)pwdTextField {
    if (!_pwdTextField) {
        _pwdTextField = [[UITextField alloc]init];
        _pwdTextField.font = [UIFont systemFontOfSize:15];
        _pwdTextField.placeholder = @"请输密码";
    }
    return _pwdTextField;
}

- (UIButton *)loginButton {
    if (!_loginButton) {
        _loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _loginButton.layer.cornerRadius = 22.0;
        _loginButton.layer.masksToBounds = YES;
        [_loginButton setTitle:@"登录" forState:UIControlStateNormal];
        [_loginButton setBackgroundColor:SAGreenColor];
        [_loginButton addTarget:self action:@selector(loginButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _loginButton;
}

@end
