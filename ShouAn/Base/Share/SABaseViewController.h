//
//  SABaseViewController.h
//  ShouAn
//
//  Created by 李凯 on 2019/6/11.
//  Copyright © 2019 LK. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SABaseViewController : UIViewController

/**
 * 获取父控制器
 */
- (UIViewController *)parentViewController;

@end

NS_ASSUME_NONNULL_END
