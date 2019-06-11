//
//  SATabBarController.m
//  ShouAn
//
//  Created by 李凯 on 2019/6/11.
//  Copyright © 2019 LK. All rights reserved.
//

#import "SATabBarController.h"
#import "SANavigationController.h"

@interface SATabBarController ()

@end

@implementation SATabBarController

- (instancetype)init {
    self = [super init];
    
    if (self) {
        [self initViewControllers];
    }
    return self;
}

- (void)initViewControllers {
    [self.tabBar setTintColor:SAGreenColor];
    
    UIViewController *vc1 = [self setupChildViewControllerWithControllerName:@"SAHomeViewController" title:@"首页" imageName:@"TabBar_HomeBar"];
    UIViewController *vc2 = [self setupChildViewControllerWithControllerName:@"SASearchViewController" title:@"搜索" imageName:@"TabBar_Businesses"];
    UIViewController *vc3 = [self setupChildViewControllerWithControllerName:@"SAMessageViewController" title:@"消息" imageName:@"TabBar_Friends"];
    UIViewController *vc4 = [self setupChildViewControllerWithControllerName:@"SAMineViewController" title:@"我的" imageName:@"TabBar_Assets"];
    
    self.viewControllers = @[vc1, vc2, vc3, vc4];
}

- (UIViewController *)setupChildViewControllerWithControllerName: (NSString *)controllerName title: (NSString *)title imageName: (NSString *)imageName {
    Class viewControllerClass = NSClassFromString(controllerName);
    UIViewController *viewController = [[viewControllerClass alloc] init];
    viewController.tabBarItem.image = [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    viewController.tabBarItem.selectedImage = [[UIImage imageNamed:[imageName stringByAppendingString:@"_Sel"]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    viewController.tabBarItem.title = title;
    SANavigationController *nav = [[SANavigationController alloc]initWithRootViewController: viewController];
    return nav;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
