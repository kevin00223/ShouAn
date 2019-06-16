//
//  SALeaveRecordInfoNormalCell.m
//  ShouAn
//
//  Created by 李凯 on 2019/6/15.
//  Copyright © 2019 LK. All rights reserved.
//

#import "SALeaveRecordInfoNormalCell.h"

@interface SALeaveRecordInfoNormalCell ()

@property (nonatomic, strong) UIImageView *dotImage;
@property (nonatomic, strong) UIView *sepratorLine;

@end

@implementation SALeaveRecordInfoNormalCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initValues];
        [self initSubviews];
    }
    return self;
}

- (void)initValues {
    self.contentLabel.numberOfLines = 1;
}

- (void)initSubviews {
    [self.contentView addSubview:self.dotImage];
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.contentLabel];
    [self.contentView addSubview:self.sepratorLine];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self.dotImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(30);
        make.centerY.equalTo(self.contentView);
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.dotImage.mas_right).offset(15);
        make.centerY.equalTo(self.contentView);
    }];
    
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleLabel.mas_right).offset(5);
        make.centerY.equalTo(self.contentView);
    }];
}

#pragma mark - lazy loading

- (UIImageView *)dotImage {
    if (!_dotImage) {
        _dotImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"dot"]];
    }
    return _dotImage;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.font = [UIFont systemFontOfSize:18];
        [_titleLabel sizeToFit];
    }
    return _titleLabel;
}

- (UILabel *)contentLabel {
    if (!_contentLabel) {
        _contentLabel = [[UILabel alloc]init];
        _contentLabel.font = [UIFont systemFontOfSize:18];
        [_contentLabel sizeToFit];
    }
    return _contentLabel;
}

- (UIView *)sepratorLine {
    if (!_sepratorLine) {
        _sepratorLine = [[UIView alloc]init];
        _sepratorLine.backgroundColor = SAHexColor(0xDCDCDC);
    }
    return _sepratorLine;
}

@end
