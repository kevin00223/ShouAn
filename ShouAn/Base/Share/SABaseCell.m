//
//  SABaseCell.m
//  ShouAn
//
//  Created by 李凯 on 2019/6/13.
//  Copyright © 2019 LK. All rights reserved.
//

#import "SABaseCell.h"

@interface SABaseCell ()

@property (nonatomic, strong) UIView *sepratorLine;

@end

@implementation SABaseCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initSubviews];
    }
    return self;
}

- (void)initSubviews {
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.sepratorLine];
    [self.contentView addSubview:self.subTitleLabel];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.left.equalTo(self.contentView).offset(15);
        make.width.offset(100);
    }];
    
    [self.subTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.width.offset(100);
        make.right.equalTo(self.contentView).offset(18);
    }];
    
    [self.sepratorLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.equalTo(self.contentView);
        make.height.offset(1/[UIScreen mainScreen].scale);
    }];
}

#pragma mark - lazy loading

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.font = [UIFont systemFontOfSize:15];
        _titleLabel.textColor = SAHexColor(0x646464);
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

- (UILabel *)subTitleLabel {
    if (!_subTitleLabel) {
        _subTitleLabel = [[UILabel alloc]init];
        _subTitleLabel.font = [UIFont systemFontOfSize:15];
        _subTitleLabel.textColor = SAHexColor(0x646464);
    }
    return _subTitleLabel;
}


@end
