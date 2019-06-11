//
//  SATabView.h
//  ShouAn
//
//  Created by 李凯 on 2019/6/11.
//  Copyright © 2019 LK. All rights reserved.
//

#import "SAView.h"

NS_ASSUME_NONNULL_BEGIN

typedef void (^PageTapBlock) (NSInteger index);

@interface SATabView : SAView

/* 标题数组 */
@property(nonatomic,strong) NSArray *titles;

- (instancetype)initWithFrame:(CGRect)frame titles:(NSArray *)titles;

//通知控制器发生了点击
- (void)pageClick:(PageTapBlock)block;

//给外界通过这个方法设置当前显示
- (void)setCurrentLabel:(NSInteger)index;

@end

NS_ASSUME_NONNULL_END
