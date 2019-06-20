//
//  SASettingViewController.m
//  ShouAn
//
//  Created by 李凯 on 2019/6/12.
//  Copyright © 2019 LK. All rights reserved.
//

#import "SASettingViewController.h"
#import "SASettingView.h"
#import "SAFeedbackViewController.h"
#import "SANavigationController.h"
#import "SALoginViewController.h"

@interface SASettingViewController ()

@property (nonatomic, strong) SASettingView *settingView;

@end

@implementation SASettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initValues];
    [self initSubviews];
}

- (void)initValues {
    self.title = @"设置";
}

- (void)initSubviews {
    [self.view addSubview:self.settingView];
    
    self.settingView.bottomButtonTitle = @"退出登录";
    
    __weak __typeof(self) weakSelf  = self;
    self.settingView.confirmButtonClickedBlock = ^{
        __strong __typeof(self) strongSelf = weakSelf;
        SANavigationController *loginNav = [[SANavigationController alloc]initWithRootViewController:[[SALoginViewController alloc] init]];
        strongSelf.view.window.rootViewController = loginNav;
    };
    
    self.settingView.cellSelectedBlock = ^{
        __strong __typeof(self) strongSelf = weakSelf;
        [strongSelf.navigationController pushViewController:[SAFeedbackViewController new] animated:YES];
    };
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    [self.settingView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

- (SASettingView *)settingView {
    if (!_settingView) {
        _settingView = [[SASettingView alloc]init];
        _settingView.dataSource = @[@"意见反馈", @"清除缓存", @"检查更新"];
    }
    return _settingView;
}

@end
