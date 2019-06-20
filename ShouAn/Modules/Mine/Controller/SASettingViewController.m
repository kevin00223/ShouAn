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
//
//        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
//        [userDefaults removeObjectForKey:@"studentNo"];
//        [userDefaults removeObjectForKey:@"password"];
    };
    
    self.settingView.cellSelectedBlock = ^(NSIndexPath * _Nonnull indexPath) {
        __strong __typeof(self) strongSelf = weakSelf;
        switch (indexPath.row) {
            case 0:
                [strongSelf.navigationController pushViewController:[SAFeedbackViewController new] animated:YES];
                break;
            case 1:
                [strongSelf clearFile];
                [strongSelf.settingView.tableView reloadData];
                break;
            case 2: {
                UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"已经是最新版本" preferredStyle:UIAlertControllerStyleAlert];
                UIAlertAction *action = [UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleCancel handler:nil];
                [alert addAction:action];
                [strongSelf presentViewController:alert animated:YES completion:nil];
            }
                break;
            default:
                break;
        }
    };
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    [self.settingView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

#pragma mark - 私有方法

/**
 * 清理缓存
 */
- (void)clearFile {
    NSString *cachePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
    NSArray *files = [[NSFileManager defaultManager] subpathsAtPath:cachePath];
    for (NSString *p in files) {
        NSError *error = nil;
        //获取文件全路径
        NSString *fileAbsolutePath = [cachePath stringByAppendingPathComponent:p];
        
        if ([[NSFileManager defaultManager] fileExistsAtPath:fileAbsolutePath]) {
            [[NSFileManager defaultManager] removeItemAtPath:fileAbsolutePath error:&error];
        }
    }
}

#pragma mark - lazy loading

- (SASettingView *)settingView {
    if (!_settingView) {
        _settingView = [[SASettingView alloc]init];
        _settingView.dataSource = @[@"意见反馈", @"清除缓存", @"检查更新"];
    }
    return _settingView;
}

@end
