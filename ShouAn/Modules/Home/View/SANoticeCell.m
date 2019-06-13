//
//  SANoticeCell.m
//  ShouAn
//
//  Created by 李凯 on 2019/6/13.
//  Copyright © 2019 LK. All rights reserved.
//

#import "SANoticeCell.h"
#import "SARoundCornerShadowView.h"

@interface SANoticeCell ()

@property (nonatomic, strong) SARoundCornerShadowView *shadowView;

@property (nonatomic, strong) UIImageView *titleIcon;

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UIView *sepratorLine;

//年级
@property (nonatomic, strong) UIView *gradeTitleView;
@property (nonatomic, strong) UILabel *gradeInfoLabel;

//时间
@property (nonatomic, strong) UIView *timeTitleView;
@property (nonatomic, strong) UILabel *timeInfoLabel;

//备注
@property (nonatomic, strong) UIView *remarkTitleView;
@property (nonatomic, strong) UITextView *remarkTextView;

@end

@implementation SANoticeCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initSubviews];
    }
    return self;
}

- (void)initSubviews {
    [self.contentView addSubview:self.shadowView];
    [self.shadowView addSubview:self.titleIcon];
    [self.shadowView addSubview:self.titleLabel];
    [self.contentView addSubview:self.sepratorLine];
    [self.contentView addSubview:self.gradeTitleView];
    [self.contentView addSubview:self.gradeInfoLabel];
    [self.contentView addSubview:self.timeTitleView];
    [self.contentView addSubview:self.timeInfoLabel];
    [self.contentView addSubview:self.remarkTitleView];
    [self.contentView addSubview:self.remarkTextView];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    // TODO: LAYOUT
}

#pragma mark - lazy loading

- (SARoundCornerShadowView *)shadowView {
    if (!_shadowView) {
        _shadowView = [[SARoundCornerShadowView alloc]initWithFrame:CGRectZero];
        _shadowView.shadowColor = SAGreenColor;
        _shadowView.shadowRadius = 8.0;
        _shadowView.shadowOpacity = 0.3;
        _shadowView.shadowOffset = CGSizeMake(5, 5);
        _shadowView.cornerRadius = 8.0;
    }
    return _shadowView;
}

- (UIImageView *)titleIcon {
    if (!_titleIcon) {
        _titleIcon = [[UIImageView alloc]init];
    }
    return _titleIcon;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
    }
    return _titleLabel;
}

- (UIView *)sepratorLine {
    if (!_sepratorLine) {
        _sepratorLine = [[UIView alloc]init];
        _sepratorLine.backgroundColor = SAHexColor(0xDCDCDC);
    }
    return _sepratorLine;
}

@end
