//
//  SAContentView.h
//  ShouAn
//
//  Created by 李凯 on 2019/6/11.
//  Copyright © 2019 LK. All rights reserved.
//

#import "SAView.h"

NS_ASSUME_NONNULL_BEGIN

typedef void (^ScrollViewBlock)(NSInteger index);

@interface SAContentView : SAView

- (instancetype)initWithFrame:(CGRect)frame childVcs:(NSArray *)childVcs parentVC:(UIViewController *)parentVC;
//通知控制器的 block
- (void)scrollIndex:(ScrollViewBlock)block;
//控制器调用此方法设置偏移
- (void)setOffset:(NSInteger)page;

@end

NS_ASSUME_NONNULL_END
