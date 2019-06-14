//
//  SASearchCell.m
//  ShouAn
//
//  Created by 李凯 on 2019/6/14.
//  Copyright © 2019 LK. All rights reserved.
//

#import "SASearchCell.h"
#import "SARoundCornerShadowView.h"

@interface SASearchCell ()

@property (nonatomic, strong) SARoundCornerShadowView *shadowView;

@property (nonatomic, strong) UIImageView *iconView;

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UILabel *introlLabel;

@end

@implementation SASearchCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initSubviews];
    }
    return self;
}

- (void)initSubviews {
    [self.contentView addSubview:self.shadowView];
    [self.shadowView addSubview:self.iconView];
    [self.shadowView addSubview:self.titleLabel];
    [self.shadowView addSubview:self.introlLabel];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self.shadowView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self.contentView).offset(10);
        make.right.bottom.equalTo(self.contentView).offset(-10);
    }];
    
    [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.offset(130);
        make.height.offset(82);
        make.left.equalTo(self.shadowView).offset(15);
        make.centerY.equalTo(self.shadowView);
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.iconView.mas_right).offset(25);
        make.top.equalTo(self.iconView).offset(15);
    }];
    
    [self.introlLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.iconView.mas_right).offset(25);
        make.bottom.equalTo(self.iconView).offset(-15);
    }];
}

- (void)setSearchModel:(SASearchModel *)searchModel {
    _searchModel = searchModel;
    
    self.iconView.image = [UIImage imageNamed:_searchModel.iconImage];
    self.titleLabel.text = _searchModel.title;
    self.introlLabel.text = _searchModel.intro;
    
    if ([_searchModel.titleColor isEqualToString:@"blue"]) {
        self.titleLabel.textColor = SAHexColor(0x2AA9FF);
    }else if([_searchModel.titleColor isEqualToString:@"green"]){
        self.titleLabel.textColor = SAHexColor(0x62CD37);
    }else if([_searchModel.titleColor isEqualToString:@"yellow"]){
        self.titleLabel.textColor = SAHexColor(0xFFC323);
    }else if([_searchModel.titleColor isEqualToString:@"red"]){
        self.titleLabel.textColor = SAHexColor(0xFF5A2D);
    }
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

- (UIImageView *)iconView {
    if (!_iconView) {
        _iconView = [[UIImageView alloc]init];
    }
    return _iconView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.font = [UIFont systemFontOfSize:20];
        [_titleLabel sizeToFit];
    }
    return _titleLabel;
}

- (UILabel *)introlLabel {
    if (!_introlLabel) {
        _introlLabel = [[UILabel alloc]init];
        _introlLabel.font = [UIFont systemFontOfSize:13];
        _introlLabel.textColor = SAHexColor(0x979797);
        [_introlLabel sizeToFit];
    }
    return _introlLabel;
}

@end
