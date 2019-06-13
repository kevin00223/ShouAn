//
//  SAFeedbackViewController.m
//  ShouAn
//
//  Created by 李凯 on 2019/6/12.
//  Copyright © 2019 LK. All rights reserved.
//

#import "SAFeedbackViewController.h"

@interface SAFeedbackViewController ()

@property (nonatomic, strong) UITextView *textView;

@property (nonatomic, strong) UIButton *confirmButton;

@end

@implementation SAFeedbackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initValues];
    [self initSubviews];
}

- (void)initValues {
    self.title = @"意见反馈";
}

- (void)initSubviews {
    [self.view addSubview:self.textView];
    [self.view addSubview:self.confirmButton];
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panGesture:)];
    [self.view addGestureRecognizer:pan];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    [self.textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(15);
        make.top.equalTo(self.view).offset(20);
        make.right.equalTo(self.view).offset(-15);
        make.height.offset(240);
    }];
    
    [self.confirmButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(20);
        make.right.equalTo(self.view).offset(-20);
        make.height.offset(45);
        make.top.equalTo(self.textView.mas_bottom).offset(30);
    }];
}

- (void)confirmButtonClicked: (UIButton *)confirmButton {
    NSLog(@"点了确认-反馈页");
}

- (void)panGesture: (UIGestureRecognizer *)panGesture {
    [self.view endEditing:YES];
}

- (UITextView *)textView {
    if (!_textView) {
        _textView = [[UITextView alloc]init];
        _textView.backgroundColor = SAHexColor(0xF0F0F0);
        _textView.textColor = SAHexColor(0x959595);
        _textView.font = [UIFont systemFontOfSize:14];
        UILabel *placeHolderLabel = [[UILabel alloc] init];
        placeHolderLabel.text = @"欢迎给出宝贵意见";
        placeHolderLabel.textColor = SAHexColor(0x959595);
        placeHolderLabel.font = [UIFont systemFontOfSize:14];
        [placeHolderLabel sizeToFit];
        [_textView addSubview:placeHolderLabel];
        [_textView setValue:placeHolderLabel forKey:@"_placeholderLabel"];
    }
    return _textView;
}

- (UIButton *)confirmButton {
    if (!_confirmButton) {
        _confirmButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _confirmButton.layer.cornerRadius = 22.0;
        _confirmButton.layer.masksToBounds = YES;
        [_confirmButton setTitle:@"确认" forState:UIControlStateNormal];
        [_confirmButton setBackgroundColor:SAGreenColor];
        [_confirmButton addTarget:self action:@selector(confirmButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _confirmButton;
}

@end
