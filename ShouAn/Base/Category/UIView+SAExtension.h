//
//  UIView+SAExtension.h
//  ShouAn
//
//  Created by 李凯 on 2019/6/11.
//  Copyright © 2019 LK. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (SAExtension)

@property (nonatomic, assign) CGFloat left;
@property (nonatomic, assign) CGFloat right;
@property (nonatomic, assign) CGFloat top;
@property (nonatomic, assign) CGFloat bottom;

@property (nonatomic, assign) CGSize size;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGFloat width;

@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;

@property (nonatomic, assign) CGPoint origin;

@end

NS_ASSUME_NONNULL_END
