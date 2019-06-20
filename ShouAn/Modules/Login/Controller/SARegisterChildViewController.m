//
//  SARegisterChildViewController.m
//  ShouAn
//
//  Created by 李凯 on 2019/6/11.
//  Copyright © 2019 LK. All rights reserved.
//

#import "SARegisterChildViewController.h"
#import "SAStudentInfoViewController.h"

@interface SARegisterChildViewController ()

// 学号
@property (nonatomic, strong) UIView *studentNoContainerView;
@property (nonatomic, strong) UITextField *studentNoTextField;

// 密码
@property (nonatomic, strong) UIView *pwdContainerView;
@property (nonatomic, strong) UITextField *pwdTextField;

// 确认密码
@property (nonatomic, strong) UIView *pwdConfirmContainerView;
@property (nonatomic, strong) UITextField *pwdConfirmTextField;

@property (nonatomic, strong) UIButton *registerButton;

@end

@implementation SARegisterChildViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [self initSubviews];
}

- (void)initSubviews {
    [self.view addSubview:self.studentNoContainerView];
    [self.view addSubview:self.pwdContainerView];
    [self.view addSubview:self.pwdConfirmContainerView];
    [self.view addSubview:self.registerButton];
    
    [self.studentNoContainerView addSubview:self.studentNoTextField];
    [self.pwdContainerView addSubview:self.pwdTextField];
    [self.pwdConfirmContainerView addSubview:self.pwdConfirmTextField];
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
    
    [self.pwdConfirmContainerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.pwdContainerView);
        make.top.equalTo(self.pwdContainerView.mas_bottom).offset(25);
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
    
    [self.pwdConfirmTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.pwdConfirmContainerView).offset(10);
        make.top.equalTo(self.pwdConfirmContainerView).offset(5);
        make.right.equalTo(self.pwdConfirmContainerView).offset(-10);
        make.bottom.equalTo(self.pwdConfirmContainerView).offset(-5);
    }];
    
    [self.registerButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.pwdConfirmContainerView);
        make.top.equalTo(self.pwdConfirmContainerView.mas_bottom).offset(30);
        make.height.offset(45);
    }];
}

#pragma mark - private method

- (void)registerButtonClicked: (UIButton *)registerButton {

    if (self.studentNoTextField.text.length > 0 && self.pwdTextField.text.length > 0 && self.pwdConfirmTextField.text.length > 0) {
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"学号错误, 请检查后输入" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleCancel handler:nil];
        [alert addAction:action];
        [self presentViewController:alert animated:YES completion:nil];
    }else{
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"信息不全, 请检查后输入" preferredStyle:UIAlertControllerStyleAlert];
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

- (UIView *)pwdConfirmContainerView {
    if (!_pwdConfirmContainerView) {
        _pwdConfirmContainerView = [[UIView alloc]init];
        _pwdConfirmContainerView.layer.cornerRadius = 22.0;
        _pwdConfirmContainerView.layer.masksToBounds = YES;
        _pwdConfirmContainerView.layer.borderWidth = 1.0;
        _pwdConfirmContainerView.layer.borderColor = SAHexColor(0xDCDCDC).CGColor;
    }
    return _pwdConfirmContainerView;
}

- (UITextField *)pwdConfirmTextField {
    if (!_pwdConfirmTextField) {
        _pwdConfirmTextField = [[UITextField alloc]init];
        _pwdConfirmTextField.font = [UIFont systemFontOfSize:15];
        _pwdConfirmTextField.placeholder = @"再次输入密码";
    }
    return _pwdConfirmTextField;
}

- (UIButton *)registerButton {
    if (!_registerButton) {
        _registerButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _registerButton.layer.cornerRadius = 22.0;
        _registerButton.layer.masksToBounds = YES;
        [_registerButton setTitle:@"注册" forState:UIControlStateNormal];
        [_registerButton setBackgroundColor:SAGreenColor];
        [_registerButton addTarget:self action:@selector(registerButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _registerButton;
}



@end
