//
//  SAContactListCell.m
//  ShouAn
//
//  Created by 李凯 on 2019/6/17.
//  Copyright © 2019 LK. All rights reserved.
//

#import "SAContactListCell.h"

@interface SAContactListCell ()

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UILabel *numberLabel;

@end

@implementation SAContactListCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initSubviews];
    }
    return self;
}

- (void)initSubviews {
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.numberLabel];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(15);
        make.centerY.equalTo(self.contentView);
    }];
    
    [self.numberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView).offset(-15);
        make.centerY.equalTo(self.contentView);
    }];
}

- (void)setModel:(SAContactListModel *)model {
    _model = model;
    
    self.titleLabel.text = model.title;
    self.numberLabel.text = model.number;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        [_titleLabel sizeToFit];
        _titleLabel.font = [UIFont systemFontOfSize:15];
        _titleLabel.textColor = SAHexColor(0x646464);
    }
    return _titleLabel;
}

- (UILabel *)numberLabel {
    if (!_numberLabel) {
        _numberLabel = [[UILabel alloc]init];
        [_numberLabel sizeToFit];
        _numberLabel.font = [UIFont systemFontOfSize:15];
        _numberLabel.textColor = SAHexColor(0x333333);
    }
    return _numberLabel;
}

@end
