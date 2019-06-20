//
//  SALoginViewController.m
//  ShouAn
//
//  Created by 李凯 on 2019/6/11.
//  Copyright © 2019 LK. All rights reserved.
//

#import "SALoginViewController.h"
#import "SATabView.h"
#import "SALoginChildViewController.h"
#import "SARegisterChildViewController.h"
#import "SAContentView.h"

@interface SALoginViewController ()

@property (nonatomic, strong) SATabView *tabView;

@end

@implementation SALoginViewController

- (void)loadView {
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    imageView.image = [UIImage imageNamed:@"loginBackgroundImage"];
    imageView.userInteractionEnabled = YES;
    self.view = imageView;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initSubviews];
}

- (void)initSubviews {
    [self.view addSubview:self.tabView];
    
    SALoginChildViewController *loginChildViewController = [[SALoginChildViewController alloc]init];
    SARegisterChildViewController *registerChildViewController = [[SARegisterChildViewController alloc]init];
    
    NSArray *childVcs = @[loginChildViewController, registerChildViewController];
    
    SAContentView *contentView = [[SAContentView alloc]initWithFrame:CGRectZero childVcs:childVcs parentVC:self];
    
    [self.view addSubview:contentView];
    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.tabView.mas_bottom).offset(20);
        make.left.equalTo(self.view).offset(25);
        make.right.equalTo(self.view).offset(-25);
        make.height.offset(300);
    }];
    
    __weak typeof(self.tabView) weakTab = self.tabView;
    [contentView scrollIndex:^(NSInteger index) {
        NSLog(@"%s---%d---%zd", __func__, __LINE__, index);
        
        [weakTab setCurrentLabel:index];
    }];
    
    
    __weak typeof(contentView) weakContent = contentView;
    [self.tabView pageClick:^(NSInteger index) {
        if (index == 20) {
            NSLog(@"ttt");
            return;
        }
        [weakContent setOffset:index];
    }];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

#pragma mark - lazy loading

- (SATabView *)tabView {
    if (!_tabView) {
        _tabView = [[SATabView alloc]initWithFrame:CGRectMake(40, 150, kScreenWidth-2*40, 70) titles:@[@"登录", @"注册"]];
    }
    return _tabView;
}

@end
