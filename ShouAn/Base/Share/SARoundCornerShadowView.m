//
//  SARoundCornerShadowView.m
//  ShouAn
//
//  Created by 李凯 on 2019/6/13.
//  Copyright © 2019 LK. All rights reserved.
//

#import "SARoundCornerShadowView.h"

@interface SARoundCornerShadowView ()

@property (nonatomic, strong) UIView *shadowView;

@property (nonatomic, strong) UIView *containerView;

@end

@implementation SARoundCornerShadowView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initSubviews];
    }
    return self;
}

- (void)initSubviews {
    [self addSubview:self.shadowView];
    [self addSubview:self.containerView];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self.shadowView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    
    [self.containerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
}

- (void)setCornerRadius:(CGFloat)cornerRadius {
    self.shadowView.layer.cornerRadius = cornerRadius;
    self.containerView.layer.cornerRadius = cornerRadius;
}

- (void)setShadowColor:(UIColor *)shadowColor {
    self.shadowView.layer.shadowColor = shadowColor.CGColor;
}

- (void)setShadowOffset:(CGSize)shadowOffset {
    self.shadowView.layer.shadowOffset = shadowOffset;
}

- (void)setShadowOpacity:(float)shadowOpacity {
    self.shadowView.layer.shadowOpacity = shadowOpacity;
}

- (void)setShadowRadius:(CGFloat)shadowRadius {
    self.shadowView.layer.shadowRadius = shadowRadius;
}

#pragma mark - lazy loading

- (UIView *)shadowView {
    if (!_shadowView) {
        _shadowView = [[UIView alloc]init];
        _shadowView.backgroundColor = [UIColor whiteColor];
        _shadowView.clipsToBounds = NO;
    }
    return _shadowView;
}

- (UIView *)containerView {
    if (!_containerView) {
        _containerView = [[UIView alloc]init];
        _containerView.backgroundColor = [UIColor whiteColor];
        _containerView.layer.masksToBounds = YES;
    }
    return _containerView;
}


@end
