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


@property (nonatomic, strong) UIImageView *firstImage;
@property (nonatomic, strong) UILabel *firstInfoLabel;


@property (nonatomic, strong) UIImageView *secondImage;
@property (nonatomic, strong) UILabel *secondInfoLabel;


@property (nonatomic, strong) UIImageView *thirdImage;
@property (nonatomic, strong) UILabel *thirdInfoLabel;

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
    [self.shadowView addSubview:self.sepratorLine];
    
    [self.shadowView addSubview:self.firstImage];
    [self.shadowView addSubview:self.firstInfoLabel];
    
    [self.shadowView addSubview:self.secondImage];
    [self.shadowView addSubview:self.secondInfoLabel];

    [self.shadowView addSubview:self.thirdImage];
    [self.shadowView addSubview:self.thirdInfoLabel];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self.shadowView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self.contentView).offset(10);
        make.right.bottom.equalTo(self.contentView).offset(-10);
    }];
    
    [self.titleIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.shadowView).offset(20);
        make.top.equalTo(self.shadowView).offset(10);
        make.width.height.offset(24);
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleIcon.mas_right).offset(15);
        make.top.equalTo(self.shadowView).offset(10);
    }];
    
    [self.sepratorLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.shadowView);
        make.top.equalTo(self.titleIcon.mas_bottom).offset(10);
        make.height.offset(1/[UIScreen mainScreen].scale);
    }];
    
    [self.firstImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.sepratorLine.mas_bottom).offset(20);
        make.left.equalTo(self.shadowView).offset(15);
        make.width.height.offset(6);
    }];
    
    [self.firstInfoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.firstImage).offset(-8);
        make.left.equalTo(self.firstImage.mas_right).offset(10);
    }];
    
    [self.secondImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.shadowView).offset(15);
        make.top.equalTo(self.sepratorLine.mas_bottom).offset(45);
        make.width.height.offset(6);
    }];

    [self.secondInfoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.secondImage).offset(-8);
        make.left.equalTo(self.secondImage.mas_right).offset(10);
    }];

    [self.thirdImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.shadowView).offset(15);
        make.top.equalTo(self.sepratorLine.mas_bottom).offset(70);
        make.width.height.offset(6);
    }];

    [self.thirdInfoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.thirdImage).offset(-8);
        make.left.equalTo(self.thirdImage.mas_right).offset(10);
        make.right.equalTo(self.shadowView).offset(-15);
    }];
}

- (void)setNoticeModel:(SANoticeModel *)noticeModel {
    _noticeModel = noticeModel;
    
    self.titleLabel.text = _noticeModel.title;
    self.firstInfoLabel.text = _noticeModel.firstInfo;
    self.secondInfoLabel.text = _noticeModel.secondInfo;
    self.thirdInfoLabel.text = _noticeModel.thirdInfo;
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
        _titleIcon = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"noticeAlarm"]];
    }
    return _titleIcon;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        [_titleLabel sizeToFit];
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

- (UIImageView *)firstImage {
    if (!_firstImage) {
        _firstImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"dot"]];
    };
    return _firstImage;
}

- (UILabel *)firstInfoLabel {
    if (!_firstInfoLabel) {
        _firstInfoLabel = [[UILabel alloc]init];
        [_firstInfoLabel sizeToFit];
    }
    return _firstInfoLabel;
}

- (UIImageView *)secondImage {
    if (!_secondImage) {
        _secondImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"dot"]];
    }
    return _secondImage;
}

- (UILabel *)secondInfoLabel {
    if (!_secondInfoLabel) {
        _secondInfoLabel = [[UILabel alloc]init];
        [_secondInfoLabel sizeToFit];
    }
    return _secondInfoLabel;
}

- (UIImageView *)thirdImage {
    if (!_thirdImage) {
        _thirdImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"dot"]];
    }
    return _thirdImage;
}

- (UILabel *)thirdInfoLabel {
    if (!_thirdInfoLabel) {
        _thirdInfoLabel = [[UILabel alloc]init];
        _thirdInfoLabel.numberOfLines = 0;
    }
    return _thirdInfoLabel;
}

@end
