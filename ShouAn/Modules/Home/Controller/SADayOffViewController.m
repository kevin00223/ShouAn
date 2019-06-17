//
//  SADayOffViewController.m
//  ShouAn
//
//  Created by 李凯 on 2019/6/16.
//  Copyright © 2019 LK. All rights reserved.
//

#import "SADayOffViewController.h"
#import "SADayOffApprovalViewController.h"

@interface SADayOffViewController ()

@property (nonatomic, strong) UIView *containerView;

@property (nonatomic, strong) UIButton *bottomButton;

@property (weak, nonatomic) IBOutlet UITextField *studentNameTextField;

@property (weak, nonatomic) IBOutlet UITextField *gradeTextField;

@property (weak, nonatomic) IBOutlet UITextField *parentNameTextField;

@property (weak, nonatomic) IBOutlet UITextField *typeTextField;

@property (weak, nonatomic) IBOutlet UITextField *reasonTextField;

@property (weak, nonatomic) IBOutlet UITextField *startTimeTextField;

@property (weak, nonatomic) IBOutlet UITextField *endTimeTextField;

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
    
    if (self.studentNameTextField.text.length != 0 && self.gradeTextField.text.length != 0 && self.parentNameTextField.text.length != 0 && self.typeTextField.text.length !=0 && self.reasonTextField.text.length != 0 && self.startTimeTextField.text.length !=0 && self.endTimeTextField.text.length !=0) {
        
        SADayOffApprovalViewController *vc = [SADayOffApprovalViewController new];
        [self.navigationController pushViewController:vc animated:YES];
        vc.nameText = self.parentNameTextField.text;
    }else{
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"请完善信息" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:nil];
        [alert addAction:action];
        [self presentViewController:alert animated:YES completion:nil];
    }
    
    
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
